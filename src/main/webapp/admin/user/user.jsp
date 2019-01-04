<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2018/12/25
  Time: 14:37
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
    <title>用户新增</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <form style="font-size: 30px" >
        学号：<input type="text" name="id" id="u_id"><br>
        姓名：<input type="text" name="name" id="u_name"><br>
        年龄：<input type="text" name="age" id="u_age"><br>
        <input type="button" value="提交" id="submit"><br>
        <input type="reset" value="重置">
    </form>
    <script>
        $(function () {
            //点击事件捕获
            $("#submit").click(function () {
                //js数据
                var obj = new Object();
                obj.id=$("#u_id").val();
                obj.name=$("#u_name").val();
                obj.age=$("#u_age").val();
                //数据交互请求
                $.ajax({
                    url:'add',
                    dataType:'json',
                    data:JSON.stringify(obj),
                    success:function (data) {
                        window.localhost.href="http://localhost:8090//web/uesr/find";
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
