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
<div id="orders">

</div>

<div id="easyui_toolbar" region="north" border="false"
     style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
  <%--<div style="float: left;">--%>
  <%--<a class="easyui-linkbutton" plain="true" icon="icon-filter" onclick="javascript:showAddDialog();">详细信息</a>--%>
  <%--</div>--%>

  <%--<div class="datagrid-btn-separator"></div>--%>

  <div style="float: left;">
    <%--<a class="easyui-linkbutton" plain="true"--%>
       <%--icon="icon-remove" onclick="javascript:deleteOrder();">删除</a>--%>
  </div>

  <div id="tb" style="float: right;">
    <input id="search_box" class="easyui-searchbox" style="width: 250px"  data-options="searcher:doSearch,prompt:'请输入查询词',menu:'#search_menu'" />
    <div id="search_menu" style="width:120px">
      <div data-options="name:'user_name'">用户名</div>
      <div data-options="name:'ip_addr'">IP地址</div>
    </div>
  </div>

</div>


<script type="text/javascript">

  function doSearch(value, name){
    alert("value:"+value+";name:"+name);
  }

  $("#orders").datagrid({
    height:430,
    url:'<%=basePath%>/admin/logs/getAllLogs',
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
      {field:'userID', title:'用户ID', width:30, sortable:true},
      {field:'userName', title:'用户名', width:50, sortable:true},
      {field:'name', title:'更新', width:50, sortable:true},
      {field:'fileName', title:'文件', width:80, sortable:true},
      {field:'updateTime', title:'更新时间', width:60, sortable:true},
      {field:'ipAddr', title:'IP地址', width:60, sortable:true}
    ]],
    toolbar:'#easyui_toolbar'
  });

</script>

</body>
</html>
