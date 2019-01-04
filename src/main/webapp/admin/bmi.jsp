<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2018/12/25
  Time: 10:17
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
    <title>BMI计算</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<h2>BMI计算</h2>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="填写表单" style="width:400px">
    <div style="padding:10px 60px 20px 60px">
        <form method="post" action="../bmi/health">
            <table cellpadding="5">
                <tr>
                    <td>我的体重(kg):</td>
                    <td><input class="easyui-textbox" type="text" name="weight" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>我的身高(m):</td>
                    <td><input class="easyui-textbox" type="text" name="height" data-options="required:true"></input></td>
                </tr>
            </table>
            <div align="center">
                <input class="easyui-linkbutton" type="submit" value="提交">
                <input class="easyui-linkbutton" type="reset" value="重置">
            </div>
        </form>
    </div>
</div>
</body>
</html>
