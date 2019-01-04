<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>定义选项卡</title>
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



	<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="11">网站设置</li>
			<li lay-id="22">用户管理</li>
			<li lay-id="33">权限分配</li>
			<li lay-id="44">商品管理</li>
			<li lay-id="55">订单管理</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">内容1</div>
			<div class="layui-tab-item">内容2</div>
			<div class="layui-tab-item">内容3</div>
			<div class="layui-tab-item">内容4</div>
			<div class="layui-tab-item">内容5</div>
		</div>
	</div>
	<div class="site-demo-button" style="margin-bottom: 0;">
		<button class="layui-btn site-demo-active" data-type="tabAdd">新增Tab项</button>
		<button class="layui-btn site-demo-active" data-type="tabDelete">删除：商品管理</button>
		<button class="layui-btn site-demo-active" data-type="tabChange">切换到：用户管理</button>
	</div>

	<!-- id焦点定位 -->
	<div class="layui-tab" lay-filter="test1">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="111">文章列表</li>
			<li lay-id="222">发送信息</li>
			<li lay-id="333">权限分配</li>
			<li lay-id="444">审核</li>
			<li lay-id="555">订单管理</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">1</div>
			<div class="layui-tab-item">2</div>
			<div class="layui-tab-item">3</div>
			<div class="layui-tab-item">4</div>
			<div class="layui-tab-item">5</div>
		</div>
	</div>


	<script>
		layui.use('element', function() {
			var element = layui.element;

			//触发事件
			var active = {
				tabAdd : function() {
					//新增一个Tab项
					element.tabAdd('demo', {
						title : '新选项' + (Math.random() * 1000 | 0) //用于演示
						,
						content : '内容' + (Math.random() * 1000 | 0),
						id : new Date().getTime()
					//实际使用一般是规定好的id，这里以时间戳模拟下
					})
				},
				tabDelete : function(othis) {
					//删除指定Tab项
					element.tabDelete('demo', '44'); //删除：“商品管理”

					othis.addClass('layui-btn-disabled');
				},
				tabChange : function() {
					//切换到指定Tab项
					element.tabChange('demo', '22'); //切换到：用户管理
				}
			};

			$('.site-demo-active').on('click', function() {
				var othis = $(this), type = othis.data('type');
				active[type] ? active[type].call(this, othis) : '';
			});

			//获取hash来切换选项卡，假设当前地址的hash为lay-id对应的值
			var layid = location.hash.replace(/^#test1=/, '');
			element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项

			//监听Tab切换，以改变地址hash值
			element.on('tab(test1)', function() {
				location.hash = 'test1=' + this.getAttribute('lay-id');
			});
		});
	</script>
</body>
</html>