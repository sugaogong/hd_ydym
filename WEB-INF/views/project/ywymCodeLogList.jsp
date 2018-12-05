<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>卡券流水表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymCodeLogWebController/list">卡券流水表列表</a></li>
			<%-- <li><a href="${ctx }/sys/ywymCodeLogWebController/form">卡券流水表添加</a></li> --%>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymCodeLog" action="${ctx }/sys/ywymCodeLogWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				
				<li><label>发放人名称：</label>
					<form:input path="sendName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				
				<li><label>接收人名称：</label>
					<form:input path="receiveName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				
				<li><label>卡券名称：</label>
					<form:input path="codeName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>数量：</label>
					<form:input path="MinNum" htmlEscape="false" maxlength="255" class="input-medium" />
					~
					<form:input path="MaxNum" htmlEscape="false" maxlength="255" class="input-medium" />
				</li>
				
				
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeLog.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeLog.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				
				<th>发放人名称</th>
				
				<th>接收人名称</th>
				
				<th>卡券名称</th>
				<th>数量</th>
				<!-- <th>前后台标识</th> -->
				<th>备注</th>
				<th>发放时间</th>
				
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				
				<td>${entity.sendName }</td>
				
				<td>${entity.receiveName }</td>
				
				<td>${entity.codeName }</td>
				<td>${entity.nums }</td>
				<%-- <td>${entity.type }</td> --%>
				<td>${entity.remarks }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				
				<%-- <td>
    				<a href="${ctx }/sys/ywymCodeLogWebController/form?id=${entity.id }">修改</a>
					<a href="${ctx }/sys/ywymCodeLogWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
				</td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
</html>
