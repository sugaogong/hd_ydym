<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>商品分类表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymTypesWebController/list">商品分类表列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymTypesWebController/form">商品分类表添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymTypesWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">父级分类：</label>
				<div class="controls">
					<form:select path="pid" class="input-medium " style="width:200px">
						<form:option value="" label=""/>
						<form:options items="${pidMap}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">分类名称：</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">排序（数字小靠前）：</label>
				<div class="controls">
					<form:input path="flag" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">图标：</label>
				<div class="controls">
					<sys:img name="icon" value="${entity.icon }" multiSelect="false"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">显示：</label>
				<div class="controls">
					<form:select path="authStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('product_types')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
</html>
