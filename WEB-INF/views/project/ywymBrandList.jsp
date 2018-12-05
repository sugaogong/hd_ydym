<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>品牌表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymBrandWebController/list">品牌表列表</a></li>
			<li><a href="${ctx }/sys/ywymBrandWebController/form">品牌表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymBrand" action="${ctx }/sys/ywymBrandWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>标题：</label>
					<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>所属分类：</label>
					<form:input path="typeId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymBrand.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymBrand.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>标题</th>
				<th>描述</th>
				<th>规格</th>
				<th>所属分类</th>
				<th>浏览量</th>
				<th>价格</th>
				<th>创建时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.title }</td>
				<td>${entity.diec }</td>
				<td>${entity.specifications }</td>
				<td>${entity.typeTitle }</td>
				<td>${entity.browse }</td>
				<td>${entity.price }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymBrandWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymBrandWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
