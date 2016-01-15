<%--
  Created by IntelliJ IDEA.
  User: xiaohei
  Date: 2015/8/22
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>
<base href="<%=basePath%>">
<html>
<head>
  <title></title>

  <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/plugins/easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/plugins/easyui/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/plugins/easyui/themes/color.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/u8server.css">

  <script type="text/javascript" src="<%=basePath%>/js/plugins/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>/js/plugins/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>/js/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
<div id="users">

</div>

<div id="easyui_toolbar" region="north" border="false"
     style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
  <div style="float: left;">
    <a class="easyui-linkbutton" plain="true" icon="icon-add" onclick="javascript:showAddDialog();">新增</a>
  </div>

  <div class="datagrid-btn-separator"></div>

  <div style="float: left;">
    <a class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="javascript:showEditDialog();">编辑</a>
  </div>

  <div class="datagrid-btn-separator"></div>

  <div style="float: left;">
    <a class="easyui-linkbutton" plain="true"
       icon="icon-remove" onclick="javascript:deleteUser();">删除</a>
  </div>

  <div id="tb" style="float: right;">
    <input id="search_box" class="easyui-searchbox" style="width: 250px"  data-options="searcher:doSearch,prompt:'请输入查询词',menu:'#search_menu'" />
    <div id="search_menu" style="width:120px">
      <div data-options="name:'user_name'">用户名</div>
      <div data-options="name:'user_key'">Key</div>
    </div>
  </div>

</div>

<div id="dialog_add" class="easyui-dialog u8_form"
     closed="true" buttons="#dlg-buttons" style="height: 300px;width:500px;">
  <div class="ftitle">用户信息</div>
  <form id="fm" method="post" novalidate>
    <input type="hidden" name="id" />
    <div class="u8_form_row">
      <label >用户名称：</label>
      <input type="text" class="easyui-textbox" name="name" maxlength="255" required="true" />
    </div>

    <div class="u8_form_row">
      <label >更新Key：</label>
      <input id="updateKey" type="text" class="easyui-textbox" readonly="readonly" name="updateKey" maxlength="1024" required="true" />
      <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="generateKey()" style="width:70px">生成</a>
    </div>

    <div class="u8_form_row">
      <label >更新开关：</label>
      <input type="text" class="easyui-textbox" name="updateValid" maxlength="255" required="true" />
    </div>

    <div class="u8_form_row">
      <label >Key有效天数：</label>
      <input type="text" class="easyui-textbox" name="keyValidDay" maxlength="1024" novalidate />
    </div>

    <div class="u8_form_row">
      <label>备注：</label>
      <input type="text" class="easyui-textbox" name="updateDesc" maxlength="1024" novalidate />
    </div>

  </form>
</div>
<div id="dlg-buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保 存</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dialog_add').dialog('close')" style="width:90px">取 消</a>
</div>

<script type="text/javascript">

  var url;
  function showAddDialog(){
    $("#dialog_add").window({
      top:($(window).height() - 300) * 0.5,
      left:($(window).width() - 500) * 0.5
    });

    $("#dialog_add").dialog('open').dialog('setTitle', '添加用户');

    $('#fm').form('clear');

    url = '<%=basePath%>/admin/users/saveUser';

  }

  function showEditDialog(){

    $("#dialog_add").window({
      top:($(window).height() - 300) * 0.5,
      left:($(window).width() - 500) * 0.5
    });


    var row = $('#users').datagrid('getSelected');
    if(row){

      $("#dialog_add").dialog('open').dialog('setTitle', '编辑用户');
      $('#fm').form('load', row);
      url = '<%=basePath%>/admin/users/saveUser';

    }else{
      $.messager.show({
        title:'操作提示',
        msg:'请选择一条记录'
      })
    }
  }

  function saveUser(){

    $('#fm').form('submit', {
      url:url,
      onSubmit:function(){
        return $(this).form('validate');
      },
      success:function(result){
        var result = eval('('+result+')');
        if (result.state == 1) {
          $('#dialog_add').dialog('close');
          $("#users").datagrid('reload');
        }

        $.messager.show({
          title:'操作提示',
          msg:result.msg
        })
      }
    })

  }

  function deleteUser(){
    var row = $('#users').datagrid('getSelected');
    if(row){
      $.messager.confirm(
              '操作确认',
              '确定要删除该用户吗？(操作不可恢复)',
              function(r){
                if(r){
                  $.post('<%=basePath%>/admin/users/removeUser', {currUserID:row.id}, function(result){
                    if (result.state == 1) {
                      $("#users").datagrid('reload');
                    }

                    $.messager.show({
                      title:'操作提示',
                      msg:result.msg
                    })

                  }, 'json');
                }
              }
      );
    }else{
      $.messager.show({
        title:'操作提示',
        msg:'请选择一条记录'
      })
    }
  }



  function doSearch(value, name){
    alert("value:"+value+";name:"+name);
  }

  function generateKey(){
    $.post('<%=basePath%>/admin/users/generateKey', {}, function(result){
      if (result.state == 1) {
        $("#updateKey").textbox('setValue', result.data);
      }else{
        alert(result.msg);
      }
    });
  }

  $("#users").datagrid({
    height:430,
    url:'<%=basePath%>/admin/users/getAllUsers',
    method:'POST',
    idField:'id',
    striped:true,
    fitColumns:true,
    singleSelect:true,
    rownumbers:true,
    pagination:true,
    nowrap:true,
    loadMsg:'数据加载中...',
    pageSize:10,
    pageList:[10,20,50,100],
    showFooter:true,
    columns:[[
      {field:'id', title:'ID', width:10, sortable:true},
      {field:'name', title:'名称', width:80, sortable:true},
      {field:'updateKey', title:'更新Key', width:100, sortable:true},
      {field:'updateValid', title:'开关', width:20, sortable:true},
      {field:'keyCreateTime', title:'key创建时间', width:40, sortable:true},
      {field:'keyValidDay', title:'key有效天数', width:30, sortable:true},
      {field:'updateDesc', title:'备注', width:60, sortable:true},
      {field:'createdTime', title:'创建时间', width:40, sortable:true},
      {field:'lastTime', title:'最后更新时间', width:40, sortable:true}
    ]],
    toolbar:'#easyui_toolbar'
  });

</script>

</body>
</html>
