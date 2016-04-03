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
 * 广告控制器
 */
class BannerController extends AdminController{

    public function index()
    {
        //全部商品
        $allBanners = $this->lists('banner');

        $this->assign('allbanners', $allBanners);
        $this->display();
    }

    public function editBanner()
    {
        $bannerModel = M('banner');
        if(!IS_POST) {
            if($id = I('get.id')) {
                $banner = $bannerModel->where(array('id' => $id))->find();
                $this->assign('banner', $banner);
            }

            $this->display();
        }
        else {
            if ($bannerModel->create())
                if ($id = I('post.id')) {
                    $bannerModel->save();
                }
            else
            {
                $bannerModel->add();
            }

            $this->success('修改成功！', U('banner/index'));
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