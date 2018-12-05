<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>后台金额分配明细列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymAdminWalletLogWebController/list">后台金额分配明细列表</a></li>
			<li><a href="${ctx }/sys/ywymAdminWalletLogWebController/form">后台金额分配明细添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymAdminWalletLog" action="${ctx }/sys/ywymAdminWalletLogWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>frontTotal：</label>
					<form:input path="frontTotal" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>total：</label>
					<form:input path="total" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>userNo：</label>
					<form:input path="userNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>userName：</label>
					<form:input path="userName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>operatorId：</label>
					<form:input path="operatorId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>operatorNo：</label>
					<form:input path="operatorNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>operatorName：</label>
					<form:input path="operatorName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdminWalletLog.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdminWalletLog.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdminWalletLog.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdminWalletLog.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>frontTotal</th>
				<th>total</th>
				<th>userId</th>
				<th>userNo</th>
				<th>userName</th>
				<th>operatorId</th>
				<th>operatorNo</th>
				<th>operatorName</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.frontTotal }</td>
				<td>${entity.total }</td>
				<td>${entity.userId }</td>
				<td>${entity.userNo }</td>
				<td>${entity.userName }</td>
				<td>${entity.operatorId }</td>
				<td>${entity.operatorNo }</td>
				<td>${entity.operatorName }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymAdminWalletLogWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymAdminWalletLogWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
