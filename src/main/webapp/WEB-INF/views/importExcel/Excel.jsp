<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../plat/common/taglib/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/LayUI/layui.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body">
<button type="button" id="exportExcel" class="layui-btn">下载Excel模版</button>
<form action="exportExcel.htm" method="post" enctype="multipart/form-data">
    <input type="file" name="file" /><br/>
    <input type="submit" value="提交">
</form>
<script>
$("#exportExcel").click(function(){
    window.location.href = "getExcel.htm";
})
</script>
</body>
</html>