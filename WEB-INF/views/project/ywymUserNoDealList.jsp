<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
    		<li><a href="${ctx }/sys/ywymSignWebController/NoDeal">待处理签约</a></li>
    		<li><a href="${ctx }/sys/ywymSignWebController/NoDeal?status=10">待发放签约</a></li>
			<li class="active"><a href="${ctx }/sys/ywymUserWebController/NoDealList">待处理用户</a></li>
			<li><a href="${ctx }/sys/ywymTotalOrderWebController/NoDeallist">未处理订单</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymUser" action="${ctx }/sys/ywymUserWebController/NoDealList" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>名称：</label>
					<form:input path="shopName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<%-- <li><label>省：</label>
					<form:select path="provinceId" id="provinceId" class="input-large required" onchange="provinceChange()">
						<form:option value="" label=""/>
						<form:options items="${fnc:getAllProvince()}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>市：</label> 
					<form:select path="cityId" id="cityId" class="input-large required" onchange="cityChange()">
						<form:option value="" label=""/>
						<form:options items="${cMap}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>区：</label>
					<form:select path="districtId" id="districtId" class="input-large required">
						<form:option value="" label=""/>
						<form:options items="${dMap}"   htmlEscape="false"/>
					</form:select>
				</li> --%>
				<li><label>电话：</label>
					<form:input path="phone" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>编号：</label>
					<form:input path="userNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="button" onclick="queryList()" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>编号</th>
				<th>联系人</th>
				<th>身份证</th>
				<th>名称</th>
				<th>电话</th>
				<th>角色</th>
				<th>余额</th>
				<th>所属批发商编号</th>
				<th>所属批发商名称</th>
				<th>所属上级编号</th>
				<th>所属上级名称</th>
				<th>审核状态</th>
				<th>登录状态</th>
				<th>营业部</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.userNo }</td>
				<td>${entity.name }</td>
				<td>${entity.cardNo }</td>
				<td>${entity.shopName }</td>
				<td>${entity.phone }</td>
				<td>${entity.userType }</td>
				<td>${entity.wallet }</td>
				<td>${entity.disNo }</td>
				<td>${entity.disName }</td>
				<td>${entity.adminUserNo }</td>
				<td>${entity.adminUserName }</td>
				<td>${entity.autoStatus }</td>
				<td>${entity.loginStatus }</td>
				<td>${entity.region }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<a href="${ctx}/sys/ywymUserWebController/save?id=${entity.id }&autoStatus=2&re=1"  onclick="return confirm('确定操作？')">通过</a>
					<a href="${ctx}/sys/ywymUserWebController/save?id=${entity.id }&autoStatus=3&re=1"  onclick="return confirm('确定操作？')">拒绝</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
  	<script src="${ctx }/static/layer/layer.js"></script>
</html>
