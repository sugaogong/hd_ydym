<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>版本表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymVersionWebController/list">版本表列表</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="schoolVersion" action="${ctx }/sys/ywymVersionWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${schoolVersion.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${schoolVersion.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>类型</th>
				<th>版本号</th>
				<th>版本名称</th>
				<th>版本描述</th>
				<th>跳转链接</th>
				<th>强制更新</th>
				<th>发布时间</th>
				<th>更新时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${fnc:getDictLabel(entity.type, 'version_type' ,'') }</td>
				<td>${entity.versionNo }</td>
				<td>${entity.versionName }</td>
				<td>${entity.versionDesc }</td>
				<td>${entity.linkUrl }</td>
				<td>${fnc:getDictLabel(entity.remarks, 'remarks' ,'') }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymVersionWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymVersionWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
