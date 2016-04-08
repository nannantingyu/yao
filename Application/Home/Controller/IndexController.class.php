<?php

namespace Home\Controller;
use Think\Controller;

class IndexController extends HomeController {
    public function index(){

        //轮播广告
        $banners = M('banner')->field('id, link, title, image')->order('featured desc, created_time desc')->limit(4)->select();
        $this->assign('banners', $banners);

        //新品
        $latest = M('goods')->field('goods_id, goods_name, shop_price, goods_img')->order('add_time desc, goods_id desc')->limit(5)->select();
        $this->assign('latest', $latest);

        //品牌
        $brands = M('brand')->field("brand_id, brand_name, brand_logo")->where(array("is_show"=>1))->order('sort_order asc')->limit(6)->select();
        $this->assign('brands', $brands);

        $this->display();
    }

    public function cart(){
        $this->display();
    }

    public function shop(){
        $page = I('get.p');
        if(!preg_match('/\d+/', $page)){
            $page = 0;
        }

        $this->assign('p', $page);

        $allGoods = D('public')->lists('goods', $page, 0, array('is_on_sale'=>1), 'goods_id, goods_name, brand_id, shop_price, goods_img', 'add_time desc, sort_order asc, click_count desc');
        $this->assign('allGoods', $allGoods);
        $this->display();
    }

    public function checkout(){
        $this->display();
    }

    public function detail(){
        $this->display();
    }
}