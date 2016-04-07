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

        foreach ($allGoods as $key => $val) {
            $allGoods[$key]['brand'] = $allBrand[$val['brand_id']];
        }

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
        $goodsModel = M('goods');
        if (!IS_POST) {
            if ($id = I('get.id')) {
                $goods = $goodsModel->where(array('goods_id' => $id))->find();
                $this->assign('goods', $goods);
            }

            $goodsTypes = M('category')->field('cat_id, parent_id, cat_name')->select();

            //商品类型
            $types = array();
            foreach ($goodsTypes as $key => $val) {
                if (!$types[$val['parent_id']]) {
                    $types[$val['cat_id']]['detail'] = $val;
                } else {
                    $types[$val['parent_id']]['data'][] = $val;
                }
            }

            //商品品牌
            $brand = M('brand')->field('brand_id, brand_name')->select();

            $this->assign('goodstypes', $types);
            $this->assign('brand', $brand);
            $this->display();
        } else {
            if ($goodsModel->create())
                if ($id = I('post.goods_id')) {
                    $goodsModel->save();
                } else {
                    $goodsModel->add();
                }

            $this->success('修改成功！', U('goods/index'));
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