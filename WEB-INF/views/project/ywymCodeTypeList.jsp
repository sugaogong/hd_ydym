<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>商品表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymCodeTypeWebController/list">卡券列表</a></li>
			<li><a href="${ctx }/sys/ywymCodeTypeWebController/form">卡券添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymCodeType" action="${ctx }/sys/ywymCodeTypeWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				
				<li><label>名称：</label>
					<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<%-- <li><label>diec：</label>
					<form:input path="diec" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>specifications：</label>
					<form:input path="specifications" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li> --%>
				<li><label>使用状态：</label>
					<form:select path="authStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('product_types')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeType.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeType.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeType.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeType.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>专属编号</th>
				<th>图片</th>
				<th>名称</th>
				<th>描述</th>
				<th>规格</th>
				<th>是否上架</th>
				<th>使用量</th>
				<th>实际价钱</th>
				<th>备注</th>
				<th>创建时间</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.codeNo }</td>
				<td><img src="${entity.img }" height="80" width="80" /></td>
				<td>${entity.title }</td>
				<td>${entity.diec }</td>
				<td>${entity.specifications }</td>
				<td>${fnc:getDictLabel(entity.authStatus, 'product_types' ,'') }</td>
				<td>${entity.browse }</td>
				<td>${entity.price }</td>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymCodeTypeWebController/form?id=${entity.id }&status=1">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
