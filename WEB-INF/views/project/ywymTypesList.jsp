<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>商品分类表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymTypesWebController/list">商品分类表列表</a></li>
			<li><a href="${ctx }/sys/ywymTypesWebController/form">商品分类表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymTypes" action="${ctx }/sys/ywymTypesWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymTypes.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymTypes.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form> 
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>排序</th>
				<th>所属分类</th>
				<th>菜单级别</th>
				<th>分类名称 </th>
				<th>显示</th>
				<th>icon</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.flag }</td>
				<td>${entity.pidName }</td>
				<td>${fnc:getDictLabel(entity.type,'menu_level','') }</td>
				<td>${entity.name }</td>
				<td>${fnc:getDictLabel(entity.authStatus, 'product_types' ,'') }</td>
				<td><img src="${entity.icon }" width="80px"></td>
				<td>
    				<a href="${ctx }/sys/ywymTypesWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymTypesWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
