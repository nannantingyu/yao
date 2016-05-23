<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的ZC---个人中心</title>
<link href="/Public/Home/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/Public/Home/css/style.css">
<script src="/Public/Home/js/jquery-2.1.1.js"></script>
<script src="/Public/Home/js/bootstrap.min.js"></script>
<style>
    .mytb td img{
        width: 30px !important;
        height: 30px !important;
    }
</style>
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
<div class="container">
    <div class="panel panel-info">
   <div class="panel-heading">
      <h3 class="panel-title">填写核对订单信息</h3>
   </div>
   <div class="panel-body">
        <ul class="list-group">
            <li class="list-group-item">收货人信息&nbsp;&nbsp;<?php echo ($address); ?>&nbsp;&nbsp;<a href="/home/user/personal.html#section-7">[修改]</a>|<a>[新增并使用]</a></li>
            <li class="list-group-item">支付及配送方式&nbsp;&nbsp;
                您选择使用：&nbsp;支付宝&nbsp;<a href="#">[修改]</a>
            </li>
            <li class="list-group-item">商品清单<br>
            <!--<div class="row">-->
            <table class="table table-striped mytb">
                <tr>
                    <th width="15%"></th>
                    <th>商品</th>
                    <th>单价（元）</th>
                    <th>促销价</th>
                    <th width="16%">数量</th>
                </tr>
                <?php if(is_array($orders)): $i = 0; $__LIST__ = $orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><tr>
                        <td align="center"><img src="<?php echo getImgsrc($goods['goods_img']);?>" alt="<?php echo ($goods["goods_name"]); ?>" width="30"></td>
                        <td><?php echo ($goods["goods_name"]); ?></td>
                        <td><?php echo ($goods["market_price"]); ?></td>
                        <td><?php echo ($goods["goods_price"]); ?></td>
                        <td><?php echo ($goods["goods_number"]); ?></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr><td colspan="4"></td><td>商品总计：<?php echo ($gsprice); ?>元<br><br><button onclick="checkAll(this)" class="btn btn-danger">付款</button></td></tr>
            </table>
            </li>
        </ul>
    </div>
        <input type="hidden" id="order_id" value="<?php echo ($oid); ?>">
   </div>
</div>
</div>

<script>
function checkAll(obj){
    $(obj).attr('disabled', 'disabled').text('付款中');
    var order_id = $('#order_id').val();
    $.ajax({
        url: '/home/goods/checkall',
        type: 'post',
        dataType: 'json',
        data: {oid: order_id},
        success: function(data){
            if(data.state == 1) {
                $.when(alert('结算成功！我们会尽快安排送货。去看看其他的吧！')).done(function () {
                    window.location.href = '/';
                });
            }
            else{
                $(obj).removeAttr('disabled').text('付款');
            }
        }
    })
}
</script>