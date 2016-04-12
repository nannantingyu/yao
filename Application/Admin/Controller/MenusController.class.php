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
 * 前台菜单页控制器
 */
class MenusController extends AdminController{

    public function index()
    {
        //全部商品
        $allMenus = $this->lists('menus');

        $this->assign('allMenuss', $allMenus);
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