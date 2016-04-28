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
 * 订单控制器
 */
class OrderController extends AdminController{

    public function index()
    {
        //全部商品
        $allOrders = M('order_info')
            ->join('zc_order_goods on zc_order_info.order_id = zc_order_goods.order_id')
            ->join('zc_goods on zc_order_goods.goods_id = zc_goods.goods_id')
            ->join('zc_users on zc_order_info.user_id = zc_users.user_id')
            ->order('zc_order_info.add_time desc, zc_order_info.order_id desc')
            ->select();

        $this->assign('allOrders', $allOrders);
        $this->display();
    }

    public function editMenus()
    {
        $menusModel = M('menus');
        if(!IS_POST) {

            $allMenus = M('Menus')->field(true)->select();
            $menusTree = D('Common/Tree')->toFormatTree($allMenus);
            $this->assign('menusTree', $menusTree);

            if($id = I('get.id')) {
                $menus = $menusModel->where(array('id' => $id))->find();
                $this->assign('menus', $menus);
            }

            $this->display();
        }
        else {
            if ($menusModel->create())
                if ($id = I('post.id')) {
                    $menusModel->save();
                }
            else
            {
                $menusModel->add();
            }

            $this->success('修改成功！', U('menus/index'));
        }
    }

    //设置状态
    public function setState(){
        $id = I('post.id');
        $state = I('post.state');
        $field = I('post.field');

        M('banner')->save(array('id'=>$id, $field=>$state));
        $this->ajaxReturn(array('status'=>1, 'sql'=>M('goods')->getLastSql()));
    }

    //删除广告
    public function delBanner()
    {
        $id = I('post.id');
        if(M('banner')->delete($id))
        {
            $this->ajaxReturn(array('status'=>1, 'sql'=>M('goods')->getLastSql()));
        }
        else
        {
            $this->ajaxReturn(array('status'=>0, 'sql'=>M('goods')->getLastSql()));
        }
    }

}