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
	<!--///////////////////Category Page//////////////////-->
	<!--//////////////////////////////////////////////////-->
<style>
	.products .image img{
		height: 240px !important;
	}
</style>
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="/">首页</a></li>
						<li>搜索"<?php echo ($keywords); ?>"结果</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-12">
					<?php $lines = ceil(count($searchGoods) / 4); for($index = 0; $index < $lines; $index ++){ ?>
						<div class="row">
							<div class="col-md-12">
								<div class="products">
									<?php if(is_array($searchGoods)): $i = 0; $__LIST__ = array_slice($searchGoods,$index*4,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><div class="col-lg-3 col-md-3 col-xs-12">
											<div class="product">
												<div class="image"><a href="/home/index/product/id/<?php echo ($goods["goods_id"]); ?>.html"><img src="<?php echo getImgsrc($goods['goods_img']);?>" alt="<?php echo ($goods["goods_name"]); ?>"/></a></div>
												<div class="buttons">
													<a class="btn cart" href="javascript: void(0);" onclick="addCart(<?php echo ($goods["goods_id"]); ?>)">
														<span class="glyphicon glyphicon-shopping-cart"></span></a>
													<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
													<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
												</div>
												<div class="caption">
													<div class="name"><h3><a href="/home/index/product/id/<?php echo ($goods["goods_id"]); ?>.html"><?php echo ($goods["goods_name"]); ?></a></h3></div>
													<div class="price"><?php echo ($goods["promote_price"]); ?><span><?php echo ($goods["shop_price"]); ?></span></div>
													<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
												</div>
											</div>
										</div><?php endforeach; endif; else: echo "" ;endif; ?>
								</div>
							</div>
						</div>
					</volist>
					<?php } ?>
					<div class="row text-center">
						<!--<ul class="pagination">-->
						  <!--<li class="active"><a href="#">1</a></li>-->
						  <!--<li><a href="#">2</a></li>-->
						  <!--<li><a href="#">3</a></li>-->
						  <!--<li><a href="#">4</a></li>-->
						  <!--<li><a href="#">5</a></li>-->
						<!--</ul>-->
						<div class="page" style="display: inline-block; margin: 0px auto">
							<?php echo ($_page); ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>

	//全局变量，动态的文章ID
	var href = "",
			txt = '';
	//绑定所有分享按钮所在A标签的鼠标移入事件，从而获取动态ID
	$(function () {
		$("img").mouseover(function () {
			href = $(this).parent().attr('href');
			txt = $(this).attr('alt');
		});
	});

	/*
	 * 动态设置百度分享URL的函数,具体参数
	 * cmd为分享目标id,此id指的是插件中分析按钮的ID
	 *，我们自己的文章ID要通过全局变量获取
	 * config为当前设置，返回值为更新后的设置。
	 */
	function SetShareUrl(cmd, config) {
		if (href) {
			config.bdUrl = "http://yao.com" + href;
			config.bdText = '小伙伴注意啦，"' + txt + '"大减价啦，快来看看！' ;
		}
		return config;
	}

	//插件的配置部分，注意要记得设置onBeforeClick事件，主要用于获取动态的文章ID
	window._bd_share_config = {
		"common": {
			onBeforeClick:SetShareUrl,
			"bdSnsKey":{},
			"bdMini":"2",
			"bdMiniList":false,
			"bdPic":"",
			"bdStyle":"0",
			"bdSize":"24"
		},
		"share": {},
		image : [{
			viewType : 'list',
			viewPos : 'top',
			viewColor : 'black',
			viewSize : '16',
			viewList : ['qzone','tsina','huaban','tqq','renren']
		}],
	};

	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
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