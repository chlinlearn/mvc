<%--
  Created by IntelliJ IDEA.
  User: xuchunlin
  Date: 2019/1/3
  Time: 15:32
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
    <title>员工信息新增页面</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="" style="width:400px">
        <div style="padding:10px 60px 20px 60px">
            <form id="dg">
                <table cellpadding="5">
                    <tr>
                        <td>编号:</td>
                        <td><input class="easyui-textbox" type="text" name="id" id="e_id" ></input></td>
                    </tr>
                    <tr>
                        <td>姓名:</td>
                        <td><input class="easyui-textbox" type="text" name="name" id="e_name" ></input></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select class="easyui-combobox" name="gender" id="e_gender" type="text" style="width: 60px"><option value="0">男</option><option value="1">女</option></select>
                        </td>
                    </tr>
                    <tr>
                        <td>年龄:</td>
                        <td><input class="easyui-textbox" name="age" id="e_age" ></input></td>
                    </tr>
                    <tr>
                        <td>出生日期:</td>
                        <td>
                            <input class="easyui-datebox" type="text" name="birthday" id="e_birthday" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td>
                            <input class="easyui-textbox" name="address" id="e_address"></input>
                        </td>
                    </tr>
                    <tr>
                        <td>部门:</td>
                        <td>
                            <select class="easyui-combobox" name="department" id="e_department" type="text"style="width: 80px"><option value="人事部">人事部</option><option value="开发部">开发部</option><option value="业务部">业务部</option></select>
                        </td>
                    </tr>
                </table>
                <input type="button" value="提交" id="sub">
                <input type="reset" value="重置">
            </form>
        </div>
    </div>
    <script>
        $(function () {
            //点击事件捕获
            $("#sub").click(function () {
                //js数据
                var obj = new Object();
                obj.id=$("#e_id").val();
                obj.name=$("#e_name").val();
                obj.gender=$("#e_gender").val();
                obj.age=$("#e_age").val();
                obj.birthday=$("#e_birthday").val();
                obj.address=$("#e_address").val();
                obj.department=$("#e_department").val();
                //数据交互请求
                $.ajax({
                    url:'add',
                    type:'post',
                    dataType:'json',
                    data:JSON.stringify(obj),
                    contentType:'application/json;charset=utf-8',
                    success:function (data) {
                        alert("add success");
                        window.location.href="<%=basePath%>/employee/manage";
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
