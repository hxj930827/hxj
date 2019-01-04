<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="plat/common/taglib/taglib.jsp" %>
<%@ include file="plat/common/scripts/scripts.jsp" %>
<html>
<head>
    <title>layui</title>
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/jqGrid/css/ui.jqgrid.css">
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/jqGrid/css/ui.jqgrid-bootstrap.css">
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="http://localhost:8080/hxj/assets/jquery-ui/pageStyle/css/zxf_page.css">
    <%--jquery文件必须放在jqgrid前面--%>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jqGrid/js/jquery.jqGrid.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jquery-ui/pageStyle/js/zxf_page.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/bootstrap/dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="http://localhost:8080/hxj/assets/jqGrid/js/i18n/grid.locale-cn.js"></script>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-size: 75%;
        }
        .ui-jqgrid .ui-jqgrid-btable tbody tr.jqgrow td {
            height: 50px;
        }

        .ui-jqgrid .ui-jqgrid-htable th {
            height: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <table id="showGrid"></table>
    <div id="Pager"></div>
</div>
</body>
<script>
    $(document).ready(function () {
        $("#showGrid").jqGrid({
            //数据来源，本地数据
            url: "BzflJq",
            datatype: "json",
            loadui: "block",
            //高度，表格高度。可为数值、百分比或'auto'
            height: 500,
            //自动宽
            autowidth: true,
            colNames: [
                '科目',
                '存期',
                '生效日期',
                '失效日期',
                '年费率'
            ],
            colModel: [
                {name: 'courseId', index: 'courseId', width: '50', align: 'center'},
                {name: 'fixPeriod', index: 'fixPeriod', width: '50', align: "center"},
                {name: 'effectiveDate', index: 'effectiveDate', width: '50', align: "center"},
                {name: 'invalidDate', index: 'invalidDate', width: '50', align: "center"},
                {name: 'yearRate', index: 'yearRate', width: '50', align: "center"}
            ],
            //是否可以选择
            multiselect: true,
            pager: '#Pager',
            //添加左侧行号
            rownumbers: true,
            sortorder: 'sortType',
            //是否在浏览导航栏显示记录总数
            viewrecords: true,
            //每页显示记录数
            rowNum: 20,
            //用于改变显示行数的下拉列表框的元素数组
            rowList: [10, 20, 25],
            multiboxonly: true,
            loadonce: true,
            loadComplete: function () {
                var table = this;
                setTimeout(function () {
                    a();
                }, 0);
            }
        });
    });

    function a(){
        $(".zxf_pagediv").createPage({
            pageNum: 20,
            current: 6,
            backfun: function(e) {

                //console.log(e);//回调

            }

        });
    }
</script>
</html>