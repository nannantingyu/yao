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
        $this->ajaxReturn(array('state'=>1, 'count'=>count($allCart), 'gid'=>$goodsid));
    }

    /**
     * 购物车
     */
    public function cart(){
        $cart = session('cart');
        if(is_null($cart)){
            $this->error('购物车还没有东西，马上去添加吧！');
        }

        $cartids = array();
        foreach($cart as $key=>$val){
            $cartids[] = $key;
        }

        $cartGoods = M('goods')->where(array('goods_id'=>array('in', $cartids)))->select();
        $goodsShopPrice = 0;
        $goodsPromotedPrice = 0;
        foreach($cartGoods as $key=>$val){
            $cartGoods[$key]['count'] = $cart[$cartGoods[$key]['goods_id']];
            $goodsShopPrice += $cartGoods[$key]['shop_price'];
            $goodsPromotedPrice += $cartGoods[$key]['promote_price'];
        }

        $this->assign('gsprice', $goodsShopPrice);
        $this->assign('gpprice', $goodsShopPrice-$goodsPromotedPrice);
        $this->assign('cartGoods', $cartGoods);
        $this->display();
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
}
