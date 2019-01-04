<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2018/12/25
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()
        +"://"+request.getServerName()+":"
        +request.getServerPort()+"/"+path;
%>
<html>
<head>
    <title>学生管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <div style="padding:5px 0;">
        <a href="../student/addStudent" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:10%">Add</a>
    </div>
    <table id="dg" class="easyui-datagrid" title="成员表单" style="width: 500px;height: 200px"
        data-options="singleSelect:true,collapsible:true">
        <thead>
        <tr>
            <th data-options="field:'id',width:80">学号</th>
            <th data-options="field:'name',width:80">姓名</th>
            <th data-options="field:'age',width:80">年龄</th>
            <th data-options="field:'gender',width:80">性别</th>
            <th data-options="field:'address',width:80">地址</th>
        </tr>
        </thead>
    </table>

    <script>
        $(function () {
            $("#dg").datagrid({
                url:'find',
                type:'json',
                success:function (data) {
                    $("#dg").datagrid('reload');
                }
            })
            $("#add").click(function () {
                $.ajax({
                    url:'addStudent',
                    dataType:'json',
                    data:JSON.stringify(obj),
                    success:function (data) {
                    },
                    error:function (data) {
                        alert("error");
                    }
                })
            })
        })
    </script>

</body>
</html>
