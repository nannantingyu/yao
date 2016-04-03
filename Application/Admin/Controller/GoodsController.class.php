<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Think\Db;
use OT\Database;

/**
 * 数据库备份还原控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class GoodsController extends AdminController{

    public function index()
    {
        $allGoods = $this->lists('goods');
        $this->assign('allGoods', $allGoods);
        $this->display();
    }

    //商品分类
    public function gtype()
    {
        $allGtypes = $this->lists('goods_type');
        $this->assign('allGtypes', $allGtypes);
        $this->display();
    }

    //商品属性
    public function gattr()
    {
        $allGattrs = $this->lists('goods_attribute');
        $this->assign('allGattrs', $allGattrs);
        $this->display();
    }

    public function editgoods()
    {
        $id = I('get.id');
        $goods = M('goods')->where(array('goods_id'=>$id))->find();
        $goodsTypes = M('category')->field('cat_id, parent_id, cat_name')->select();

        //商品类型
        $types = array();
        foreach($goodsTypes as $key=>$val)
        {
            if(!$types[$val['parent_id']]){
                $types[$val['cat_id']]['detail'] = $val;
            }
            else
            {
                $types[$val['parent_id']]['data'][] = $val;
            }
        }

        //商品品牌
        $brand = M('brand')->field('brand_id, brand_name')->select();

        $this->assign('goodstypes', $types);
        $this->assign('goods', $goods);
        $this->assign('brand', $brand);
        $this->display();
    }
}