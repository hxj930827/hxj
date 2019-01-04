<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="plat/common/taglib/taglib.jsp"%>
<%@ include file="plat/common/scripts/scripts.jsp"%>
<html>
<head>
<title>非模块化用法</title>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
</head>
<body>
	<div class="layui-tab">
		<ul class="layui-tab-title">
			<li>标题一</li>
			<li class="layui-this">标题二</li>
			<li>标题三</li>
		</ul>
		<!-- 栅格布局 -->
		<div class="layui-container">
			常规布局（以中型屏幕桌面为例）：
			<div class="layui-row">
				<div class="layui-col-md9" style="background: #f00">你的内容 9/12</div>
				<div class="layui-col-md3 layui-bg-blue">你的内容 3/12</div>
			</div>

			移动设备、平板、桌面端的不同表现：
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md4">移动：6/12
					| 平板：6/12 | 桌面：4/12</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md4">移动：6/12
					| 平板：6/12 | 桌面：4/12</div>
				<div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
					移动：4/12 | 平板：12/12 | 桌面：4/12</div>
				<div class="layui-col-xs4 layui-col-sm7 layui-col-md8">移动：4/12
					| 平板：7/12 | 桌面：8/12</div>
				<div class="layui-col-xs4 layui-col-sm5 layui-col-md4">移动：4/12
					| 平板：5/12 | 桌面：4/12</div>
			</div>
		</div>
		<button class="layui-btn" lay-submit lay-filter="login">登入</button>
		<button id="ch" class="layui-btn" lay-submit lay-filter="test">撤回</button>
	</div>

	<!-- 实现select框  上下键和回车键，必须使用layui.all.js，并且它必须在layui.js之后使用 -->
	<div class="layui-container">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">选择框</label>
				<div class="layui-input-block">
					<select name="city" lay-verify="required">
						<option value=""></option>
						<option value="0" selected="">北京</option>
						<option value="1">上海</option>
						<option value="2">广州</option>
						<option value="3">深圳</option>
						<option value="4">杭州</option>
					</select>
				</div>
			</div>
		</form>
	</div>

	<!-- 在 layui 2.3.0 之前的版本，只能设置 unicode 来定义图标 -->
	<i class="layui-icon">&#xe60c;</i>
	<!-- 从 layui 2.3.0 开始，支持 font-class 的形式定义图标 -->
	<i class="layui-icon layui-icon-loading"></i>
	<!-- layui 的所有图标全部采用字体形式，取材于阿里巴巴矢量图标库（iconfont）。
    因此你可以把一个 icon 看作是一个普通的文字，这意味着你直接用 css 控制文字属性，如 color、font-size，
    就可以改变图标的颜色和大小。你可以通过 font-class 或 unicode 来定义不同的图标。 -->
	<i class="layui-icon layui-icon-loading"
		style="font-size: 30px; color: red;"></i>

	<div class="layui-container">
		<!-- 其中 layui-anim是必须的，后面跟着的即是不同的动画类 -->
		<div class="layui-anim layui-anim-up">daf</div>

		<!-- 循环动画，追加：layui-anim-loop   class="layui-anim layui-anim-rotate layui-anim-loop"-->
		<div class="layui-anim layui-anim-rotate" style="background: blue">fdsaf</div>
	</div>

	<!-- 按钮功能   class里面顺序没有影响-->
	<button class="layui-btn"><td>${UserSession.password }</td></button>
	<a href="http://www.layui.com" class="layui-btn">一个可跳转的按钮</a>
	<button class="layui-btn layui-btn-primary">原始</button>
	<button class="layui-btn">默认</button>
	<button class="layui-btn layui-btn-normal"><td>${UserSession.accountNo }</td></button>
	<button class="layui-btn layui-btn-warm">暖色</button>
	<button class="layui-btn layui-btn-danger">警告</button>
	<button calss="layui-btn layui-btn-disabled">禁用</button>
	<br />
	<!-- 按钮尺寸 -->
	<button class="layui-btn layui-btn-lg layui-btn-normal">大型百搭</button>
	<button class="layui-btn layui-btn-sm layui-btn-warm">小型暖色</button>
	<button class="layui-btn layui-btn-danger layui-btn-xs">迷你警告</button>
	<br />
	<!-- 圆角  layui-btn-radius -->
	<button class="layui-btn-radius layui-btn layui-btn-normal">圆角百搭</button>
	<br />
	<!-- 图标 -->
	<button class="layui-btn layui-btn-warm">
		<i class="layui-icon layui-icon-face-smile">笑脸按钮</i>
	</button>
	<button class="layui-btn layui-btn-warm">
		<i class="layui-icon">&#xe608;</i> 添加
	</button>
	<br/>
	<!-- 按钮容器 -->
	<div class="layui-btn-container">
	    <button class="layui-btn">正常按钮</button>
	    <button class="layui-btn layui-btn-radius">圆角按钮</button>
	    <button class="layui-btn layui-btn-xs">迷你按钮</button>
	    <button class="layui-btn">正常按钮</button>
	    <button class="layui-btn layui-btn-radius">圆角按钮</button>
	    <button class="layui-btn layui-btn-xs">迷你按钮</button>
	    <button class="layui-btn">正常按钮</button>
	    <button class="layui-btn layui-btn-radius">圆角按钮</button>
	    <button class="layui-btn layui-btn-xs">迷你按钮</button>
	    <button class="layui-btn">正常按钮</button>
	    <button class="layui-btn layui-btn-radius">圆角按钮</button>
	    <button class="layui-btn layui-btn-xs">迷你按钮</button>
	    <button class="layui-btn">正常按钮</button>
	    <button class="layui-btn layui-btn-radius">圆角按钮</button>
	    <button class="layui-btn layui-btn-xs">迷你按钮</button>
	</div>
	<script>
		/*
		layui已将将 layui.js 及所有模块单独打包合并成了一个完整的js(layui.all.js)文件，用的时候直接引入这一个文件即可。当你采用这样的方式时，
		你无需再通过 layui.use() 方法加载模块，直接使用即可，
		 */
		layui.use([ 'form' ], function() {
			var form = layui.form //获取form模块
			form.render();
			var upload = layui.upload; //获取upload模块

			//监听提交按钮
			form.on('submit(test)', function(data) {
				console.log("监听提交按钮");
			});
		})

		/*
		由于Layui部分内置模块依赖jQuery，所以我们将jQuery1.11最稳定的一个版本作为一个内置的DOM模块（唯一的一个第三方模块）。
		只有你所使用的模块有依赖到它，它才会加载，并且如果你的页面已经script引入了jquery，它并不会重复加载。
		内置的jquery模块去除了全局的$和jQuery，是一个符合layui规范的标准模块
		 */
		layui.use([ 'jquery' ], function() {
			var $ = layui.$;
			$("#ch").click(function() {
				alert("佛挡杀佛的")
			});
		})
	</script>
</body>
</html>