<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx }/sys/ywymCoderWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">用户ID：</label>
				<div class="controls">
					<form:input path="" htmlEscape="false" class="input-xlarge required" value="${entity.userName }" readonly="true" />
					<form:input path="userId" htmlEscape="false" class="input-xlarge required" value="${entity.userId }" readonly="true" type="hidden"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">上级ID：</label>
				<div class="controls">
					<form:input path="" htmlEscape="false" class="input-xlarge required" value="${entity.adminName }" readonly="true"/>
					<form:input path="adminId" htmlEscape="false" class="input-xlarge required" value="${entity.adminId }" readonly="true" type="hidden"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">卡券选择：</label>
				<div class="controls">
					<select name="codeId"  style="width:200px">
						<c:forEach var="type" items="${type }">
							<option value="${type.id }">${type.diec }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">数量：</label>
				<div class="controls">
					<form:input path="nums" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:input path="remarks" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
</html>
