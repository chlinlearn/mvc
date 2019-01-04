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
    <title>员工信息管理页面</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/easyui/demo.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/plugins/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <form>
        <input type="text" name="name" id="nameId" placeholder="请输入名字"/>
        <input type="button" value="查询" id="sub"/>
    </form>
    <div style="padding:5px 0;">
        <a href="#" id="add" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
    </div>
    <table id="dg" class="easyui-datagrid" title="员工信息表单" style="width: 660px;height: 200px"
           data-options="singleSelect:true,collapsible:true">
        <thead>
        <tr>
            <th data-options="field:'id',width:80">编号</th>
            <th data-options="field:'name',width:80,editor:{type:'textbox'}">姓名</th>
            <th data-options="field:'gender',width:80,editor:{type:'textbox'}">性别</th>
            <th data-options="field:'age',width:80,editor:{type:'numberbox'}">年龄</th>
            <th data-options="field:'birthday',width:80,editor:{type:'textbox'}">出生日期</th>
            <th data-options="field:'address',width:80,editor:{type:'textbox'}">地址</th>
            <th data-options="field:'department',width:80,editor:{type:'textbox'}">部门</th>
            <th data-options="field:'ids',formatter:format,width:100">操作</th>
        </tr>
        </thead>
    </table>

    <script>
        format=function(val,row,index) {
            var btn = '<a href="#" id="bj'+index+'" class="easyui-linkbutton easyui-tooltip" title="编辑" data-options="plain:true" onclick="update(\''+index+'\')"><span class="l-btn-text">编辑</span></a> '
                + '<a href="#"  id="bc'+index+'" class="easyui-linkbutton easyui-tooltip" style="display:none" onclick="save(\''+index+'\',\''+row.EMP_ID+'\',\''+row.JOB_NUMBER+'\',\''+row.NAME+'\')">保存</a>'
                + '<a href="#"  id="qx'+index+'" class="easyui-linkbutton easyui-tooltip" style="display:none" onclick="cancel(\''+index+'\')">取消</a>';
            return btn+ '<a href="#" class="easyui-linkbutton easyui-tooltip" title="删除" data-options="plain:true" onclick="del('+index+')"><span class="l-btn-text">删除</span></a>';
        }
        function find(obj){
            $.ajax({
                url:"findByCondition",
                dataType:'json',
                data:JSON.stringify(obj),
                type:'post',
                contentType:'application/json;charset=utf-8',
                success:function (data) {
                    console.debug(data);
                    $("#dg").datagrid("loadData",data);
                }
            })
        }
        function del(index) {
            $("#dg").datagrid('selectRow',index)
            var row = $("#dg").datagrid("getSelected");
            $.ajax({
                url:"delete",
                dataType:'json',
                data:JSON.stringify(row),
                type:'post',
                contentType:'application/json;charset=utf-8',
                success:function (data) {
                    var obj = {name:""};
                    find(obj);
                    alert("delete success")
                }
            })
        }
        function update(index) {
            var row = $("#dg").datagrid("getSelected");//取得选中行数据
            if (row){
                alert('id:'+row.id+',name:'+row.name+',gender:'+row.gender+',age:'
                    +row.age+',birthday:'+row.birthday
                    +',address:'+row.address+',department:'+row.department);
            }
            $('#bj' + index).hide();
            $('#bc' + index).show();
            $('#qx' + index).show();

            $('#dg').datagrid('beginEdit',index);//启动行编辑器


            $.ajax({
                url:"update",
                dataType:'json',
                data:JSON.stringify(row),
                type:'post',
                contentType:'application/json;charset=utf-8',
                success:function (data) {
                    var obj = {name:""};
                    find(obj);
                    alert("update success")
                }
            })
        }
        //取消
        function cancel(index){
            $('#dg').datagrid('cancelEdit',index);
            $('#dg').datagrid('reload');
        }

        $(function () {
            var obj = new Object();
            obj.name=null;
            find(obj);
            $("#add").click(function () {
                window.location.href="<%=basePath%>/employee/addEmployee";
            })
            $("#sub").click(function(){
                var obj = new Object();
                obj.name=$("#nameId").val();
                if(obj.name=='')
                    obj.name=null;
                find(obj);
            })
        })

    </script>
</body>
</html>
