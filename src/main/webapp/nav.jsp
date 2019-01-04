<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>定义导航栏</title>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.all.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<ul class="layui-nav" lay-filter="nav">
		<li class="layui-nav-item"><a href="">最新活动</a></li>
		<li class="layui-nav-item"><a href="">产品</a></li>
		<li class="layui-nav-item"><a href="">大数据</a></li>
		<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
			<dl class="layui-nav-child">
				<!-- 二级菜单 -->
				<dd>
					<a href="">移动模块</a>
				</dd>
				<dd>
					<a href="">后台模版</a>
				</dd>
				<dd>
					<a href="">电商平台</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="">社区</a></li>
	</ul>
	<!-- 水平导航 -->
	<ul class="layui-nav">
		<li class="layui-nav-item"><a href="">控制台<span
				class="layui-badge">9</span></a></li>
		<li class="layui-nav-item"><a href="">个人中心<span
				class="layui-badge-dot"></span></a></li>
		<li class="layui-nav-item"><a href="">我</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="index.jsp">修改信息</a>
				</dd>
				<dd>
					<a href="#">安全管理</a>
				</dd>
				<dd>
					<a href="#">退出</a>
				</dd>
			</dl></li>
	</ul>

	<!-- 垂直导航 -->
	<ul class="layui-nav layui-nav-tree">
		<!-- 侧边导航 -->
		<!-- <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
		<li class="layui-nav-item"><a href="javascript:;">默认导航</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="javascript:;">选项1</a>
					<dl class="layui-nav-child layui-bg-blue">
						<dd>
							<a href="">邮件管理2</a>
						</dd>
						<dd>
							<a href="">消息管理2</a>
						</dd>
						<dd>
							<a href="">授权管理2</a>
						</dd>
					</dl>
				</dd>
				<dd>
					<a href="">选项2</a>
				</dd>
				<dd>
					<a href="">选项3</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="">移动模块</a>
				</dd>
				<dd>
					<a href="">后台模块</a>
				</dd>
				<dd>
					<a href="">电商模块</a>
				</dd>
			</dl></li>
	</ul>
	<script>
		layui.config({
			base : 'plugins/build/js/'
		}).use([ 'app' ], function() {
			var app = layui.app, $ = layui.jquery, layer = layui.layer;
			//主入口
			app.set({
				type : 'iframe'
			}).init();
		});
	</script>
</body>
</html>