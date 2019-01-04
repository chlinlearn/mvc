<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2018/12/24
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()
            +"://"+request.getServerName()+":"
            +request.getServerPort()+"/"+path;
%>
<html>
<head>
    <title>easyui</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <table id="dg" class="easyui-datagrid" title="成员表单" style="width: 500px;height: 200px" data-options="singleSelect:true,collapsible:true">
        <thead>
            <tr>
                <th data-options="field:'id',width:80">编号</th>
                <th data-options="field:'name',width:80">姓名</th>
                <th data-options="field:'age',width:80">年龄</th>
            </tr>
        </thead>
    </table>

    <script>
        <!--把json对象转换json数据-->
        function dataConveter(data){
            var data = new Object();
            data.id = '001';
            data.name = '李四';
            data.age = 22 ;
            //data转换json数据
            //JSON.stringify(data);
            $.ajax({
                url:'find',//与当前页面的相对路径
                dataType:'json',//后天传回前天的数据格式
                data:JSON.stringify(data),//从前台传到后天的数据
                contentType:'application/json',
                success:function (data) {
                    
                }
            })
        }
        <!--文档加载-->
        $(function(){
            $("#dg").datagrid(
                {
                    url:'find',
                    type:'post',
                    success:function (data) {
                        $("#dg").datagrid("reload")
                    }
                }
            )
            /*$.ajax(
                {
                    url:'find',
                    type:'post',
                    success:function (data) {
                        alert("data:"+JSON.stringify(data));
                    },
                    error:function (data) {

                    }
                }
            )
        })*/
    </script>
</body>
</html>
