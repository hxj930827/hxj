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
</head>
<body>
	<input type="text" class="layui-input" id="test">

	<script>
		layui.use([ 'laydate' ], function() {
			var laydate = layui.laydate;

			laydate.render({
				elem : "#test",
				/*
				year	年选择器	只提供年列表选择
				month	年月选择器	只提供年、月选择
				date	日期选择器	可选择：年、月、日。type默认值，一般可不填
				time	时间选择器	只提供时、分、秒选择
				datetime	日期时间选择器	可选择：年、月、日、时、分、秒
				 */
				type : "date",
				/*
				如果设置 true，将默认采用 “ - ” 分割。 你也可以直接设置 分割字符  如：range:"-"
				 */
				range:true,
				format : "yyyy-MM-dd",
				// 初始值  也可以写成2018-02-01
				//value : new Date(),
				//max : 7,//7天后
				//min : -7,//7天前
				// trigger 自定义弹出空间的事件 
				//类型：String，默认值：focus，如果绑定的元素非输入框，则默认事件为：click
				trigger:'focus',
				// showBottom 是否显示底部栏  默认是true
				showBottom:true,
				// lang  语言  默认cn       en(国际版，即英文版)
				lang:"cn",
				// theme 主题
				theme:'grid',
				// 是否显示公立节日
				calendar:true
			//7天前
			})
		})
	</script>
</body>
</html>