<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>订单列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
    		<li class="active"><a href="${ctx }/sys/ywymTotalOrderWebController/NoDeallist">未处理订单</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymTotalOrder" action="${ctx }/sys/ywymTotalOrderWebController/NoDeallist" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>订单编号：</label>
					<form:input path="orderNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>收货人：</label>
					<form:input path="userName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>收货人电话：</label>
					<form:input path="userPhone" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>订单状态：</label>
					<form:select path="status" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('order_types')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>支付方式：</label>
					<form:select path="payType" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('payType')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymTotalOrder.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymTotalOrder.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>订单编号</th>
				<th>收货人</th>
				<th>收货电话</th>
				<th>收货地址</th>
				<th>订单状态</th>
				<th>业务员</th>
				<th>批发商</th>
				<th>总价</th>
				<th>支付方式</th>
				<th>确认收货时间</th>
				<th>下单时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.orderNo }</td>
				<td>${entity.userName }</td>
				<td>${entity.userPhone }</td>
				<td>${entity.userAddress }</td>
				<td>${fnc:getDictLabel(entity.status, 'order_types' ,'') }</td>
				<td>${entity.adminId }</td>
				<td>${entity.distributorId }</td>
				<td>${entity.total }</td>
				<td>${fnc:getDictLabel(entity.payType, 'payType' ,'') }</td>
				<td><fmt:formatDate value="${entity.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymTotalOrderWebController/form?id=${entity.id }">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
