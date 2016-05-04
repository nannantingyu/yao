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
    public function reviewcart(){
        $cart = session('cart');
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
    
    public function checkodinfo(){          //提交订单
        $data = $this->reviewcart();
        $this->assign('data',$data);
        $this->display();
    }
}
