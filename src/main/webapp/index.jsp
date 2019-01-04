<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<script type="text/javascript"
	src="assets/LayUI/layui.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.all.js"></script>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/vue/vue.min.js"></script>
</head>
<body>
	<div class="layui-container">
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">帐号</label>
				<div class="layui-input-block">
					<input type="text" id="accountNo" name="accountNo"
						class="layui-input" placeholder="请输入帐号" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="password" id="password" name="password"
						class="layui-input" placeholder="请输入密码" />
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" type="button" id="submit">提交</button>
					<button class="layui-btn" type="reset">重置</button>
				</div>
			</div>
		</form>
	</div>
	<button class="layui-btn" id="redis">测试redis</button>
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>{{details()}}</h1>
</div>
<script type="text/javascript">
	layui.use([ 'layer' ], function() {
		var layer = layui.layer;
		$("#submit").click(function() {
			// 获取帐号
			var accountNo = $("#accountNo").val();
			// 获取密码
			var password = $("#password").val();
			$.ajax({
				url : 'book/login',
				type : 'post',
				dataType : 'json',
				data : {
					accountNo : accountNo.trim(),
					password : password.trim()
				},
				success : function(r) {
					if (r.flag) {
						layer.alert(r.msg, "", function() {
							window.location.href = "book/test";
						});
					} else {
						layer.alert("信息有误", "", function() {
						});
					}
				},
				error : function() {
					layer.alert("网络错误", "", "", {
						type : 'error'
					});
				}
			});
		});

		$("#redis").click(function() {
			$.ajax({
				url : "book/hasKey",
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.flag) {
						layer.alert(r.msg);
					} else {
						layer.alert("获取redis失败");
					}
				}
			})
		});

		var vm = new Vue({
			el: '#vue_det',
			data: {
				site: "菜鸟教程",
				url: "www.runoob.com",
				alexa: "10000"
			},
			methods: {
				details: function() {
					return  this.site + " - 学的不仅是技术，更是梦想！";
				}
			}
		});
	})
</script>
</body>
</html>
