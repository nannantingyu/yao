<?php

namespace Home\Controller;
use Think\Controller;

class IndexController extends Controller {
    public function index(){

        $banners = M('banner')->field('id, link, title, image')->order('featured desc, created_time desc')->limit(4)->select();
        $this->assign('banners', $banners);

        $latest = M('goods')->field('goods_id, goods_name, shop_price, goods_img')->order('add_time desc, goods_id desc')->limit(5)->select();
        $this->assign('latest', $latest);
        $this->display();
    }

    public function cart(){
        $this->display();
    }

    public function shop(){
        $this->display();
    }

    public function checkout(){
        $this->display();
    }

    public function detail(){
        $this->display();
    }
}