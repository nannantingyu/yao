<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}



function home_login(){
    $user = session('uid');
    if (empty($user)) {
        return 0;
    } else {
        return $user;
    }
}

/**
 * 邮件发送函数
 */
function sendMail($to, $title, $content) {

    Vendor('PHPMailer.PHPMailerAutoload');
    $mail = new \PHPMailer(); //实例化
    $mail->IsSMTP(); // 启用SMTP
    $mail->Host = 'smtp.163.com'; //smtp服务器的名称
    $mail->SMTPAuth = TRUE; //启用smtp认证
    $mail->Username = '13270830860@163.com'; //你的邮箱名
    $mail->Password = 'wait12345'; //邮箱密码
    $mail->From = '13270830860@163.com'; //发件人地址（也就是你的邮箱地址）
    $mail->FromName = 'zcStore'; //发件人姓名
    $toarr = explode(',', $to);
    foreach ($toarr as $v) {
        $mail->AddAddress($v);
    }
    $mail->WordWrap = 50; //设置每行字符长度
    $mail->IsHTML(TRUE); // 是否HTML格式邮件
    $mail->CharSet = 'utf-8'; //设置邮件编码
    $mail->Subject = $title; //邮件主题
    $mail->Body = $content; //邮件内容
    $mail->AltBody = "这是一个纯文本的身体在非营利的HTML电子邮件客户端"; //邮件正文不支持HTML的备用显示
    return($mail->Send());
}