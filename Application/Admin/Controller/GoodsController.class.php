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
 * 商品控制器
 */
class GoodsController extends AdminController
{

    public function index()
    {
        //全部商品
        $allGoods = $this->lists('goods');

        //品牌
        $allBrand = M('brand')->getField('brand_id, brand_name', true);
        //分类
        $allCat = M('category')->getField('cat_id, cat_name', true);

        foreach ($allGoods as $key => $val) {
            $allGoods[$key]['brand'] = $allBrand[$val['brand_id']];
            $allGoods[$key]['cat'] = $allCat[$val['cat_id']];
        }

        $this->assign('allGoods', $allGoods);
        $this->display();
    }

    //商品分类
    public function gcat()
    {
        $allCategory = $this->lists('category');
        $this->assign('allCategory', $allCategory);
        $this->display();
    }

    //编辑商品分类
    public function editcat()
    {
        $catModel = M('category');
        if (!IS_POST) {

            $topcats = M('category')->where(array('parent_id'=>0))->select();
            $this->assign('topcats', $topcats);

            if ($cat_id = I('get.cat_id')) {
                $cat = $catModel->where(array('cat_id'=>$cat_id))->find();
                $this->assign('cat', $cat);
            }
            $this->display();
        } else {
            if ($catModel->create()) {
                if ($cat_id = I('post.cat_id')) {
                    $catModel->save();
                } else {
                    $cat_id = $catModel->add();
                }
                $this->success('修改成功！', U('goods/gcat', array('p'=>I('post.p', 1))));
            }
        }
    }

    //删除类型
    public function delCat()
    {
        $id = I('post.cat_id');
        if (M('category')->delete($id)) {
            $this->ajaxReturn(array('status' => 1));
        } else {
            $this->ajaxReturn(array('status' => 0));
        }
    }

    //全部属性
    public function gattr()
    {
        $gwhere = array();
        if($keyword = I('get.key')){
            $where['goods_name'] = array('like', "%$keyword%");
            $goods_id = M('goods')->where($where)->getField('goods_id', true);

            $gwhere['goods_id'] = array('in', $goods_id);
        }

        $allGattrs = $this->lists('goods_attr', $gwhere);

        $allGoodsIds = array();
        $allAttrIds = array();
        foreach($allGattrs as $key=>$val){
            if(!in_array($val['attr_id'], $allAttrIds)){
                $allAttrIds[] = $val['attr_id'];
            }

            if(!in_array($val['goods_id'], $allGoodsIds)){
                $allGoodsIds[] = $val['goods_id'];
            }
        }

        if(count($allAttrIds) > 0){
            $allAttr = M('goods_attribute')->where(array('attr_id' => array('in', $allAttrIds)))->getField('attr_id, attr_name', true);
        }

        if(count($allGoodsIds) > 0){
            $allGoods = M('goods')->where(array('goods_id' => array('in', $allGoodsIds)))->getField('goods_id, goods_name', true);
        }

        foreach($allGattrs as $key=>$val){
            $allGattrs[$key]['attr_name'] = $allAttr[$allGattrs[$key]['attr_id']];
            $allGattrs[$key]['goods_name'] = $allGoods[$allGattrs[$key]['goods_id']];
        }

        //商品分类
        $cats = M('goods_type')->field('cat_id, cat_name')->select();

        $this->assign('cats', $cats);
        $this->assign('allGattrs', $allGattrs);
        $this->display();
    }

    /**
     * 删除图片
     */
    public function delImg(){
        $id = I('post.id');
        $path = I('post.path');

        $goods = M('goods')->where(array('goods_id'=>$id))->field('goods_id, goods_img')->find();
        if($goods && $goods['goods_img']){
            $thumb = json_decode($goods['goods_img']);
            for($index = 0, $max = count($thumb); $index < $max; $index ++){
                if($thumb[$index] == $path){
                    array_splice($thumb, $index, 1);
                    break;
                }
            }

            $goods['goods_img'] = json_encode($thumb);

            M('goods')->save($goods);
        }

        $this->ajaxReturn(array('state'=>1, 'goods_img'=>$goods['goods_img']));
    }

    //编辑属性
    public function editgattr()
    {
        $attrModel = M('goods_attr');
        if (!IS_POST) {
            if ($goods_attr_id = I('get.goods_attr_id')) {
                $goods_attr = $attrModel->where(array('goods_attr_id'=>$goods_attr_id))->find();
                $goods = M('goods')->where(array('goods_id'=>$goods_attr['goods_id']))->field('goods_id, goods_name, cat_id')->find();
                $allAttr = M('goods_attribute')->where(array('cat_id'=>$goods['cat_id']))->field('attr_id, attr_name')->select();
                $this->assign('goods', $goods);
                $this->assign('goods_attr', $goods_attr);
                $this->assign('allAttr', $allAttr);
            }
            $this->display();
        } else {
            if ($attrModel->create()) {
                $p = I('post.p');
                if ($cat_id = I('post.goods_attr_id')) {
                    $attrModel->save();
                } else {
                    $cat_id = $attrModel->add();
                }
                $this->success('修改成功！', U('goods/gattr', array('p'=>$p)));
            }
        }
    }

    //删除商品属性
    public function delGattr()
    {
        $id = I('post.id');
        if (M('goods_attr')->delete($id)) {
            $this->ajaxReturn(array('status' => 1));
        } else {
            $this->ajaxReturn(array('status' => 0));
        }
    }

    //删除属性
    public function delAttr()
    {
        $id = I('post.id');
        if (M('goods_attribute')->delete($id)) {
            $this->ajaxReturn(array('status' => 1));
        } else {
            $this->ajaxReturn(array('status' => 0));
        }
    }

    //全部属性
    public function attr()
    {
        $cat_id = I('get.cat_id');

        $where = array();
        if($cat_id && $cat_id != 0){
            $where['cat_id'] = $cat_id;
            $this->assign('cat_id', $cat_id);
        }
        $allAttrs = $this->lists('goods_attribute', $where);
        //商品分类
        $cats = M('category')->where(array('parent_id'=>0))->field('cat_id, cat_name')->select();

        $this->assign('cats', $cats);
        $this->assign('allGattrs', $allAttrs);
        $this->display();
    }

    //编辑属性
    public function editattr()
    {
        $attrModel = M('goods_attribute');
        if (!IS_POST) {
            if ($attr_id = I('get.attr_id')) {
                $attr = $attrModel->where(array('attr_id'=>$attr_id))->find();
                $this->assign('attr', $attr);
            }
            $cats = M('category')->where(array('parent_id'=>0))->field('cat_id, cat_name')->select();
            $this->assign('cats', $cats);

            $this->display();
        } else {
            if ($attrModel->create()) {
                $p = I('post.p');
                $cat = I('post.cat_id');
                if ($cat_id = I('post.attr_id')) {
                    $attrModel->save();
                } else {
                    $cat_id = $attrModel->add();
                }
                $this->success('修改成功！', U('goods/attr', array('p'=>$p, 'cat_id'=>$cat)));
            }
        }
    }

    //编辑商品
    public function editgoods()
    {
        $goodsModel = M('goods');
        if (!IS_POST) {
            if ($id = I('get.id')) {
                $goods = $goodsModel->where(array('goods_id' => $id))->find();
                $this->assign('goods', $goods);
            }

            $goodsTypes = M('category')->field('cat_id, parent_id, cat_name')->order('cat_id asc')->select();

            $goods_img = array();
            if($goods['goods_img']){
                $goods_img = json_decode($goods['goods_img']);
            }
            $this->assign('goods_img', $goods_img);

            //商品类型
            $types = array();
            foreach ($goodsTypes as $key => $val) {
                if($val['parent_id'] == 0){
                    $types[$val['cat_id']] = array();
                    $types[$val['cat_id']]['detail'] = $val;
                }
                else if($types[$val['parent_id']]){
                    $types[$val['parent_id']]['data'][] = $val;
                }
            }

            //商品品牌
            $brand = M('brand')->field('brand_id, brand_name')->select();

            $this->assign('goodstypes', $types);
            $this->assign('brand', $brand);
            $this->display();
        } else {
            if ($newgoods = $goodsModel->create())
                $newgoods['goods_img'] = json_encode(I('imgs'));
                if ($id = I('post.goods_id')) {
                    $goodsModel->save($newgoods);
                } else {
                    $goodsModel->add($newgoods);
                }

            $this->ajaxReturn(array('state'=>1, 'imgs'=>I('imgs')));
        }
    }

    //设置状态
    public function setState()
    {
        $id = I('post.id');
        $state = I('post.state');
        $field = I('post.field');

        M('goods')->save(array('goods_id' => $id, $field => $state));
        $this->ajaxReturn(array('status' => 1, 'sql' => M('goods')->getLastSql()));
    }

    //删除商品
    public function delGoods()
    {
        $id = I('post.id');
        if (M('goods')->delete($id)) {
            $this->ajaxReturn(array('status' => 1, 'sql' => M('goods')->getLastSql()));
        } else {
            $this->ajaxReturn(array('status' => 0, 'sql' => M('goods')->getLastSql()));
        }
    }

    //品牌管理
    public function brand()
    {
        $brand = $this->lists('brand', '', 'sort_order asc');
        $this->assign('brand', $brand);
        $this->display();
    }

    public function delbrand()
    {
        $id = I('get.id');
        if ($id != '') {
            $result = D('brand')->delete($id);
            if ($result) {
                $this->success('删除成功啦！', U('goods/brand'));
            } else {
                $this->error('哦^删除失败~');
            }
        }
    }

    /**
     * 设置品牌的排序问题
     */
    public function setorder()
    {
        $val = I('post.val');
        $id = I('post.id');
        if (D('Brand')->where(array('brand_id' => $id))->save(array('sort_order' => $val))) {
            $this->ajaxReturn(array('status' => 1));
        } else {
            $this->ajaxReturn(array('status' => 0));
        }
    }

    /**
     * 发布，取消发布操作
     **/
    function isShow()
    {
        $id = I('get.brand_id');
        $is_show = I('get.is_show');
        if ($id) {
            if (M('Brand')->save(array("brand_id" => $id, "is_show" => $is_show))) {
                $this->ajaxReturn(array('status' => 1));
            } else {
                $this->ajaxReturn(array('status' => 0));
            }
        } else {
            $this->ajaxReturn(array('status' => 0));
        }
    }

    /**
     * 编辑品牌
     */
    public function editbrand()
    {
        $brandModel = M('brand');
        if (!IS_POST) {
            if ($brand_id = I('get.id')) {
                $brand = $brandModel->where(array('brand_id'=>$brand_id))->find();
                $this->assign('brand', $brand);
            }
            $this->display();
        } else {
            if ($brandModel->create()) {
                if ($brand_id = I('post.brand_id')) {
                    $brandModel->save();
                } else {
                    $brand_id = $brandModel->add();
                }
                $this->success('修改成功！', U('goods/brand'));
            }
        }
    }
}