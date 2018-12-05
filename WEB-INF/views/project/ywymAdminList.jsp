<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymAdminWebController/list">列表</a></li>
			<li><a href="${ctx }/sys/ywymAdminWebController/form">添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymAdmin" action="${ctx }/sys/ywymAdminWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>adminId：</label>
					<form:input path="adminId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>imgs：</label>
					<form:input path="imgs" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>status：</label>
					<form:input path="status" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>remark：</label>
					<form:input path="remark" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>adminId</th>
				<th>userId</th>
				<th>imgs</th>
				<th>status</th>
				<th>remark</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.adminId }</td>
				<td>${entity.userId }</td>
				<td>${entity.imgs }</td>
				<td>${entity.status }</td>
				<td>${entity.remark }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymAdminWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymAdminWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
