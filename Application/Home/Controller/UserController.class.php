<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use User\Api\UserApi;

/**
 * 用户控制器
 * 包括用户中心，用户登录及注册
 */
class UserController extends HomeController {

	/* 用户中心首页 */
	public function index(){
		
	}

	/* 登录页面 */
	public function account(){
		$this->display();
	}

	/*注册*/
	public function register(){
		$mUser = M('Users');
		$username = I('post.username');
		$exist = $mUser->where(array('user_name'=> $username))->select();
		if(count($exist) > 0){
			$this->ajaxReturn(array('state'=>-1, 'msg'=>'用户名已存在！'));
		}

		$user['user_name'] = $username;
		$user['password'] = md5(I('post.password'));
		$user['phone'] = I('post.phone');
		$user['email'] = I('post.email');
		$user['sex'] = I('post.sex');
		$user['reg_time'] = date('Y-m-d H:i:s');

		if($uid = $mUser->add($user)){
			session('uid', $uid);
			session('uname', $username);
			$this->ajaxReturn(array('state'=>1));
		}
		else
		{
			$this->ajaxReturn(array('state'=>-2));
		}
	}

	/* 登录页面 */
	public function login(){
		$username = I('post.user_name');
		$pwd = I('post.password');

		$user = M('users')->where(array('user_name'=>$username))->find();
		if($user){
			if(md5($pwd) == $user['password']){
				$user['last_time'] = date('Y-m-d H:i:s');
				$user['last_ip'] = get_client_ip(1);
				session('uid', $user['user_id']);
				session('uname', $username);

				//登陆成功，判断购物车
				$cartGoods = M('cart')->where(array('user_id'=>$user['user_id']))->getField('goods_id, goods_number', true);
				//如果数据库存在，与session中的合并
				$allCart = session('cart');

				if($cartGoods){
					if($allCart){
						foreach($allCart as $key=>$val){
							if($cartGoods[$key]){
								$cartGoods[$key]['goods_number'] += $val;
								M('cart')->save($cartGoods[$key]);
							}
							else
							{
								$cartGoods[$key]['goods_id'] = $key;
								$cartGoods[$key]['user_id'] = $user['user_id'];
								$cartGoods[$key]['goods_number'] = $val;
								$cartGoods[$key]['session_id'] = session_id();

								M('cart')->add($cartGoods[$key]);
							}
						}
					}
				}
				else
				{
					//否则，将session中的商品加入数据库
					$data = array();
					foreach($allCart as $key=>$val){
						$d['user_id'] = $user['user_id'];
						$d['goods_id'] = $key;
						$d['goods_number'] = $val;
						$d['session_id'] = session_id();

						$data[] = $d;
					}

					if($data && count($data) > 0)
					{
						M('cart')->addAll($data);
					}
				}

				$allCartGoods = M('cart')->where(array('user_id'=>$user['user_id']))->getField('goods_id, goods_number', true);
				session('cart', $allCartGoods);

				$this->redirect('/home/index');
			}
			else{
				$this->error('密码错误');
			}
		}
		else{
			$this->error('用户不存在！');
		}
	}

	/* 退出登录 */
	public function logout(){
		if($uid = home_login()){
			session('uname', null);
			session('uid', null);
			$this->success('退出成功！', U('Home/index'));
		} else {
			$this->redirect('User/login');
		}
	}

	/* 验证码，用于登录和注册 */
	public function verify(){
		$verify = new \Think\Verify();
		$verify->entry(1);
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在16个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			case -9:  $error = '手机格式不正确！'; break;
			case -10: $error = '手机被禁止注册！'; break;
			case -11: $error = '手机号被占用！'; break;
			default:  $error = '未知错误';
		}
		return $error;
	}


    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function profile(){
		if ( !home_login() ) {
			$this->error( '您还没有登陆',U('User/login') );
		}
        if ( IS_POST ) {
            //获取参数
            $uid        =   home_login();
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }

            $Api = new UserApi();
            $res = $Api->updateInfo($uid, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{
            $this->display();
        }
    }

}
