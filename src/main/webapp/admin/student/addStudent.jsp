<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2018/12/21
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()
            +"://"+request.getServerName()
            +":"+request.getServerPort()+"/"+path;
%>
<html>
<head>
    <title>学生添加</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <form style="font-size: 30px">
        学号：<input type="text" name="id" id="s_id"><br>
        姓名：<input type="text" name="name" id="s_name"><br>
        年龄：<input type="text" name="age" id="s_age"><br>
        性别：<input type="text" name="gender" id="s_gender"><br>
        地址：<input type="text" name="address" id="s_address"><br>
        <input type="button" value="提交" id="sub">
        <input type="reset" value="重置">
    </form>
    <script>
        $(function () {
            //点击事件捕获
            $("#sub").click(function () {
                //js数据
                var obj = new Object();
                obj.id=$("#s_id").val();
                obj.name=$("#s_name").val();
                obj.age=$("#s_age").val();
                obj.gender=$("#s_gender").val();
                obj.address=$("#s_address").val();
                //数据交互请求
                $.ajax({
                    url:'add',
                    type:'post',
                    dataType:'json',
                    data:JSON.stringify(obj),
                    contentType:'application/json;charset=utf-8',
                    success:function (data) {
                        window.localhost.href="http://localhost:8090//web/student/open";
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
