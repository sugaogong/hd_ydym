<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>订单表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymOrderWebController/list">订单表列表</a></li>
			<li><a href="${ctx }/sys/ywymOrderWebController/form">订单表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymOrder" action="${ctx }/sys/ywymOrderWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>name：</label>
					<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>img：</label>
					<form:input path="img" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>productId：</label>
					<form:input path="productId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>typeId：</label>
					<form:input path="typeId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>productNums：</label>
					<form:input path="productNums" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>totalOrderId：</label>
					<form:input path="totalOrderId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>total：</label>
					<form:input path="total" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>explains：</label>
					<form:input path="explains" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>remarks：</label>
					<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymOrder.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymOrder.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymOrder.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymOrder.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>name</th>
				<th>img</th>
				<th>productId</th>
				<th>typeId</th>
				<th>userId</th>
				<th>productNums</th>
				<th>totalOrderId</th>
				<th>total</th>
				<th>explains</th>
				<th>remarks</th>
				<th>createDate</th>
				<th>updateDate</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.name }</td>
				<td>${entity.img }</td>
				<td>${entity.productId }</td>
				<td>${entity.typeId }</td>
				<td>${entity.userId }</td>
				<td>${entity.productNums }</td>
				<td>${entity.totalOrderId }</td>
				<td>${entity.total }</td>
				<td>${entity.explains }</td>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymOrderWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymOrderWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
