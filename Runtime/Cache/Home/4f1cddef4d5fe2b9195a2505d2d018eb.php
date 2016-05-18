<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的ZC---个人中心</title>
<link href="/Public/Home/css/bootstrap.min.css" rel="stylesheet">
<link href="/Public/Home/css/style.css" rel="stylesheet">
<!--<link rel="stylesheet" href="/Public/Home/css/style.css">-->
<script src="/Public/Home/js/jquery-2.1.1.js"></script>
<script src="/Public/Home/js/bootstrap.min.js"></script>

<style type="text/css">
    /* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 18px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<!--Top-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div>
            <ul class="nav navbar-nav">
                <li><a href="javascript:void(0);">手机版</a></li>
                <li><a href="javascript:void(0);">服务中心</a></li>
                <li><a href="javascript:void(0);">在线客服</a></li>
            </ul>
        </div>
        <div id="user-div" class="pull-right">
            <ul class="nav navbar-nav">
                <?php $uname = session('uname'); ?>
                <?php if(is_null($uname)): ?><li><a href="/home/user/account.html"><span class="glyphicon glyphicon-envelope"></span> 登录</a></li>
                    <?php else: ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            欢迎你, <?php echo ($uname); ?> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/home/user/personal">我的账户</a></li>
                            <li><a href="/home/user/logout.html">退出登录</a></li>
                        </ul>
                    </li>
                    <li><a href="/home/user/myorder">我的订单</a></li><?php endif; ?>
                <li><a href="/home/index/contact.html"><span class="glyphicon glyphicon-envelope"></span> 联系我们</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--Header-->
<header class="container">
    <div class="row">
        <div class="col-md-4">
            <div id="logo"><a href="/"><img src="/Public/Home/images/logo.png" /></a></div>
        </div>
        <div class="col-md-4">
            <form class="form-search">
                <input type="text" class="input-medium search-query">
                <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
        <div class="col-md-4">
            <div id="cart"><a class="btn btn-1" href="/home/goods/cart.html"><span class="glyphicon glyphicon-shopping-cart"></span>购物车 : <span id="cart-count"><?php echo count(session('cart')); ?></span> 件</a></div>
        </div>
    </div>
</header>
<div class="container" style="padding-bottom: 40px;">
    <div class="row">
        <div class="col-xs-2" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">个人中心</a></li>
                <li><a href="#section-2">全部订单</a></li>
                <li><a href="#section-3">我的优惠券</a></li>
                <li><a href="#section-4">积分明细</a></li>
                <li><a href="#section-5">物流跟踪</a></li>
                <li><a href="#section-6">商品评价</a></li>
                <li><a href="#section-7">收货地址管理</a></li>
                <li><a href="#section-8">账户安全</a></li>
            </ul>
        </div>
        <div class="col-xs-10" style="padding-top: 30px;">
            <p id="section-1" style="font-size:27px";>用户：<?php echo ($user["user_name"]); ?></p><br>
            <h4>积分：100分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;等级：初级</h4>
            <h4>当前状态：您有<a href="#">3</a>件商品正在配送中，<a href="#">点我</a>进行物流跟踪！<a href="#">&nbsp;&nbsp;详情&gt;</a></h4>
            <hr>
            <h3 id="section-2">全部订单</h3>
            <table class="table"> 
                <thead>
                    <th width="10%">订单编号</th>
                    <th width="10%"></th>
                    <th width="15%">商品名称</th>
                    <th width="10%">收货人</th>
                    <th width="10%">订单状态</th>
                    <th width="10%">物流状态</th>
                    <th width="10%">支付状态</th>
                    <th width="10%">订单总价</th>
                    <th width="5%">操作</th>
                </thead>
                <tbody>
                    <?php if(is_array($allOrders)): $i = 0; $__LIST__ = array_slice($allOrders,0,8,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr <?php if(($mod) == "0"): ?>style="background-color:rgb(203,223,159);"<?php endif; ?>height='50'>
                            <td><?php echo ($vo["order_id"]); ?></td>
                            <td><img src="<?php echo ($vo["goods_img"]); ?>" height="34" weight="34"/></td>
                            <td><?php echo ($vo["goods_name"]); ?></td>
                            <td><?php echo ($vo["user_name"]); ?></td>
                            <td><?php echo ($vo["order_status"]); ?></td>
                            <td><?php echo ($vo["shipping_status"]); ?></td>
                            <td><?php echo ($vo["pay_status"]); ?></td>
                            <td><?php echo ($vo["order_amount"]); ?></td>
                            <td><a href='#'>详情</a></td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <hr>
            <h3 id="section-3">我的优惠券</h3>
            <p><a href="#">查看全部使用规则&nbsp;&nbsp;&gt;&gt;</a></p>
            <hr>
            <h3 id="section-4">积分明细</h3>
            <p><a href="#">查看积分累计情况&nbsp;&nbsp;&gt;&gt;</a></p>
            <hr>
            <h3 id="section-5">物流跟踪</h3>
            <p><a href="#">查看未完成订单物流信息&nbsp;&nbsp;&gt;&gt;</a></p>
            <hr>
            <h3 id="section-6">商品评价</h3>
            <p><a href="#">查看全部订单评价信息&nbsp;&nbsp;&gt;&gt;</a></p>
            <hr>
            <h3 id="section-7">收货地址管理</h3>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    省/直辖市
                </lebel>
                <div class="col-md-2">
                    <select name="province" id="province" class="form-control">
                        <?php if(is_array($provice)): $i = 0; $__LIST__ = $provice;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["region_id"]); ?>"><?php echo ($vo["region_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    市/区
                </lebel>
                <div class="col-md-2">
                    <select name="city" id="city" class="form-control">
                        <?php if(is_array($city)): $i = 0; $__LIST__ = $city;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["region_id"]); ?>"><?php echo ($vo["region_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    县
                </lebel>
                <div class="col-md-2">
                    <select name="county" id="county" class="form-control">
                        <?php if(is_array($county)): $i = 0; $__LIST__ = $county;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["region_id"]); ?>"><?php echo ($vo["region_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    详细地址
                </lebel>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="address" placeholder="请输入详细的收货地址">
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 col-md-offset-3">
                    <button class="btn btn-default" id="btn-address">保存</button>
                </div>
            </div>
            <hr>
            <h3 id="section-8">账户信息</h3>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    邮箱
                </lebel>
                <div class="col-md-5">
                    <?php echo ($user["email"]); ?>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    用户名
                </lebel>
                <div class="col-md-5">
                    <?php echo ($user["user_name"]); ?>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    生日
                </lebel>
                <div class="col-md-5">
                    <?php echo ($user["birthday"]); ?>
                </div>
            </div>
            <div class="row">
                <lebel class="col-md-2 control-label" style="text-align: right;">
                    注册时间
                </lebel>
                <div class="col-md-5">
                    <?php echo ($user["reg_time"]); ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-5">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">购物帮助</h2>
                    <ul>
                        <li><a href="javascript:void(0);">购物流程</a></li>
                        <li><a href="javascript:void(0);">忘记密码</a></li>
                        <li><a href="javascript:void(0);">账户安全</a></li>
                        <li><a href="javascript:void(0);">配送方式</a></li>
                        <li><a href="javascript:void(0);">联系我们</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-2 col-sm-5">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">支付帮助</h2>
                    <ul>
                        <li><a href="javascript:void(0);">货到付款</a></li>
                        <li><a href="javascript:void(0);">在线支付</a></li>
                        <li><a href="javascript:void(0);">分期付款</a></li>
                        <li><a href="javascript:void(0);">公司转账</a></li>
                        <li><a href="javascript:void(0);">发票制度</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-md-2 col-sm-5">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">售后帮助</h2>
                    <ul>
                        <li><a href="javascript:void(0);">退换货服务</a></li>
                        <li><a href="javascript:void(0);">退款说明</a></li>
                        <li><a href="javascript:void(0);">延保服务</a></li>
                        <li><a href="javascript:void(0);">常见问题</a></li>
                        <li><a href="javascript:void(0);">投诉建议</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-md-2 col-sm-5">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">特色服务</h2>
                    <ul>
                        <li><a href="javascript:void(0);">7天无理由退货</a></li>
                        <li><a href="javascript:void(0);">15天 免费换货</a></li>
                        <li><a href="javascript:void(0);">购物卡办理</a></li>
                        <li><a href="javascript:void(0);">企业采购</a></li>
                        <li><a href="javascript:void(0);">积分兑换</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-2 col-sm-5">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">关于ZC</h2>
                    <ul>
                        <li><a href="javascript:void(0);">了解ZC商城</a></li>
                        <li><a href="javascript:void(0);">加入我们</a></li>
                        <li><a href="javascript:void(0);">官方微博</a></li>
                        <li><a href="javascript:void(0);">官方微信</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-sm-5">
                <div class="footer-about-us">
                        <h2><span>400-987-12345</span></h2>
                        <p>周一至周日 8:00-18:00</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(仅收市话费）</p>
                        <p><a href="javascript:void(0);">24小时在线客服</a></p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer top area -->

<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="copyright">
                    <p>©zc.com 京ICP证123400号 京ICP备10088888号 京公网安备12345678901234号 京网文[2016]0010-0001号 <br/>违法和不良信息举报电话：188-0010-0830
诚信网站 可信网站 网上交易保障中心
</a></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer bottom area -->

</body>
</html>

<script>
    $(function(){
        $('#province').change(function(){
            changeRegion(this, 'city', 1);
        });

        $('#city').change(function(){
            changeRegion(this, 'county', 2);
        });

        $('#btn-address').click(function(){
            $.ajax({
                url: '/home/user/address',
                data: {
                    province: $('#province').val(),
                    city: $('#city').val(),
                    county: $('#county').val(),
                    address: $('#address').val()
                },
                type: 'post',
                dataType: 'json',
                success: function(data){
                    if(data.state == 1){
                        alert('地址保存成功！');
                    }
                    else{
                        alert('更新失败！');
                    }
                }
            })
        })
    });
    function changeRegion(obj, tar, type){
        $.ajax({
            url: '/home/user/changeRegion',
            data: {
                type: type,
                id: $(obj).val()
            },
            type: 'post',
            dataType: 'json',
            success: function(data){
                var options = '';
                $.each(data, function(index, d){
                   options += '<option value="' + d.region_id + '">' + d.region_name + '</option>';
                });

                $('#' + tar).html(options).change();
            }
        });
    }
</script>

</body>
</html>