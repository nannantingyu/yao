<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ZCStore后台管理</title>
    <link href="/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/webuploader/webuploader.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/uploader.js"></script>
    <!--<![endif]-->
    
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/js/webuploader/uploader.css">
	<style>
		.dragsort {
		    width:400px;
		}
		img.thumb{
			height: 235px !important;
		}
	</style>

</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
	<div id="subnav" class="subnav">
    <?php if(!empty($_extra_menu)): ?>
        <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
    <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
        <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
            <ul class="side-sub-menu">
                <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                        <a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
    <h3>
        <i class="icon <?php if(!in_array((ACTION_NAME), explode(',',"index,gattr,editgoods,editattr"))): ?>icon-fold<?php endif; ?>"></i>商品管理
    </h3>
 	<ul class="side-sub-menu <?php if(!in_array((ACTION_NAME), explode(',',"index,gattr,editgoods,editattr"))): ?>subnav-off<?php endif; ?>">
        <li <?php if((ACTION_NAME) == "index"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('goods/index');?>">全部商品</a></li>
        <li <?php if((ACTION_NAME) == "gattr"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('goods/gattr');?>">商品属性</a></li>
 	</ul>
    <h3>
        <i class="icon <?php if(!in_array((ACTION_NAME), explode(',',"gcat,attr,brand,editattr,editbrand"))): ?>icon-fold<?php endif; ?>"></i>相关管理
    </h3>
    <ul class="side-sub-menu <?php if(!in_array((ACTION_NAME), explode(',',"gcat,attr,brand,editattr,editbrand"))): ?>subnav-off<?php endif; ?>">
        <li <?php if((ACTION_NAME) == "gcat"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('goods/gcat');?>">商品类型</a></li>
        <li <?php if((ACTION_NAME) == "attr"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('goods/attr');?>">商品属性</a></li>
        <li <?php if((ACTION_NAME) == "brand"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('goods/brand');?>">品牌管理</a></li>
    </ul>

    <?php if(is_array($nodes)): $i = 0; $__LIST__ = $nodes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
        <?php if(!empty($sub_menu)): ?><h3>
            	<i class="icon <?php if(($sub_menu['current']) != "1"): ?>icon-fold<?php endif; ?>"></i>
            	<?php if(($sub_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (u($sub_menu["url"])); ?>"><?php echo ($sub_menu["title"]); ?></a><?php else: echo ($sub_menu["title"]); endif; ?>
            </h3>
            <ul class="side-sub-menu <?php if(($sub_menu["current"]) != "1"): ?>subnav-off<?php endif; ?>">
                <?php if(is_array($sub_menu['_child'])): $i = 0; $__LIST__ = $sub_menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li <?php if($menu['id'] == $cate_id or $menu['current'] == 1): ?>class="current"<?php endif; ?>>
                        <?php if(($menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($menu["title"]); ?></a><?php endif; ?>

                        <!-- 一级子菜单 -->
                        <?php if(isset($menu['_child'])): ?><ul class="subitem">
                        	<?php if(is_array($menu['_child'])): foreach($menu['_child'] as $key=>$three_menu): ?><li>
                                <?php if(($three_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (u($three_menu["url"])); ?>"><?php echo ($three_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($three_menu["title"]); ?></a><?php endif; ?>
                                <!-- 二级子菜单 -->
                                <?php if(isset($three_menu['_child'])): ?><ul class="subitem">
                                	<?php if(is_array($three_menu['_child'])): foreach($three_menu['_child'] as $key=>$four_menu): ?><li>
                                        <?php if(($four_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo U('index','cate_id='.$four_menu['id']);?>"><?php echo ($four_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($four_menu["title"]); ?></a><?php endif; ?>
                                        <!-- 三级子菜单 -->
                                        <?php if(isset($four_menu['_child'])): ?><ul class="subitem">
                                        	<?php if(is_array($four_menu['_child'])): $i = 0; $__LIST__ = $four_menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$five_menu): $mod = ($i % 2 );++$i;?><li>
                                            	<?php if(($five_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo U('index','cate_id='.$five_menu['id']);?>"><?php echo ($five_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($five_menu["title"]); ?></a><?php endif; ?>
                                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul><?php endif; ?>
                                        <!-- end 三级子菜单 -->
                                    </li><?php endforeach; endif; ?>
                                </ul><?php endif; ?>
                                <!-- end 二级子菜单 -->
                            </li><?php endforeach; endif; ?>
                        </ul><?php endif; ?>
                        <!-- end 一级子菜单 -->
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
    <!-- 回收站 -->
	<?php if(($show_recycle) == "1"): ?><h3>
        <em class="recycle"></em>
        <a href="<?php echo U('article/recycle');?>">回收站</a>
    </h3><?php endif; ?>
</div>
<script>
    $(function(){
        $(".side-sub-menu li").hover(function(){
            $(this).addClass("hover");
        },function(){
            $(this).removeClass("hover");
        });
    })
</script>


        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            

	<script type="text/javascript" src="/Public/static/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="/Public/Admin/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/Public/Admin/js/ueditor/ueditor.all.js"></script>
	<!-- 标题栏 -->
	<div class="main-title cf">
		<h2><?php if(isset($goods)): ?>编辑<?php else: ?>新增<?php endif; ?>商品</h2>
	</div>

		<!-- 修改密码表单 -->
	<form method="post" class="form-horizontal" name="myForm">
		<div class="form-item cf">
			<label class="item-label">商品名称</label>
			<div class="controls">
				<input type="text" value="<?php echo ($goods["goods_name"]); ?>" name="goods_name" class="form-control">
			</div>
		</div>
		<div class="form-item cf">
			<label class="item-label">商品分类</label>
			<div class="controls">
				<select name="cat_id" class="form-control">
					<?php if(is_array($goodstypes)): $i = 0; $__LIST__ = $goodstypes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["detail"]["cat_id"]); ?>" <?php if(($goods["cat_id"]) == $vo["detail"]["cat_id"]): ?>selected<?php endif; ?>><?php echo ($vo["detail"]["cat_name"]); ?></option>
						<?php if(is_array($vo["data"])): $i = 0; $__LIST__ = $vo["data"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?><option value="<?php echo ($sub["cat_id"]); ?>" <?php if(($goods["cat_id"]) == $sub["cat_id"]): ?>selected<?php endif; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo ($sub["cat_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>
		</div>
		<div class="form-item cf">
			<label class="item-label">商品品牌</label>
			<div class="controls">
				<select name="brand_id" class="form-control">
					<?php if(is_array($brand)): $i = 0; $__LIST__ = $brand;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["brand_id"]); ?>" <?php if(($goods["brand_id"]) == $vo["brand_id"]): ?>selected<?php endif; ?>><?php echo ($vo["brand_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">商品价格</label>
			<div class="controls">
				<input type="text" value="<?php echo ($goods["shop_price"]); ?>" name="shop_price" class="form-control">
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">促销价格</label>
			<div class="controls">
				<input type="text" value="<?php echo ($goods["promote_price"]); ?>" name="promote_price" class="form-control">
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">商品图片</label>
			<div class="row">
				<?php $thumb = json_decode($goods['goods_img']); ?>
				<?php if(is_array($thumb)): $i = 0; $__LIST__ = $thumb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="col-sm-6 col-md-3">
						<a href="javascript: void(0);" class="thumbnail">
							<img src="<?php echo ($vo); ?>" class="thumb"
								 alt="通用的占位符缩略图">
						</a>
						<span style="position: absolute; top: 0px; right: 0px;">
							<a href="javascript: void(0);" onclick="deleteImg(this, <?php echo ($goods["goods_id"]); ?>, '<?php echo ($vo); ?>')">
								<img src="/Public/Admin/images/close.png" alt="" style="width: 25px; height: 25px;">
							</a>
						</span>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<div id="wrapper">
				<div id="container">
					<!--头部，相册选择和格式选择-->
					<div id="uploader">
						<div class="queueList">
							<div id="dndArea" class="placeholder">
								<div id="filePicker"></div>
								<p>或将照片拖到这里，单次最多可选300张</p>
							</div>
						</div>
						<div class="statusBar" style="display:none;">
							<div class="progress">
								<span class="text">0%</span>
								<span class="percentage"></span>
							</div><div class="info"></div>
							<div class="btns">
								<div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
							</div>
						</div>
					</div>
					<div id="imgs">
						<?php if(is_array($goods_img)): $i = 0; $__LIST__ = $goods_img;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><input type="hidden" name="imgs[]" value="<?php echo ($vo); ?>"><?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
				</div>
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">商品详情</label>
			<div class="controls">
				<script id="editor" type="text/plain" style="width:1024px;height:500px;"><?php echo ($goods["goods_info"]); ?></script>
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">商品描述</label>
			<div class="controls">
				<input type="text" value="<?php echo ($goods["goods_desc"]); ?>" name="goods_desc" class="form-control">
			</div>
		</div>

		<div class="form-item cf">
			<label class="item-label">添加时间</label>
			<div class="controls">
				<?php $addtime = $goods['add_time']?$goods['add_time']:date('Y-m-d H:i:s'); ?>
				<input type="text" value="<?php echo ($addtime); ?>" name="add_time" class="form-control">
			</div>
		</div>

		<input type="hidden" name="goods_id" value="<?php echo ($goods["goods_id"]); ?>">
		<input type="hidden" name="p" value="<?php echo I('get.p', 1);?>">
		<a type="button" onclick="submit()" class="btn btn-large" href="javascript: void(0);">确 定</a>
		<button class="btn btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
	</form>

        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用<a href="http://www.onethink.cn" target="_blank">OneThink</a>管理平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Public/static/think.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
	<?php if(isset($data)): ?><script type="text/javascript" src="/Public/static/jquery.dragsort-0.5.1.min.js"></script><?php endif; ?>
	<script type="text/javascript">
		var ue = null;
		$(function(){
			//导航高亮
			highlight_subnav('<?php echo U('goods/index');?>');


			var myUpload = new myUploader('uploader', 'queueList', "<?php echo U('File/uploadPicture');?>", function(response){
				$('#imgs').append('<input type="hidden" name="imgs[]" value="' + response['path'] + '">');
			});

			ue = UE.getEditor('editor');
		});

		function submit(){
			var goods_id = myForm.goods_id.value;
			var goods = {goods_name: myForm.goods_name.value,
					cat_id: myForm.cat_id.value,
					brand_id: myForm.brand_id.value,
					shop_price: myForm.shop_price.value,
					promote_price: myForm.promote_price.value,
					goods_info: ue.getContent(),
					goods_desc: myForm.goods_desc.value,
					add_time: myForm.add_time.value
			};

			if(goods_id){
				goods.goods_id = goods_id;
			}

			var imgs = [];
			$('input[name="imgs[]"]').each(function(index, data){
				imgs.push($(data).val());
			})
			goods.imgs = imgs;

			$.ajax({
				url: "<?php echo U('goods/editgoods');?>",
				type: 'post',
				dataType: 'json',
				data: goods,
				success: function(data){
					if(data.state == 1){
                                                var msg = '修改成功！';
                                                if(!goods_id){
                                                    msg = '添加成功';
                                                }
						$.when(alert(msg)).done(function(){
							window.location.href = "<?php echo U('goods/index', array('p'=>I('get.p', 1)));?>";
						});
					}
				}
			})
		}
	</script>
	<script>
		//删除图片
		function deleteImg(obj, id, path){
			$.ajax({
				url: "<?php echo U('goods/delImg');?>",
				data: {
					id: id,
					path: path
				},
				type: 'post',
				dataType: 'json',
				success: function(data) {
					if(data.state == 1){
						$(obj).parent().parent().remove();
						$('#imgs input[value="' + path + '"]').remove();

						alert('删除成功!');
					}
				}
			});
		}
	</script>

</body>
</html>