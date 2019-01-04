<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>form表单练习</title>
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
		<!-- 可以通过layui-form-pane调整form样式  layui的Fly社区用的就是这个风格 -->
		${version}
		<form class="layui-form layui-form-pane" action="" >
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="required"
						placeholder="请输入标题" class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" title="男" selected> <input
						type="radio" name="sex" title="女">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">爱好</label>
				<div class="layui-input-block">
					<input type="checkbox" name="love" title="写作" /> <input
						type="checkbox" name="love1" title="篮球" /> <input type="checkbox"
						name="love2" title="足球" />
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">城市</label>
				<div class="layui-input-block">
					<select name="city" lay-verify="required" lay-search>
						<option value=""></option>
						<option value="0">北京</option>
						<option value="1">上海</option>
						<option value="2">广州</option>
						<option value="3">深圳</option>
						<option value="4">杭州</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input class="layui-input" type="password" lay-verify="required"
						placeholder="请输入密码">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
					<button type="reset" value="重置" class="layui-btn">重置</button>
				</div>
			</div>
		</form>
	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;
			form.render();
			//监听提交
			form.on('submit(formDemo)', function(data) {
				console.log(data);
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});

	</script>
</body>
</html>