<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<table class="layui-hide" id="test" lay-filter="test1"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    //对Date的扩展，将 Date 转化为指定格式的String
    //月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    //年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    //例子：
    //(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    //(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function (fmt) { //author: duzhao
        var o = {
            //月份
            "M+": this.getMonth() + 1,
            //日
            "d+": this.getDate(),
            //小时
            "h+": this.getHours(),
            //分
            "m+": this.getMinutes(),
            //秒
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            //毫秒
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1,
                    (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
                        .substr(("" + o[k]).length)));
        return fmt;
    }

    layui.use('table', function () {
        var table = layui.table;
        // 页面初始数据的加载
        // var tableIns = table.render({
        //     elem: "#test",
        //     //url: "book/getBzfl",
        //     height: '690',
        //     // layui 现在列宽自动分配，也可以为指定的列固定宽度
        //     cellMinWidth: 80,//全局定义常规单元格的最小宽度，layui 2.2.1 新增
        //     // 开启分页
        //     page: true,
        //     limits: [5, 20, 30],
        //     limit: 5,
        //     //开启合计行
        //     //totalRow: true,
        //     // 开启工具行
        //    // toolbar: '#toolbarDemo',
        //     // 排序
        //     initSort: {
        //         field: 'yearRate' //排序字段，对应 cols 设定的各字段名
        //         , type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
        //     },
        //     cols: [[
        //         // {
        //         //     // 开启复选框
        //         //     type: 'checkbox',
        //         //     rowspan:'2'
        //         // },
        //         // {
        //         //     type: 'numbers',
        //         //     totalRowText: '合计'
        //         // },
        //         {
        //             field: 'courseId',
        //             title: '科目id',
        //             width: 500,
        //             //edit: "text",
        //             sort: true,
        //             rowspan:'2',
        //             colspan: '1'
        //         },
        //         {
        //             fixed:'hxj',
        //             title:'1',
        //             colspan: '1'
        //         },
        //         {
        //             fixed:'hxj1',
        //             title:'1',
        //             colspan: '1'
        //         },
        //         {
        //             fixed:'hxj2',
        //             title:'1',
        //             colspan: '1'
        //         },
        //         {
        //             fixed:'hxj3',
        //             title:'1',
        //             colspan: '1'
        //         },
        //         {
        //             fixed:'hxj4',
        //             title:'1',
        //             colspan: '1'
        //         }
        //         // 对数据的操作
        //         // ,{
        //         //     fixed: 'right',
        //         //     width: 178,
        //         //     align: 'center',
        //         //     toolbar: '#barDemo'
        //         // }
        //
        //     ],[
        //         {
        //             field: 'fixPeriod',
        //             title: '存期',
        //             sort: true,
        //             //totalRow: true,//是否开启合计行区域。layui 2.4.0 新增
        //             colspan: '1'
        //         },
        //         // templet 开始支持函数形式，函数返回一个参数 d，包含接口返回的所有字段和数据
        //         {
        //             field: 'effectiveDate',
        //             title: '生效日期',
        //             sort: true,
        //             templet: function (value) {
        //                 if (value.effectiveDate != null) {
        //                     return new Date(value.effectiveDate)
        //                         .Format("yyyy-MM-dd");
        //                 }
        //                 return "";
        //             },
        //             colspan: '1'
        //         },
        //         {
        //             field: 'invalidDate',
        //             title: '失效日期',
        //             sort: true,
        //             templet: function (value) {
        //                 if (value.invalidDate != null) {
        //                     return new Date(value.invalidDate)
        //                         .Format("yyyy-MM-dd");
        //                 }
        //                 return "";
        //             },
        //             colspan: '1'
        //         },
        //         {
        //             field: 'yearRate',
        //             title: '年费率',
        //             sort: true,
        //             templet: function (value) {
        //                 if (value.yearRate != null) {
        //                     return parseFloat(
        //                         value.yearRate * 10000 / 100)
        //                         .toFixed(3);
        //                 }
        //                 return "";
        //             },
        //             //totalRow: true,
        //             colspan: '1'
        //         }, {
        //             field: 'remark',
        //             // 固定列
        //             fixed: 'right',
        //             title: '备注',
        //             colspan: '1'
        //         }
        //     ]],
        //     done: function (res, curr, count) {
        //         //如果是异步请求数据方式，res即为你接口返回的信息。
        //         //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
        //         //console.log(res.data[5]);
        //         //得到当前页码
        //         //console.log(curr);
        //         //得到数据总量
        //         //console.log(count);
        //
        //         var table = layui.table;
        //
        //         var a = table.cache.test
        //         console.log(table);
        //         console.log(a);
        //
        //     }
        // });
 var tabtou=[[
     {
         // 开启复选框
         type: 'checkbox',
         rowspan:'2'
     },
     {
         field:'id',
         type: 'numbers',
         totalRowText: '合计',
         rowspan:'2'
     },
     {
         field:'courseId',title:'科目id',width:500,rowspan:2
     },
     {
         field:'hxj1',title:'韩旭杰1',colspan:5,align:'center'
     },
     // 对数据的操作
     {
         fixed: 'right',
         width: 178,
         align: 'center',
         toolbar: '#barDemo',
         rowspan:2
      }
 ],[
     {
         field: 'fixPeriod',
         title: '存期',
         sort: true,
         totalRow: true,//是否开启合计行区域。layui 2.4.0 新增
         colspan: '1'
     },
     // templet 开始支持函数形式，函数返回一个参数 d，包含接口返回的所有字段和数据
     {
         field: 'effectiveDate',
         title: '生效日期',
         sort: true,
         templet: function (value) {
             if (value.effectiveDate != null) {
                 return new Date(value.effectiveDate)
                     .Format("yyyy-MM-dd");
             }
             return "";
         },
         colspan: '1'
     },
     {
         field: 'invalidDate',
         title: '失效日期',
         sort: true,
         templet: function (value) {
             if (value.invalidDate != null) {
                 return new Date(value.invalidDate)
                     .Format("yyyy-MM-dd");
             }
             return "";
         },
         colspan: '1'
     },
     {
         field: 'yearRate',
         title: '年费率',
         sort: true,
         templet: function (value) {
             if (value.yearRate != null) {
                 return parseFloat(
                     value.yearRate * 10000 / 100)
                     .toFixed(3);
             }
             return "";
         },
         //totalRow: true,
         colspan: '1'
     }, {
         field: 'remark',
         // 固定列
         fixed: 'right',
         title: '备注',
         colspan: '1'
     }
 ]];
        var tableIns = table.render({
            elem: "#test",
            url: "book/getBzfl",
            height: '690',
            // layui 现在列宽自动分配，也可以为指定的列固定宽度
            cellMinWidth: 80,//全局定义常规单元格的最小宽度，layui 2.2.1 新增
            // 开启分页
            page: true,
            limits: [5, 20, 30],
            limit: 5,
            initSort: {
                field: 'yearRate' //排序字段，对应 cols 设定的各字段名
                , type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
            },
            //开启合计行
            totalRow: true,
            // 开启工具行
            toolbar: '#toolbarDemo',
            cols: tabtou,
            done: function (res, curr, count) {
               $(".layui-table-body").find("td").each(function (index,element) {
                   if($(this).attr("data-field")>0){
                       $(this).css("display","none");
                   }
               })

            }
        });
        //监听单元格编辑
        table.on('edit(test1)',
            function (obj) {
                var value = obj.value //得到修改后的值
                    , data = obj.data //得到所在行所有键值
                    , field = obj.field; //得到字段
                console.log(obj);
                layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：'
                    + value);
            });
        //监听工具条
        table.on('tool(test1)', function (obj) {
            var data = obj.data;
            console.log(obj);
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    // 刷新表格
                    reloadTable();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.alert('编辑行：<br>' + JSON.stringify(data))
            }
        });
        //监听行单击事件（单击事件为：rowDouble）
        /* 			table.on('row(test1)', function(obj) {
                        var data = obj.data;

                        layer.alert(JSON.stringify(data), {
                            title : '当前行数据：'
                        });

                        //标注选中样式
                        obj.tr.addClass('layui-table-click').siblings().removeClass(
                                'layui-table-click');
                    }); */
    })

    // 新增的时候重新刷新表格
    function reloadTable() {
        layui.use('table', function () {
            var table = layui.table;
            table.reload('test');
        })
    }
</script>
</body>
</html>