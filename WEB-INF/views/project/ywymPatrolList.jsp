<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>日常巡查表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymPatrolWebController/list">日常巡查表列表</a></li>
			<li><a href="${ctx }/sys/ywymPatrolWebController/form">日常巡查表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymPatrol" action="${ctx }/sys/ywymPatrolWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>address：</label>
					<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>signId：</label>
					<form:input path="signId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>img：</label>
					<form:input path="img" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>status：</label>
					<form:input path="status" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>confirmTime：</label>
					<form:input path="confirmTime" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymPatrol.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymPatrol.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymPatrol.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymPatrol.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>userId</th>
				<th>address</th>
				<th>signId</th>
				<th>img</th>
				<th>status</th>
				<th>confirmTime</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.userId }</td>
				<td>${entity.address }</td>
				<td>${entity.signId }</td>
				<td>${entity.img }</td>
				<td>${entity.status }</td>
				<td><fmt:formatDate value="${entity.confirmTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymPatrolWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymPatrolWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
