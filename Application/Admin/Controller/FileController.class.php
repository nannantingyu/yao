<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Admin\Controller;
/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class FileController extends AdminController
{

    /* 文件上传 */
    public function upload()
    {
        $return = array('status' => 1, 'info' => '上传成功', 'data' => '');
        /* 调用文件上传组件上传文件 */
        $File = D('File');
        $file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
        $info = $File->upload(
            $_FILES,
            C('DOWNLOAD_UPLOAD'),
            C('DOWNLOAD_UPLOAD_DRIVER'),
            C("UPLOAD_{$file_driver}_CONFIG")
        );

        /* 记录附件信息 */
        if ($info) {
            $return['data'] = think_encrypt(json_encode($info['download']));
            $return['info'] = $info['download']['name'];
        } else {
            $return['status'] = 0;
            $return['info'] = $File->getError();
        }

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    /* 下载文件 */
    public function download($id = null)
    {
        if (empty($id) || !is_numeric($id)) {
            $this->error('参数错误！');
        }

        $logic = D('Download', 'Logic');
        if (!$logic->download($id)) {
            $this->error($logic->getError());
        }

    }

    /**
     * 上传广告
     */
    public function uploadBanner()
    {
        $this->uploadFile('BANNER_UPLOAD');
    }

    /**
     * 上传品牌logo
     */
    public function uploadBrand()
    {
        $this->uploadFile('BRAND_UPLOAD');
    }

    /**
     * 上传图片
     */
    public function uploadPicture()
    {
        $this->uploadFile('PICTURE_UPLOAD');
    }

    /**
     * 上传图片
     */
    public function uploadFile($config){
        //TODO: 用户登录检测

        /* 返回标准数据 */
        $return  = array('status' => 1, 'info' => '上传成功', 'data' => '');

        /* 调用文件上传组件上传文件 */
        $Picture = D('Picture');
        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
        $info = $Picture->upload(
            $_FILES,
            C($config),
            C('PICTURE_UPLOAD_DRIVER'),
            C("UPLOAD_{$pic_driver}_CONFIG")
        ); //TODO:上传到远程服务器

        /* 记录图片信息 */
        foreach($info as $key=>$val){
            \Think\Log::write($key."__________".$val, 'WARN');
        }
        if($info){
            $return['status'] = 1;
            $return = array_merge($info['download'], $return);
        } else {
            $return['status'] = 0;
            $return['info']   = $Picture->getError();
        }

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    //将数据库中的图片字段改为数组
    public function test(){
        $imgs = M('goods')->select();
        foreach($imgs as $key=>$val){
            $imgs[$key]['goods_img'] = json_encode(array($val['goods_img']));
            M('goods')->save($imgs[$key]);
        }
    }
}
