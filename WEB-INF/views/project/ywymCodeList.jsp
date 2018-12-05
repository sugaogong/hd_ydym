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
			<li class="active"><a href="${ctx }/sys/ywymCodeWebController/list">列表</a></li>
			<li><a href="${ctx }/sys/ywymCodeWebController/form">添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymCode" action="${ctx }/sys/ywymCodeWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>signId：</label>
					<form:input path="signId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>productId：</label>
					<form:input path="productId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>title：</label>
					<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>nums：</label>
					<form:input path="nums" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>changeTime：</label>
					<form:input path="changeTime" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>status：</label>
					<form:input path="status" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>remarks：</label>
					<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCode.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCode.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCode.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCode.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>signId</th>
				<th>productId</th>
				<th>title</th>
				<th>nums</th>
				<th>changeTime</th>
				<th>status</th>
				<th>remarks</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.signId }</td>
				<td>${entity.productId }</td>
				<td>${entity.title }</td>
				<td>${entity.nums }</td>
				<td><fmt:formatDate value="${entity.changeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${entity.status }</td>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymCodeWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymCodeWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
