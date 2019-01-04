<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>定义进度条</title>
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
<br/>
<div class="layui-progress">
  <div class="layui-progress-bar" lay-percent="10%"></div>
</div>

<br/>
<!-- 显示进度条比文本 -->
<div class="layui-progress" lay-showPercent="true">
  <div class="layui-progress-bar" lay-percent="30%"></div>
</div>

<br/>
<!-- 大型进度条 -->
<div class="layui-progress layui-progress-big" lay-filter="demo" lay-showPercent="true">
  <div class="layui-progress-bar" lay-percent="100%"></div>
</div>

<button id="a" class="layui-btn">减小进度条</button>
<script>
  layui.use(['element'],function(){
	  var element=layui.element;
	  element.render();
	  
	  // 修改进度条
	  $("#a").click(function(){
		  element.progress('demo', '50%');
	  });
  });
</script>
</body>
</html>