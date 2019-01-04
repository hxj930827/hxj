<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>弹出层</title>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.all.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.min.js"></script>
	<style>
    /**右键菜单*/
    .rightmenu {
        position: absolute;
        width: 110px;
        z-index: 9999;
        display: none;
        background-color: #fff;
        padding: 2px;
        color: #333;
        border: 1px solid #eee;
        border-radius: 2px;
        cursor: pointer;
    }

    .rightmenu li {
        text-align: center;
        display: block;
        height: 30px;
        line-height: 32px;
    }

    .rightmenu li:hover {
        background-color: #666;
        color: #fff;
    }
</style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">layui 后台布局</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
			<li class="layui-nav-item"><a href="javascript:;"
				id="animation-left-nav">收缩菜单</a>
			<li class="layui-nav-item"><a href="index.jsp"
				target="myFrameName">控制台</a></li>
			<li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
			<li class="layui-nav-item"><a href="">用户</a></li>
			<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">邮件管理</a>
					</dd>
					<dd>
						<a href="">消息管理</a>
					</dd>
					<dd>
						<a href="">授权管理</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item"><a href="javascript:;"> <img
					src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
			</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">基本资料</a>
					</dd>
					<dd>
						<a href="">安全设置</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">退了</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree">
				<li class="layui-nav-item layui-nav-itemed"><a class=""
					href="javascript:;">所有商品</a>
					<dl class="layui-nav-child">
						<dd>
							<a data-url="form.jsp" data-id="11" data-title="选项a" href="#" class="site-demo-active" data-type="tabAdd">列表一</a>
						</dd>
						<dd>
							<a href="javascript:;" data-url="table.jsp" data-id="12" data-title="选项b" class="site-demo-active" data-type="tabAdd">列表二</a>
						</dd>
						<dd>
							<a href="javascript:;" data-url="tableNum.jsp" data-id="13" data-title="选项c" class="site-demo-active" data-type="tabAdd">数据表格</a>
						</dd>
						<dd>
							<a href="">超链接</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">列表一</a>
						</dd>
						<dd>
							<a href="javascript:;">列表二</a>
						</dd>
						<dd>
							<a href="">超链接</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">云市场</a></li>
				<li class="layui-nav-item"><a href="">发布商品</a></li>
			</ul>
		</div>
	</div>

	<div class="layui-body">
		<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
               <ul class="layui-tab-title">
               </ul>
               <ul class="rightmenu">
                   <li data-type="closeOther">关闭其它</li>
                   <li data-type="closeThis">关闭当前</li>
                   <li data-type="closeAll">关闭所有</li>
               </ul>
<!-- 	            <ul class="layui-nav" style="width:50px">
	              <li class="layui-nav-item">
	                <a href="javascript:;">测试</a>
	                <dl class="layui-nav-child">
	                  <dd><a href="">关闭当前</a></dd>
	                  <dd><a href="">关闭所有</a></dd>
	                </dl>
	              </li>
	            </ul> -->
               <div class="layui-tab-content"></div>
           </div>
           
	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->
		<center>© layui.com - 底部固定区域</center>
	</div>
</div>
<script>
//这里定义一个全局变量来方便判断动画收缩的效果
var i = 0;
//JavaScript代码区域
layui.use('element',function() {
		var element = layui.element;
		element.render("nav");

		//触发事件
		var active = {
			//在这里给active绑定几项事件，后面可通过active调用这些事件
			tabAdd : function(url, id, name) {
				//新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
				//关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
				element.tabAdd('demo',{
									title : name,
									content : '<iframe data-frameid="'
											+ id
											+ '" scrolling="auto" frameborder="0" src="'
											+ url
											+ '" style="width:100%;height:99%;"></iframe>',
									id : id
								//规定好的id
								})
				CustomRightClick(id); //给tab绑定右击事件
				FrameWH(); //计算ifram层的大小
				
			},
               tabChange: function(id) {
                   //切换到指定Tab项
                   element.tabChange('demo', id); //根据传入的id传入到指定的tab项
               }, 
               tabDelete: function (id) {
                   element.tabDelete("demo", id);//删除
               }, 
               tabDeleteAll: function (ids) {//删除所有
                       $.each(ids, function (i,item) {
                           element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                       })
               }
		};

		//当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
		$('.site-demo-active').on('click',function() {
			var dataid = $(this);
			//这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
			if ($(".layui-tab-title li[lay-id]").length <= 0) {
				//如果比零小，则直接打开新的tab项
				active.tabAdd(dataid.attr("data-url"),dataid.attr("data-id"),dataid.attr("data-title"));
			} else {
				//否则判断该tab项是否以及存在

				var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
				$.each($(".layui-tab-title li[lay-id]"),function() {
					//如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
					if ($(this).attr("lay-id") == dataid.attr("data-id")) {
						isData = true;
					}
				})
				if (isData == false) {
					//标志为false 新增一个tab项
					active.tabAdd(dataid.attr("data-url"),
									dataid.attr("data-id"),
									dataid.attr("data-title"));
				}
			}
			//最后不管是否新增tab，最后都转到要打开的选项页面上
			active.tabChange(dataid.attr("data-id"));
		});

		function CustomRightClick(id) {
			//取消右键  rightmenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
			$('.layui-tab-title li').on('contextmenu',
					function() {
						return false;
					})
			$('.layui-tab-title,.layui-tab-title li')
					.click(function() {
						$('.rightmenu').hide();
					});
			//桌面点击右击 
			$('.layui-tab-title li').on('contextmenu',function(e) {
				// 获取点击的当前选项卡的lay-id的值
				var a=$(this).attr("lay-id");
				var popupmenu = $(".rightmenu");
				//在右键菜单中的标签绑定id属性，用于下面的关闭选项卡的操作
				popupmenu.find("li").attr("data-id", a);

				//判断右侧菜单的位置 
			     l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
                 t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
                 popupmenu.css({
						left : l-200,
						top : t-60
					}).show(); //进行绝对定位
					//alert("右键菜单")
					return false;
			});
		}

        //就需要给右键添加功能
        $(".rightmenu li").click(function () {
            if ($(this).attr("data-type") == "closeOther") {//关闭其他
            	// 获取鼠标当前位置选项卡的lay-id  (点击右键的时候，系统会触发CustomRightClick方法，将lay-id的值赋值给data-id)
            	var deleteIndex=$(this).attr("data-id");
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id")!=deleteIndex) {
                        console.log("即将删除lay-id"+$(this).attr("lay-id"));
                        active.tabDelete($(this).attr("lay-id"));
                    }
                });
            } else if ($(this).attr("data-type") == "closeAll") {//关闭所有
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                $.each(tabtitle, function (i) {
                    ids[i] = $(this).attr("lay-id");
                });
                active.tabDeleteAll(ids);
            } else if($(this).attr("data-type")=="closeThis"){//关闭当前
            	
            	//如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
                active.tabDelete($(this).attr("data-id"))
            }
            $('.rightmenu').hide();
        });
		function FrameWH() {
			var h = $(window).height() - 41 - 10 - 60 - 10
					- 80 - 10;
			$("iframe").css("height", h + "px");
		}

		$(window).resize(function() {
			FrameWH();
		})
});

//通过图标id来触发左侧导航栏收缩功能动画效果
$('#animation-left-nav').click(function() {
	//这里定义一个全局变量来方便判断动画收缩的效果,也就是放在最外面
	if (i == 0) {
		$(".layui-side").animate({
			width : 'toggle'
		});
		$(".layui-body").animate({
			left : '0px'
		});
		$(".layui-footer").animate({
			left:'0px'
		})
		i++;
	} else {
		$(".layui-side").animate({
			width : 'toggle'
		});
		$(".layui-body").animate({
			left : '200px'
		});
		$(".layui-footer").animate({
			left:'200px'
		})
		i--;
	}
});
//左侧导航栏收缩提示
$('#animation-left-nav').hover(function() {
	layer.tips('收缩左侧导航栏', '#animation-left-nav', {
		tips : [ 4, '#FF8000' ],
		time : 0
	});
}, function() {
	layer.closeAll('tips');
});
	</script>
</body>
</html>