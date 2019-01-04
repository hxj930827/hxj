<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>vue.js</title>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/LayUI/layui.all.js"></script>
<link rel="stylesheet"
	href="http://localhost:8080/hxj/assets/LayUI/css/layui.css">
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://localhost:8080/hxj/assets/vue/vue.min.js"></script>
<style type="text/css">
.class1 {
	background: #9fff43;
	color: black
}
</style>
</head>
<body>
	<!-- v-html指令 -->
	<div id="app">
		<div v-html="message"></div>
	</div>
	<!-- v-bind指令  它可以写为     :href="url"-->
	<div id="app1">
		<label for="r1">修改颜色</label><input type="checkbox" v-model="class1"
			id="r1"> <br />
		<div v-bind:class="{'class1':class1}">点击复选框，我改变颜色</div>
	</div>
	<!-- 表达式 -->
	<div id="app2">
		{{5+5}}<br /> {{ok?"正确":"不正确"}}<br>
		<div v-bind:id="'list-'+id">菜鸟教程</div>
	</div>
	<!-- 指令 -->
	<div id="app3">
		<p v-if="see">德玛西亚</p>
	</div>
	<!-- v-on 它可以写成     @click="a" -->
	<div id="app4">
		<a v-bind:href="url">菜鸟教程</a>
		<button class="layui-btn" v-on:click="a">v-on</button>
	</div>
	<!-- v-model 可以用该指令实现双向数据绑定 -->
	<div id="app5">
		<p>{{message}}</p>
		<input v-model="message">
	</div>
	<!-- 过滤器 -->
	<div id="app6">{{message|capitalize}}</div>
	<!-- v-for 指令需要以 site in sites 形式的特殊语法， sites 是源数据数组并且 site 是数组元素迭代的别名。 -->
	<div id="app7">
	  <ol>
	    <li v-for="site in sites">
	      {{site.name}}
	    </li>
	  </ol>
	</div>
	<!-- v-for 迭代对象 -->
	<div id="app8">
	  <ul>
	    <li v-for="(value,key,index) in object">
	      {{index}}:{{key}}:{{value}}
	    </li>
	  </ul>
	</div>
	<script>
		function newFunction() {
			alert("v-on指令");
		}
		// v-html 指令
		new Vue({
			el : "#app",
			data : {
				message : "<h1>菜鸟教程</h1>"
			}
		});
		// v-bind 指令
		new Vue({
			el : "#app1",
			data : {
				class1 : false
			}
		})
		// 表达式
		new Vue({
			el : "#app2",
			data : {
				ok : false,
				id : 1
			}
		});
		// 指令
		new Vue({
			el : "#app3",
			data : {
				see : true
			}
		});
		// v-on监听
		new Vue({
			el : "#app4",
			data : {
				url : "http://www.runoob.com"
			},
			methods : {
				a : function() {
					this.url = "index.jsp";
					alert(this.url);
				}
			}
		});
		// v-model 可以用该指令实现双向数据绑定 
		new Vue({
			el : "#app5",
			data : {
				message : "v-model双向操作"
			}
		});
		// 过滤器  首字母大写
		new Vue({
			el : "#app6",
			data : {
				message : "vuedemo",
                capitalize : "hanxujie"
			},
			filters : {
				capitalize : function(value) {
					if (value == "" || value == null) {
						return value;
					} else {
						value = value.toString();
						return value.charAt(0).toUpperCase() + value.slice(1);
					}
				}
			}
		});
		// v-for 指令
		new Vue({
			el:"#app7",
			data:{
				sites:[
					{name:'韩旭杰'},
					{name:"庞振兴"},
					{name:"乔勇"}
				]
			}
		});
		new Vue({
			el:"#app8",
			data:{
				object:{
					name:'菜鸟教程',
					url:'http://www.runoob.com',
					slogan:'德玛西亚'
				}
			}
		});
	</script>
</body>
</html>