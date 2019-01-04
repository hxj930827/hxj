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
	<script>
/* layer.confirm('is not?', {icon: 3, title:'提示'}, function(index){
	  layer.alert("韩旭杰");
	},function(){
	 layer.alert("庞振兴");
});   */

var index = layer.open({
	  content: 'test',
	  icon:3
	});
</script>
</body>
</html>