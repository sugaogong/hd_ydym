<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>提现开关表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymSetFetchWebController/list">提现开关表列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymSetFetchWebController/form">提现开关表添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="/${projectName}/sys/ywymSetFetchWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">status：</label>
				<div class="controls">
					<form:input path="status" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
</html>
