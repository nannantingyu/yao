<?php

namespace Home\Controller;
use Think\Controller;

class GoodsController extends HomeController
{
    //加入购物车
    public function addCart()
    {
        $goodsid = I('post.gid');
        $allCart = session('cart');

        //判断购物车是否已经存在该商品
        if(is_array($allCart) && !is_null($allCart[$goodsid]))
        {
            $allCart[$goodsid] ++;
        }
        else
        {
            $allCart[$goodsid] = 1;
        }

        session('cart', $allCart);

        //如果已经登录，存入数据库
        if($uid = home_login()){
            $mcart = M('cart');
            $cartGoods = $mcart->where(array('goods_id'=>$goodsid))->find();
            if($cartGoods){
                $cartGoods['goods_number'] ++;
            }
            else
            {
                $cartGoods['user_id'] = $uid;
                $cartGoods['goods_id'] = $goodsid;
                $cartGoods['goods_number'] = 1;
                $cartGoods['session_id'] = session_id();

                $mcart->add($cartGoods);
            }
        }
        $this->ajaxReturn(array('state'=>1, 'count'=>count($allCart), 'gid'=>$goodsid, 'uid'=>$uid));
    }

    /**
     * 购物车
     */
    public function cart(){
        $data = $this->reviewcart();
        $this->assign('gsprice', $data['gsprice']);
        $this->assign('gpprice', $data['gpprice']);
        $this->assign('cartGoods', $data['allCart']);
        $this->assign('allCount', $data['allCount']);
        $this->display();
    }
    public function reviewcart($cart = null){
        if(is_null($cart))
        {
            $cart = session('cart');
        }

        if(is_null($cart)){
            $this->error('购物车还没有东西，马上去添加吧！', '/');
        }

        $data = $this->countPrice($cart);
        return $data;
    }
    public function category()
    {
        $cid = I('get.cid', 0);
        $catname = M('category')->field('cat_name, cat_id, parent_id')->find($cid);

        if($catname){
            if($catname['parent_id'] != 0){
                $parent = M('category')->field('cat_name, cat_id')->find($catname['parent_id']);
                $this->assign('parent', $parent);
            }
            $catname = $catname['cat_name'];
        }
        else
        {
            $catname = '商品';
        }

        $this->assign('cname', $catname);

        $where = array();
        if($cid){
            $allcatids = M('category')->where(array('parent_id'=>$cid))->getField('cat_id', true);
            $allcatids[] = $cid;
            $where['cat_id'] = array('in', $allcatids);
        }

        $categories = M('category')->limit(4)->select();
        $brands = M('brand')->limit(6)->select();
        $latest = M('goods')->limit(3)->order('add_time desc')->select();

        $this->assign('latest', $latest);
        $this->assign('categories', $categories);
        $this->assign('brands', $brands);

        $typeGoods = $this->lists('goods', $where, 'add_time desc');
        $this->assign('typeGoods', $typeGoods);
        $this->display();
    }

    public function updateCount(){
        $allCart = session('cart');
        $gid = I('post.gid');
        $allCart[$gid] = I('post.cou');

        session('cart', $allCart);

        $data = $this->countPrice($allCart);

        $this->ajaxReturn(array('state'=>1, 'gsprice'=>$data['gsprice'], 'gpprice'=>$data['gpprice'], 'allCount'=>$data['allCount']));
    }

    protected function countPrice($cart){
        $cartids = array();
        foreach($cart as $key=>$val){
            $cartids[] = $key;
        }

        $cartGoods = M('goods')->where(array('goods_id'=>array('in', $cartids)))->select();
        $goodsShopPrice = 0;
        $goodsPromotedPrice = 0;
        foreach($cartGoods as $key=>$val){
            $cartGoods[$key]['count'] = $cart[$cartGoods[$key]['goods_id']];
            $goodsShopPrice += $cartGoods[$key]['shop_price']*$cartGoods[$key]['count'];
            $goodsPromotedPrice += $cartGoods[$key]['promote_price']*$cartGoods[$key]['count'];
        }

        return $data = array('gsprice'=>$goodsShopPrice, 'gpprice'=>$goodsShopPrice-$goodsPromotedPrice, 'allCart'=>$cartGoods, 'allCount'=>$goodsPromotedPrice);
    }

    public function changeGoods(){
        $type = I('post.type');
        $index = I('post.index');
    }

    public function delCart(){
        $goodsid = I('post.id');
        if($uid = home_login()){
            M('cart')->where(array('goods_id'=>$goodsid))->delete();
            $allCart = session('cart');
            if($allCart[$goodsid]){
                unset($allCart[$goodsid]);
            }

            session('cart', $allCart);
        }

        $this->ajaxReturn(array('state'=>1));
    }

    public function checkall(){
        $order_id = I('post.oid');
        $user = M('users')->where(array('user_id'=>session('uid')))->find();

        //获取当前用户没有关闭的订单
        $orders = M('order_info')->where(array('user_id'=>$user['user_id'], 'order_status'=>array('neq', 2)))->select();
        $orderGoods = array();
        foreach($orders as $key=>$val){
            $orderGoods[$val['order_id']] = M('order_goods')
                ->join('zc_goods on zc_goods.goods_id = zc_order_goods.goods_id')
                ->where(array('order_id'=>$val['order_id']))->select();
        }

        //将当前订单状态改为已支付
        M('order_info')->where(array('order_id'=>$order_id))->save(array('order_status'=>1));
        $sql = M('order_info')->getLastSql();
        //发送邮件
        $emailHtml = '';
        foreach ($orderGoods as $key=>$val) {
            $html = '<table style="margin-bottom: 30px;"><tr><th width="60px"></th><th width="120px">商品</th><th width="90px">促销价</th><th width="70px">状态</th></tr>';

            foreach($val as $k=>$v){
                $html .= '<tr><td><img width="60" height="60" alt="'.$v['goods_img'].'" src="http://www.yjshare.cn'.$v['goods_img'].'"/></td><td>'.$v['goods_name'].'</td><td>'.$v['promote_price'].'</td><td>配送中</td></tr>';

                //删除购物车
                M('cart')->where(array('goods_id'=>$v['goods_id']))->delete();
                $allCart = session('cart');
                if($allCart[$v['goods_id']]){
                    unset($allCart[$v['goods_id']]);
                }

                session('cart', $allCart);
            }

            $html .= '</table>';

            $emailHtml .= $html;
        }
        $emailHtml .= '您的订单已经在路上了，请耐心等待啊！ 去官网看看吧^_^。http://www.yjshare.cn';
        sendMail($user['email'], 'ZCStore，您的订单支付成功！', $emailHtml);

        $this->ajaxReturn(array('state'=>1, 'sql'=>$sql));
    }

    public function checkodinfo(){          //提交订单

        if(!home_login()){
            $this->error('你还没有登录，先去登录吧！', '/home/user/account.html');
        }

        $user = M('Users')->where(array('user_id'=>session('uid')))->find();

        $ids = I('post.ids');
        $cous = I('post.cous');
        $carts = array();

        $order = array();
        $order['user_id'] = $user['user_id'];
        $order['order_status'] = 0;
        $order['country'] = '中国';
        $order['province'] = $user['province'];
        $order['city'] = $user['city'];
        $order['district'] = $user['county'];
        $order['address'] = $user['address'];
        $order['mobile'] = $user['phone'];
        $order['email'] = $user['email'];
        $order['add_time'] = time();

        $order = M('order_info')->add($order);

        for($i = 0, $max = count($ids); $i < $max; $i ++){
            $carts[$ids[$i]] = $cous[$i];

            $ordergoods = array();
            $ordergoods['order_id'] = $order;
            $ordergoods['goods_id'] = $ids[$i];
            $goods = M('goods')->where(array('goods_id'=>$ids[$i]))->find();
            $ordergoods['goods_name'] = $goods['goods_name'];
            $ordergoods['goods_number'] = $cous[$i];
            $ordergoods['market_price'] = $cous[$i]*$goods['shop_price'];
            $ordergoods['goods_price'] = $cous[$i]*$goods['promote_price'];

            M('order_goods')->add($ordergoods);
        }

        $this->ajaxReturn(array('state'=>1, 'order'=>$order, 'sql'=>M('order_info')->getLastSql()));
    }

    public function checkOrder(){
        $orderid = I('get.order');
        $carts = M('order_goods')->where(array('order_id'=>$orderid))->getField('goods_id, goods_number', true);

        $user = M('Users')->where(array('user_id'=>session('uid')))->find();
        $addresses = M('region')->where(array('region_id'=>array('in', array($user['province'], $user['city'], $user['county']))))->getField('region_type, region_id, region_name', true);
        $address = $addresses[1]['region_name'].'&nbsp;&gt;&gt;&nbsp;'.$addresses[2]['region_name'].'&nbsp;&gt;&gt;&nbsp;'.$addresses[3]['region_name'].'&nbsp;&gt;&gt;&nbsp;'.$user['address'];
        $this->assign('address', $address);

        $this->assign('oid', $orderid);

        $data = $this->reviewcart($carts);
        $orders = M('order_goods')->where(array('order_id'=>$orderid))->select();
        $this->assign('orders', $orders);

//        $this->assign('data',$data);
        $this->assign('gsprice', $data['gsprice']);
        $this->assign('gpprice', $data['gpprice']);
        $this->assign('cartGoods', $data['allCart']);
        $this->assign('allCount', $data['allCount']);
        $adprovince = M('region')->where(array('parent_id'=>1))->order('rand()')->getfield('region_name');
//        $adcity = M('region')->where()
//        dump($address);
        $this->display();
    }

    public function search(){
        $keywords = I('get.keywords');

        $where = "(zc_goods.goods_name like '%".$keywords."%' or zc_brand.brand_name like '%".$keywords."%' or zc_goods.keywords like '%".$keywords."%') and zc_goods.is_on_sale=1";
        $allGoods = M('goods')
            ->join('zc_brand on zc_goods.brand_id = zc_brand.brand_id')
            ->where($where)
            ->select();

        $options    =   array();
        $REQUEST    =   (array)I('request.');

        if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }
        unset($REQUEST['_order'],$REQUEST['_field']);

        if( empty($options['where'])){
            unset($options['where']);
        }
        $total        =   count($allGoods);

        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 12;
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        $this->assign('_total',$total);
        $limit = $page->firstRow.','.$page->listRows;

        $searchGoods = M('goods')
            ->join('zc_brand on zc_goods.brand_id = zc_brand.brand_id')
            ->where($where)
            ->limit($limit)
            ->select();

        $this->assign('searchGoods', $searchGoods);
        $this->assign('keywords', $keywords);
        $this->show();
    }

    public function confirmOrder(){
        $oid = I('post.oid');
        M('order_info')->where(array('order_id'=>$oid))->save(array('order_status'=>2));

        $this->ajaxReturn(array('state'=>1));
    }

    public function payOrder(){
        $oid = I('post.oid');
        M('order_info')->where(array('order_id'=>$oid))->save(array('order_status'=>1));

        $this->ajaxReturn(array('state'=>1));
    }

    /**
     * 评价
     */
    public function comment(){
        $oid = I('post.oid');
        $gid = I('post.gid');
        $remark = I('post.remark');
        $comment = I('post.comment');

        $data['order_id'] = $oid;
        $data['goods_id'] = $gid;
        $data['comment_rank'] = $remark;
        $data['content'] = $comment;
        $data['user_id'] = session('uid');
        $data['add_time'] = date('Y-m-d H:i:s');
        M('comment')->add($data);

        $this->ajaxReturn(array('state'=>1));
    }
}
