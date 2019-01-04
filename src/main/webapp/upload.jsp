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
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>常规使用：普通图片上传</legend>
	</fieldset>

    <div class="layui-upload">
      <button type="button" class="layui-btn" id="test1">上传图片</button>
      <div class="layui-upload-list">
        <img class="layui-upload-img" id="demo1" style="width:100px;height:100px">
        <p id="demoText"></p>
      </div>
    </div>

    <div class="layui-upload">
        <button type="button" class="layui-btn" id="test2">多图片上传</button>
        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
            预览图：
            <div class="layui-upload-list" id="demo2"></div>
        </blockquote>
    </div>
    <button class="layui-btn" type="button" id="testListAction">开始上传</button>
<script>
    layui.use([ 'upload','layer' ], function() {
        var upload = layui.upload;
        var layer = layui.layer;
          //普通图片上传
          var uploadInst = upload.render({
            elem: '#test1'
            ,url: 'book/upload'
            //,auto: false //选择文件后不自动上传
            //,bindAction: '#testListAction' //指向一个按钮触发上传
            ,before: function(obj){
              //预读本地文件示例，不支持ie8
              obj.preview(function(index, file, result){
                $('#demo1').attr('src', result); //图片链接（base64）
              });
            }
            ,done: function(res){
              //如果上传失败
              if(!res.flag){
                return layer.msg('上传失败');
              }
              return layer.msg('上传成功,新文件名称为：'+res.msg);
            }
            ,error: function(){
              //演示失败状态，并实现重传
              var demoText = $('#demoText');
              demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
              demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
              });
            }
          });

          //多图片上传
          upload.render({
            elem: '#test2'
            ,url: 'book/upload'
            ,accept: 'file'
            ,auto: false //选择文件后不自动上传
            ,bindAction: '#testListAction' //指向一个按钮触发上传
            ,multiple: true
            ,number : 3
            ,choose: function(obj){
              //将每次选择的文件追加到文件队列
              var files = this.files = obj.pushFile();
              //预读本地文件示例，不支持ie8
              obj.preview(function(index, file, result){
                $('#demo2').append('<img name="file" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:200px;height:200px">')
              });
            }
          ,done: function(res){
              //如果上传失败
              if(!res.flag){
                return layer.msg('上传失败');
              }
              return layer.msg('上传成功,新文件名称为：'+res.msg);
            }
            ,error: function(){
              //演示失败状态，并实现重传
              var demoText = $('#demoText');
              demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
              demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
              });
            }
          });
    });


</script>
</body>
</html>