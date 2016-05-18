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
        function addCart(id){
            $.ajax({
                url: '/home/goods/addCart',
                data: {gid: id},
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
<div class="container">
    <?php if(is_array($allOrder)): $i = 0; $__LIST__ = $allOrder;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$order): $mod = ($i % 2 );++$i;?><div style="padding-bottom: 30px;">
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <tr>
                            <th width="20%"></th>
                            <th width="40%">名称</th>
                            <th width="10%">价格</th>
                            <th width="15%">支付时间</th>
                            <th width="15%">状态</th>
                            <?php if($order[0]['order_status'] == 2): ?><th width="20%">评价</th><?php endif; ?>
                        </tr>
                        <?php if(is_array($order)): $i = 0; $__LIST__ = $order;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                <td><img height="30" width="30" src="<?php echo getImgsrc($vo['goods_img']);?>" alt="<?php echo ($vo['goods_name']); ?>"></td>
                                <td><a href="/home/index/product/id/<?php echo ($vo['goods_id']); ?>"><?php echo ($vo['goods_name']); ?></a></td>
                                <td><?php echo ($vo['promote_price']); ?></td>
                                <td><?php echo ($vo['add_time']); ?></td>
                                <?php $states = '未支付'; if($vo['order_status'] == 1){ $states = '配送中'; } else if($vo['order_status'] == 2){ $states = '已确认收货'; } ?>
                                <td><?php echo ($states); ?></td>
                                <?php if($order[0]['order_status'] == 2): ?><td><button class="btn" onclick="remark(<?php echo ($vo["order_id"]); ?>, <?php echo ($vo["goods_id"]); ?>)">评价</button></td><?php endif; ?>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                    </table>
                </div>
                <?php if($order[0]['order_status'] == 0): ?><div class="row">
                        <div class="col-md-2 col-md-offset-5">
                            <button class="btn btn-info" onclick="payState(<?php echo ($order[0]['order_id']); ?>)">去支付</button>
                        </div>
                    </div><?php endif; ?>
                <?php if($order[0]['order_status'] == 1): ?><div class="row">
                        <div class="col-md-2 col-md-offset-5">
                            <button class="btn btn-info" onclick="confirmState(<?php echo ($order[0]['order_id']); ?>)">确认收货</button>
                        </div>
                    </div><?php endif; ?>
            </div>
        </div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    商品评价
                </h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="control-label col-md-2">打分</label>
                        <div class="col-md-9">
                            <select name="" id="remark" class="form-control">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="control-label col-md-2">评价</label>
                        <div class="col-md-9">
                            <textarea type="text" id="comment" class="form-control"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="comment()">
                    提交评价
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    var oid = 0, gid = 0;
    function confirmState(id){
        $.ajax({
            url: '/home/goods/confirmOrder',
            data: {'oid': id},
            type: 'post',
            dataType: 'json',
            success: function(data){
                if(data.state == 1)
                {
                    $.when(alert('确认收货成功！')).done(function(){
                        window.location.reload();
                    });
                }
            }
        });
    }

    function payState(id){
        $.ajax({
            url: '/home/goods/payOrder',
            data: {'oid': id},
            type: 'post',
            dataType: 'json',
            success: function(data){
                if(data.state == 1)
                {
                    $.when(alert('支付成功！')).done(function(){
                        window.location.reload();
                    });
                }
            }
        });
    }

    function remark(oids, gids){
        oid = oids;
        gid = gids;
        $('#myModal').modal('show');
    }

    function comment(){
        var remark = $('#remark').val(),
                comment = $('#comment').val();
        $.ajax({
            url: '/home/goods/comment',
            data: {oid: oid, gid: gid, remark: remark, comment: comment},
            type: 'post',
            dataType: 'json',
            success: function(data){
                if(data.state == 1)
                {
                    $.when($('#myModal').modal('hide')).done(function(){
                        alert('评价成功！');
                        $('#comment').val('');
                        $('#remark').val(1);
                    });
                }
            }
        });
    }
</script>
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