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

        //推荐商品
        $featureGoods = M('goods')->order('is_promote desc, add_time desc')->field('goods_id, goods_name, shop_price, goods_img')->limit(4)->select();
        $this->assign('feature', $featureGoods);

        //热门商品
        $hotIds = M('order_goods')->query('select goods_id, count(*) as cou from zc_order_goods GROUP BY goods_id ORDER BY cou desc limit 4');
        $hids = array();
        foreach($hotIds as $key=>$val){
            $hids[$val['goods_id']] = $val['cou'];
        }

        $hotGoods = M('goods')->where(array('goods_id'=>array('in', array_keys($hids))))->order('is_promote desc, add_time desc')->field('goods_id, goods_name, shop_price, goods_img')->select();
        $this->assign('hot', $hotGoods);

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

        $goodsImgs = json_decode($goods['goods_img']);
        $this->assign('imgs', $goodsImgs);

        $whereRelate = array('cat_id'=>$goods['cat_id'], 'goods_id'=>array('not in', array($id)));
        $relatedGoods = M('goods')->where($whereRelate)->order('add_time desc')->limit(3)->select();

        $categories = M('category')->limit(4)->select();
        $brands = M('brand')->limit(16)->select();
        $latest = M('goods')->limit(3)->order('add_time desc')->select();

        //评价
        $comment = M('comment')
            ->join('zc_users on zc_comment.user_id = zc_users.user_id')
            ->where(array('zc_comment.goods_id'=>$id))
            ->select();

        $this->assign('comment', $comment);

        //推荐商品
        $featureGoods = M('goods')->where('is_promote = 1')->order('add_time desc')->find();
        $this->assign('feature', $featureGoods);

        //商品属性
        $goodsAttr = M('goods_attr')
            ->join('zc_goods_attribute on zc_goods_attr.attr_id = zc_goods_attribute.attr_id')
            ->where(array('goods_id'=>$id, 'attr_input_type'=>1))->select();

        $this->assign('goodsAttr', $goodsAttr);

        $allAttrs = M('goods_attr')
            ->join('zc_goods_attribute on zc_goods_attr.attr_id = zc_goods_attribute.attr_id')
            ->where(array('goods_id'=>$id, 'attr_input_type'=>1))
            ->field('zc_goods_attribute.attr_id, zc_goods_attribute.attr_name, zc_goods_attr.attr_value, attr_price')
            ->select();
        foreach($allAttrs as $key=>$val){
            $allAttrs[$key]['value'] = explode(',', $allAttrs[$key]['attr_value']);
        }
        $this->assign('attrs', $allAttrs);

        $this->assign('latest', $latest);
        $this->assign('categories', $categories);
        $this->assign('brands', $brands);
        $this->assign('related', $relatedGoods);
        $this->assign('goods', $goods);
        $this->display('Goods/detail');
    }
}