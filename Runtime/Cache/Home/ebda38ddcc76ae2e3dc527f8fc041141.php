<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ZC Store</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/Public/Home/css/bootstrap.min.css"  type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/Public/Home/css/style.css">


    <!-- Custom Fonts -->
    <link rel="stylesheet" href="/Public/Home/css/font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="/Public/Home/css/fonts/font-slider.css" type="text/css">

    <!-- jQuery and Modernizr-->
    <script src="/Public/Home/js/jquery-2.1.1.js"></script>

    <!-- Core JavaScript Files -->
    <script src="/Public/Home/js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/Public/Home/js/html5shiv.js"></script>
    <script src="/Public/Home/js/respond.min.js"></script>
    <![endif]-->
    <script >
        function addCart(id, count){

            if(!count){
                count = 1;
            }

            $.ajax({
                url: '/home/goods/addCart',
                data: {gid: id, count: count},
                type: 'post',
                dataType: 'json',
                success: function(data){
                    if(data.state == 1){
                        $('#cart-count').text(data.count);
                        alert('加入购物车成功！');
                    }
                }
            });
        }
    </script>
</head>

<body>

<!--Top-->
<nav class="navbar navbar-default myNav" role="navigation">
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
            <form class="form-search" onsubmit="return subsearch();">
                <input type="text" class="input-medium search-query" id="txt-search">
                <button type="button" class="btn" id="btn-search"><span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
        <div class="col-md-4">
            <div id="cart"><a class="btn btn-1" href="/home/goods/cart.html"><span class="glyphicon glyphicon-shopping-cart"></span>购物车 : <span id="cart-count"><?php echo count(session('cart')); ?></span> 件</a></div>
        </div>
    </div>
</header>
<!--Navigation-->
<nav id="menu" class="navbar">
    <div class="container">
        <div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <?php if(is_array($menus)): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="dropdown">
                        <?php $url = $vo['info']['path']; if($vo['info']['menu_type'] == 'cid'){ $url = '/home/goods/category/cid/'.$vo['info']['menu_value']; } ?>
                        <a href="<?php echo ($url); ?>" class="dropdown-toggle"><?php echo ($vo['info']['title']); ?></a>
                        <?php if(!is_null($vo['child']) && count($vo['child'] > 0)) { ?>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <?php $uls = ceil(count($vo['child'])/5); for($index = 0; $index < $uls; $index ++){ ?>
                                        <ul class="list-unstyled">
                                            <?php if(is_array($vo["child"])): $i = 0; $__LIST__ = array_slice($vo["child"],$index*5,5,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$child): $mod = ($i % 2 );++$i; $suburl = $child['path']; if($child['menu_type'] == 'cid'){ $suburl = '/home/goods/category/cid/'.$child['menu_value']; } ?>
                                                <li><a href="<?php echo ($suburl); ?>"><?php echo ($child["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
    </div>
</nav>

<script>
    $(function(){
        $('#btn-search').click(function(){
            subsearch();
        });
    });

    function subsearch(){
        var search = $('#txt-search').val();
        if(!search){
            alert('请输入搜索的关键词哦！');
            return false;
        }
        else {
            window.location.href = '/home/goods/search/keywords/' + search;
            return false;
        }
    }
</script>
<!--//////////////////////////////////////////////////-->
<!--///////////////////Cart Page//////////////////////-->
<!--//////////////////////////////////////////////////-->
<style>
    .mytb td img{
        width: 30px !important;
        height: 30px !important;
    }
</style>
<script>
    function cartall(){
        var ids = [], cous = [];

        $('input[name="selectGoods"]:checked').each(function(index, obj){
            var tr = $(obj).parent().parent();
            var id = tr.children('td:eq(1)').text(),
                    cou = tr.find('input[name="count"]').val();
            ids.push(id);
            cous.push(cou);
        });

        $.ajax({
            url: '/home/goods/checkodinfo',
            data: {'ids[]': ids, 'cous[]': cous},
            type: 'post',
            dataType: 'json',
            success: function(data){
                if(data.state == 1)
                {
                    window.location.href = '/home/goods/checkOrder/order/' + data.order;
                }
            }
        });
    };
</script>
<div id="page-content" class="single-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="breadcrumb">
                    <li><a href="/">首页</a></li>
                    <li>购物车</li>
                </ul>
            </div>
        </div>

        <div class="row">
            <table class="table mytb">
                <tr>
                    <th><input type="checkbox" id="selectAll" checked="checked"></th>
                    <th style="display: none;">编号</th>
                    <th width="10%">图片</th>
                    <th width="58%">商品</th>
                    <th width="8%">单价（元）</th>
                    <th width="8%">促销价</th>
                    <th width="10%">数量</th>
                    <th width="6%">操作</th>
                </tr>
                <?php if(is_array($cartGoods)): $i = 0; $__LIST__ = $cartGoods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><tr>
                        <td><input type="checkbox" checked="checked" name="selectGoods"></td>
                        <td style="display: none;"><?php echo ($goods["goods_id"]); ?></td>
                        <td><img src="<?php echo getImgsrc($goods['goods_img']);?>" alt="<?php echo ($goods["goods_name"]); ?>" width="30" height="30"></td>
                        <td><?php echo ($goods["goods_name"]); ?></td>
                        <td><?php echo ($goods["shop_price"]); ?></td>
                        <td><?php echo ($goods["promote_price"]); ?></td>
                        <td>
                            <button onclick="minuxGoods(this)">-</button>
                            <input type="text" value="<?php echo ($goods["count"]); ?>" name="count" style="width: 30px; text-align: center;">
                            <button onclick="addGoods(this)">+</button>
                        </td>
                        <td>
                            <button onclick="delCart(this, <?php echo ($goods["goods_id"]); ?>)">删除</button>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </table>
        </div>
        
        <div class="row">
            <div class="pricedetails">
                <div class="col-md-4 col-md-offset-8">
                    <table>
                        <h6>购物车</h6>
                        <tr>
                            <td>商品总计</td>
                            <td id="goods_count"><?php echo ($gsprice); ?></td>
                        </tr>
                        <tr>
                            <td>优惠</td>
                            <td id="goods_yh"><?php echo ($gpprice); ?></td>
                        </tr>
                        <tr>
                            <td>运费</td>
                            <td>0.00</td>
                        </tr>
                        <tr style="border-top: 1px solid #333">
                            <td><h5>总计</h5></td>
                            <td id="all_count"><?php echo ($allCount); ?></td>
                        </tr>
                    </table>
                    <center><a href="javascript:void(0);" onclick="cartall()" class="btn btn-1">提交订单</a></center>
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
    function minuxGoods(obj){
        var numbers = $(obj).parent().find('input[name="count"]'),
                count = numbers.val();
        if(count > 1)
        {
            numbers.val(parseInt(count) - 1);

            var tr = $(obj).parent().parent();
            var shopprice = tr.children('td:eq(3)').text(),
                    promotePrice = tr.children('td:eq(4)').text(),
                    goodsNumber = tr.find('input[name="count"]').val();
            var state = $(this).prop('checked');

            var goodsCount = $('#goods_count').text(),
                    goodsyh = $('#goods_yh').text(),
                    allCount = $('#all_count').text();

            var yh = shopprice - promotePrice,
                    newAllCount = parseFloat(goodsCount) - parseFloat(shopprice),
                    newyh = parseFloat(goodsyh) - parseFloat(yh);
            $('#goods_count').text(Number(newAllCount).toFixed(2));
            $('#goods_yh').text(Number(newyh).toFixed(2));
            $('#all_count').text(Number(newAllCount - newyh).toFixed(2));
        }
    }

    function addGoods(obj){
        var numbers = $(obj).parent().find('input[name="count"]'),
                count = numbers.val();
        numbers.val(parseInt(count) + 1);

        var tr = $(obj).parent().parent();
        var shopprice = tr.children('td:eq(4)').text(),
                promotePrice = tr.children('td:eq(5)').text(),
                goodsNumber = tr.find('input[name="count"]').val();
        var state = $(this).prop('checked');

        var goodsCount = $('#goods_count').text(),
                goodsyh = $('#goods_yh').text(),
                allCount = $('#all_count').text();

        var yh = shopprice - promotePrice,
                newAllCount = parseFloat(goodsCount) + parseFloat(shopprice),
                newyh = parseFloat(goodsyh) + parseFloat(yh);
        $('#goods_count').text(Number(newAllCount).toFixed(2));
        $('#goods_yh').text(Number(newyh).toFixed(2));
        $('#all_count').text(Number(newAllCount - newyh).toFixed(2));
    }

    function updateCount(obj, gid){
        var cou = $(obj).prev('input').val();
        if(isNaN(cou) || cou < 1){
            alert("请输入大于0的整数！");
            return;
        }

        $.ajax({
            url: '/home/goods/updateCount',
            data: {gid: gid, cou: cou},
            type: 'post',
            dataType: 'json',
            success: function(data){
                if(data.state == 1)
                {
                    $('#goods_count').text(data.gsprice);
                    $('#goods_yh').text(data.gpprice);
                    $('#all_count').text(data.allCount);

                    alert('更新成功！');
                }
            }
        });
    }

    var countall = 0;
    $(function(){
       $('input[name="count"]').focusin(
           function(){
               countall = $(this).val();
           }
       );
        $('input[name="count"]').focusout(
                function(){
                    var val = $(this).val();
                    if(!(new RegExp(/\d+/).test(val))){
                        alert("需输入整数！");
                        $(this).val(countall);
                    }
                }
        );

        $('#selectAll').change(function(){
           var state = $(this).prop('checked');
            if(state){
                $('input[name="selectGoods"]').each(function(index, data){
                    if(!$(data).prop('checked')) {
                        $(data).prop('checked', 'checked');
                        $(data).change();
                    }
                })
            }
            else{
                $('input[name="selectGoods"]').each(function(index, data){
                    if($(data).prop('checked')) {
                        $(data).removeAttr('checked');
                        $(data).change();
                    }
                })
            }
        });

        $('input[name="selectGoods"]').change(function(){
            var tr = $(this).parent().parent();
            var shopprice = tr.children('td:eq(4)').text(),
                    promotePrice = tr.children('td:eq(5)').text(),
                    goodsNumber = tr.find('input[name="count"]').val();
            var state = $(this).prop('checked');

            var goodsCount = $('#goods_count').text(),
                    goodsyh = $('#goods_yh').text(),
                    allCount = $('#all_count').text();

            if(state){
                var yh = shopprice - promotePrice,
                        newAllCount = parseFloat(goodsCount) + parseFloat(shopprice * goodsNumber),
                        newyh = parseFloat(goodsyh) + parseFloat(yh*goodsNumber);
                $('#goods_count').text(Number(newAllCount).toFixed(2));
                $('#goods_yh').text(Number(newyh).toFixed(2));
                $('#all_count').text(Number(newAllCount - newyh).toFixed(2));
            }
            else{
                var yh = shopprice - promotePrice,
                        newAllCount = parseFloat(goodsCount) - parseFloat(shopprice * goodsNumber),
                        newyh = goodsyh - yh*goodsNumber;
                $('#goods_count').text(Number(newAllCount).toFixed(2));
                $('#goods_yh').text(Number(newyh).toFixed(2));
                $('#all_count').text(Number(newAllCount - newyh).toFixed(2));
            }
        });
    });

    function delCart(obj, id){
        $.ajax({
            url: '/home/goods/delCart',
            data: {id: id},
            type: 'post',
            success: function(data){
                alert('删除成功！');
                $(obj).parent().parent().remove();
                var cartcount = $('#cart-count');
                cartcount.text(cartcount.text() - 1);
            }
        });
    }
</script>
</body>
</html>