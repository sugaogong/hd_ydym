<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>批发商库存管理列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymDistributorProductWebController/list">批发商库存管理列表</a></li>
			<li><a href="${ctx }/sys/ywymDistributorProductWebController/form">批发商库存管理添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymDistributorProduct" action="${ctx }/sys/ywymDistributorProductWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>userId：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>productId：</label>
					<form:input path="productId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>stock：</label>
					<form:input path="stock" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>realStock：</label>
					<form:input path="realStock" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>price：</label>
					<form:input path="price" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymDistributorProduct.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymDistributorProduct.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymDistributorProduct.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymDistributorProduct.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
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
				<th>productId</th>
				<th>stock</th>
				<th>realStock</th>
				<th>createDate</th>
				<th>updateDate</th>
				<th>price</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.userId }</td>
				<td>${entity.productId }</td>
				<td>${entity.stock }</td>
				<td>${entity.realStock }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${entity.price }</td>
				<td>
    				<a href="${ctx }/sys/ywymDistributorProductWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymDistributorProductWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
