<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>活动表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymActivityWebController/list">活动表列表</a></li>
			<li><a href="${ctx }/sys/ywymActivityWebController/form">活动表添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymActivity" action="${ctx }/sys/ywymActivityWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>活动标题：</label>
					<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>推荐：</label>
					<form:select path="hot" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('hot')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymActivity.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymActivity.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>排序</th>
				<th>活动标题</th>
				<th>描述</th>
				<th>摘要</th>
				<th>推荐</th>
				<th>发布时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.flag }</td>
				<td>${entity.title }</td>
				<td>${entity.disc }</td>
				<td>${entity.abstracts }</td>
				<td>${fnc:getDictLabel(entity.hot, 'hot' ,'') }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
    				<a href="${ctx }/sys/ywymActivityWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymActivityWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
