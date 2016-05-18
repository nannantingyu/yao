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
<link href="/Public/Home/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="/Public/Home/css/detail.css" rel="stylesheet" type="text/css" media="all" />
<script src="/Public/Home/js/jquery-2.1.1.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="/Public/Home/js/bootstrap.min.js"></script>
<script src="/Public/Home/js/simpleCart.min.js"> </script>
<link rel="stylesheet" href="/Public/Home/css/flexslider.css" type="text/css" media="screen" />

<div class="container">
    <div class="products-page">
        <div class="products">
            <div class="product-listy">
                <h2>值得一看</h2>
                <ul class="product-list">
                    <li><a href="">New Products</a></li>
                    <li><a href="">Old Products</a></li>
                    <li><a href="">T-shirts</a></li>
                    <li><a href="">pants</a></li>
                    <li><a href="">Dress</a></li>
                    <li><a href="">Shorts</a></li>
                    <li><a href="#">Shirts</a></li>
                    <li><a href="register.html">Register</a></li>
                </ul>
            </div>
            <div class="latest-bis">
                <a href="/home/index/product/id/<?php echo ($feature["goods_id"]); ?>">
                    <img src="<?php echo getImgSrc($feature['goods_img']);?>" class="img-responsive" alt="<?php echo ($feature["goods_name"]); ?>" />
                </a>
                <div class="offer">
                    <p>超值</p>
                    <small>强烈推荐</small>
                </div>
            </div>
            <div class="tags">
                <h4 class="tag_head">品牌推荐</h4>
                <ul class="tags_links">
                    <?php if(is_array($brands)): $i = 0; $__LIST__ = $brands;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($vo["brand_id"]); ?>"><?php echo ($vo["brand_name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>

        </div>
        <div class="new-product">
            <div class="col-md-5 zoom-grid">
                <div class="flexslider">
                    <ul class="slides">
                        <?php if(is_array($imgs)): $i = 0; $__LIST__ = $imgs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li data-thumb="<?php echo ($vo); ?>">
                                <div class="thumb-image"> <img width="100" height="64" src="<?php echo ($vo); ?>" data-imagezoom="true" class="img-responsive" alt="" /> </div>
                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </div>
            <div class="col-md-7 dress-info">
                <div class="dress-name">
                    <h3><?php echo ($goods["goods_name"]); ?></h3>
                    <span style="vertical-align: middle; line-height: 56px;">¥<?php echo ($goods["promote_price"]); ?></span>
                    <div class="clearfix"></div>
                    <p><?php echo ($goods["goods_desc"]); ?></p>
                    <input type="hidden" id="gid" value="<?php echo ($goods["goods_id"]); ?>">
                </div>
                <?php if(is_array($attrs)): $i = 0; $__LIST__ = $attrs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="span span1">
                        <p class="left"><?php echo ($vo["attr_name"]); ?></p>
                        <p class="right">
                            <?php $values = $vo['value']; ?>
                            <select name="attr_value">
                                <?php if(is_array($values)): $i = 0; $__LIST__ = $values;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><option value="<?php echo ($val); ?>"><?php echo ($val); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </p>
                        <div class="clearfix"></div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                <div class="purchase" style="padding-left: 17px;">
                    <div class="row">
                        <button onclick="minuxGoods(this)">-</button>
                        <input type="text" value="1" id="count" style="width: 30px; text-align: center;">
                        <button onclick="addGoods(this)">+</button>
                        <a href="javascript: addIntoCarts();">加入购物车</a>
                    </div>
                    <div class="row" style="padding-top: 30px;">
                        <a href="javascript: buyNow();" class="btn btn-info">立即购买</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <script src="/Public/Home/js/imagezoom.js"></script>
                <!-- FlexSlider -->
                <script defer src="/Public/Home/js/jquery.flexslider.js"></script>
                <script>
                    // Can also be used with $(document).ready()
                    $(window).load(function() {
                        $('.flexslider').flexslider({
                            animation: "slide",
                            controlNav: "thumbnails"
                        });
                    });
                </script>
            </div>
            <div class="clearfix"></div>
            <div class="reviews-tabs">
                <!-- Main component for a primary marketing message or call to action -->
                <ul class="nav nav-tabs responsive hidden-xs hidden-sm" id="myTab">
                    <li class="test-class active"><a class="deco-none misc-class" href="#how-to"> 更多详情</a></li>
                    <!--<li class="test-class"><a href="#features">功能</a></li>-->
                    <li class="test-class"><a class="deco-none" href="#source">评价 <?php echo count($comment);?></a></li>
                </ul>

                <div class="tab-content responsive hidden-xs hidden-sm">
                    <div class="tab-pane active" id="how-to">
                        <?php echo ($goods["goods_info"]); ?>
                    </div>
                    <div class="tab-pane" id="features">
                        <p class="tab-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.This tab has icon in consectetur adipiscing eliconse consectetur adipiscing elit. Vestibulum nibh urna, ctetur adipiscing elit. Vestibulum nibh urna, t.consectetur adipiscing elit. Vestibulum nibh urna,  Vestibulum nibh urna,it.</p>
                        <p class="tab-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available,
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    <div class="tab-pane" id="source">
                        <?php if(is_array($comment)): $i = 0; $__LIST__ = $comment;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="response">
                                <div class="media response-info">
                                    <div class="media-left response-text-left">
                                        <a href="#">
                                            <img class="media-object" src="/Public/Home/images/icon1.png" alt="" />
                                        </a>
                                        <h5><a href="#"><?php echo ($vo["user_name"]); ?></a><span style="padding-left: 20px;"><?php echo ($vo["comment_rank"]); ?>分</span></h5>
                                    </div>
                                    <div class="media-body response-text-right">
                                        <p><?php echo ($vo["content"]); ?></p>
                                        <ul>
                                            <li><?php echo ($vo["add_time"]); ?></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="other-products products-grid">
    <div class="container">
        <header>
            <h3 class="like text-center">猜你喜欢</h3>
        </header>
        <?php if(is_array($related)): $i = 0; $__LIST__ = $related;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $img = getImgSrc($vo['goods_img']); ?>
            <div class="col-md-4 product simpleCart_shelfItem text-center">
                <a href="/home/index/product/id/<?php echo ($vo["goods_id"]); ?>.html"><img class="relate-img" src="<?php echo ($img); ?>" alt="<?php echo ($vo["goods_name"]); ?>" /></a>
                <div class="mask">
                    <a href="/home/index/product/id/<?php echo ($vo["goods_id"]); ?>.html"><?php echo ($vo["goods_name"]); ?></a>
                </div>
                <p><a class="item_add" href="#"><i></i> <span class="item_price"><?php echo ($vo["promote_price"]); ?></span></a></p>
            </div><?php endforeach; endif; else: echo "" ;endif; ?>
        <div class="clearfix"></div>
    </div>
</div>
<!-- content-section-ends -->
<div class="news-letter">
    <div class="container">
        <div class="join">
            <h6>订阅我们</h6>
            <div class="sub-left-right">
                <form>
                    <input type="text" value="Enter Your Email Here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Email Here';}" />
                    <input type="submit" value="订阅" />
                </form>
            </div>
            <div class="clearfix"> </div>
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

<script src="/Public/Home/js/responsive-tabs.js"></script>
<script type="text/javascript">
    $( '#myTab a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
    } );

    $( '#moreTabs a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
    } );

    ( function( $ ) {
        // Test for making sure event are maintained
        $( '.js-alert-test' ).click( function () {
            alert( 'Button Clicked: Event was maintained' );
        } );
        fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
    } )( jQuery );

    function minuxGoods(obj){
        var count = $('#count').val();
        if(count <= 1){
            return;
        }

        $('#count').val(count-1);
    }

    function addGoods(obj){
        var count = $('#count').val();
        $('#count').val(parseInt(count)+1);
    }

    function addIntoCarts(){
        var count = $('#count').val(),
                gid = $('#gid').val();
        addCart(gid, count);
    }

    function buyNow()
    {
        var gid = $('#gid').val(),
                count = $('#count').val();
        window.location.href = '/home/goods/buyNow/gid/' + gid + '/count/' + count;
    }
</script>

</body>
</html>