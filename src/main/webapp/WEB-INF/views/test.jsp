<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="plat/common/taglib/taglib.jsp"%>
<%@ include file="plat/common/scripts/scripts.jsp"%>
<html>
<head>
<title>layui</title>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-tab">
		<ul class="layui-tab-title">
			<li>标题一</li>
			<li class="layui-this">标题二</li>
			<li>标题三</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">内容1</div>
			<div class="layui-tab-item">内容2</div>
			<div class="layui-tab-item">内容3</div>
		</div>
		<button class="layui-btn" lay-submit lay-filter="login">登入</button>
		<button id="ch" class="layui-btn" lay-submit lay-filter="test">撤回</button>
	</div>
	<script>
		/*
		你之所以想使用上面的错误方式，是想其它地方使用不在执行一次 layui.use？但这种理解本身是存在问题的。
		因为如果一旦你的业务代码是在模块加载完毕之前执行，你的全局对象将获取不到模块接口，因此这样用不仅不符合规范，
		还存在报错风险。建议在你的 js 文件中，在最外层写一个 layui.use 来加载所依赖的模块，并将业务代码写在回调中，见：预先加载。
		 */
		layui.use([ 'form', 'upload' ], function() { //如果只加载一个模块，可以不填数组。如：layui.use('form')
			var form = layui.form //获取form模块
			var upload = layui.upload; //获取upload模块

			$("#ch").click(function() {
				alert("德玛西亚")
			});
			//监听提交按钮
			form.on('submit(test)', function(data) {
				console.log("监听提交按钮");
			});
		});
	</script>
</body>
</html>