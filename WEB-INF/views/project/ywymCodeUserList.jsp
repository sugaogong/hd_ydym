<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>卡券表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymCodeUserWebController/list">卡券表列表</a></li>
			<li><a href="${ctx }/sys/ywymCodeUserWebController/form">卡券表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymCodeUser" action="${ctx }/sys/ywymCodeUserWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>adminId：</label>
					<form:input path="adminId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>codeId：</label>
					<form:input path="codeId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>signId：</label>
					<form:input path="signId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>nums：</label>
					<form:input path="nums" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>exchangeDate：</label>
					<form:input path="exchangeDate" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>status：</label>
					<form:input path="status" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>remarks：</label>
					<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
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
				<th>adminId</th>
				<th>codeId</th>
				<th>signId</th>
				<th>nums</th>
				<th>exchangeDate</th>
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
				<td>${entity.userId }</td>
				<td>${entity.adminId }</td>
				<td>${entity.codeId }</td>
				<td>${entity.signId }</td>
				<td>${entity.nums }</td>
				<td>${entity.exchangeDate }</td>
				<td>${entity.status }</td>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymCodeUserWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymCodeUserWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
