<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户收入明细列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymLogBalanceUserWebController/list">用户收入明细列表</a></li>
			<li><a href="${ctx }/sys/ywymLogBalanceUserWebController/form">用户收入明细添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymLogBalanceUser" action="${ctx }/sys/ywymLogBalanceUserWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>total：</label>
					<form:input path="total" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>delFlag：</label>
					<form:input path="delFlag" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>status：</label>
					<form:input path="status" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>disc：</label>
					<form:input path="disc" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>remarks：</label>
					<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymLogBalanceUser.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymLogBalanceUser.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymLogBalanceUser.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymLogBalanceUser.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
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
				<th>total</th>
				<th>delFlag</th>
				<th>status</th>
				<th>disc</th>
				<th>remarks</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.userId }</td>
				<td>${entity.total }</td>
				<td>${entity.delFlag }</td>
				<td>${entity.status }</td>
				<td>${entity.disc }</td>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymLogBalanceUserWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymLogBalanceUserWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
