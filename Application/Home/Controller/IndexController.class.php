<?php

namespace Home\Controller;
use Think\Controller;

class IndexController extends HomeController {
    public function index(){

        //轮播广告
        $banners = M('banner')->field('id, link, title, image')->order('featured desc, created_time desc')->limit(4)->select();
        $this->assign('banners', $banners);

        //新品
        $latest = M('goods')->field('goods_id, goods_name, shop_price, goods_img')->order('add_time desc, goods_id desc')->limit(4)->select();
        $this->assign('latest', $latest);

        //品牌
        $brands = M('brand')->field("brand_id, brand_name, brand_logo")->where(array("is_show"=>1))->order('sort_order asc')->limit(6)->select();
        $this->assign('brands', $brands);

        $this->display();
    }

    public function account(){
        $this->display();
    }

    public function checkout(){
        $this->display();
    }

    public function contact(){
        $this->display();
    }

    public function product(){
        $id = I('get.id');

        $goods = M('goods')->join('zc_category on zc_goods.cat_id = zc_category.cat_id')->find($id);

        $whereRelate = array('cat_id'=>$goods['cat_id'], 'id'=>array('neq', $id));
        $relatedGoods = M('goods')->where($whereRelate)->limit(3)->select();

        $categories = M('category')->limit(4)->select();
        $brands = M('brand')->limit(6)->select();
        $latest = M('goods')->limit(3)->order('add_time desc')->select();

        $this->assign('latest', $latest);
        $this->assign('categories', $categories);
        $this->assign('brands', $brands);
        $this->assign('related', $relatedGoods);
        $this->assign('goods', $goods);
        $this->display();
    }
}