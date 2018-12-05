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
			<li class="active"><a href="${ctx }/sys/ywymUserWebController/listView">用户列表</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymUser" action="${ctx }/sys/ywymUserWebController/listView" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>名称：</label>
					<form:input path="shopName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>电话：</label>
					<form:input path="phone" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>编号：</label>
					<form:input path="userNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>电话</th>
				<th>角色</th>
				<th>营业部</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.userNo }</td>
				<td>${entity.shopName }</td>
				<td>${entity.phone }</td>
				<td>${fnc:getDictLabel(entity.userType, 'userType' ,'') }</td>
				<td>${entity.region }</td>
				<td><a href=javascript:choose(this,"${entity.id }")>选择</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
  	<script>
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
       // $("#contentTable").dblclick(function(event){
		function  choose(obj,id) {
            var _id = id;
            console.log(_id);
            parent.getValueFromSon({
                id:_id
            });
            parent.layer.close(index);
        };
	</script>
</html>
