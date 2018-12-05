<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
	    <title>用户列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/userWebController/list">用户列表</a></li>
			<li><a href="${ctx }/sys/userWebController/form">用户添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="sysUser" action="${ctx }/sys/userWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>昵称：</label>
					<form:input path="nickname" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>用户名：</label>
					<form:input path="username" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>用户名</th>
				<th>昵称</th>
				<th>性别</th>
				<th>锁定</th>
				<th>创建时间</th>
				<th>更新时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td><a href="${ctx }/sys/userWebController/form?id=${entity.id }">${entity.username }</a></td>
				<td>${entity.nickname }</td>
				
				<td>${fnc:getDictLabel(entity.gender,'gender','') }</td>
				<td>${fnc:getDictLabel(entity.locked,'locked','') }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/userWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/userWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
