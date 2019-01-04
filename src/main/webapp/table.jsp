<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>表格</title>
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
	<!-- lay-even:开启隔行背景        lay-skin="属性值" line （行边框风格）  row （列边框风格）  nob （无边框风格） -->
	<table class="layui-table" lay-even lay-skin="line">
		<colgroup>
			<col width="150">
			<col width="200">
		</colgroup>
		<thead>
			<tr>
				<th>昵称</th>
				<th>加入时间</th>
				<th>签名</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>贤心</td>
				<td>2016-11-29</td>
				<td>人生就像是一场修行</td>
			</tr>
			<tr>
				<td>许闲心</td>
				<td>2016-11-28</td>
				<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
			</tr>
		</tbody>
	</table>

	<button id="an" class="layui-btn">按钮</button>
	<span id="a" class="layui-badge">6</span>

	<fieldset class="layui-elem-field">
		<legend>字段集区块 - 默认风格</legend>
		<div class="layui-field-box">内容区域</div>
	</fieldset>

	<fieldset class="layui-elem-field layui-field-title">
		<legend>字段集区块 - 横线风格</legend>
		<div class="layui-field-box">内容区域</div>
	</fieldset>
	<script>
		$("#an").click(function() {
			$("#a").html("2");
		})
	</script>
</body>
</html>