<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>版本表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymVersionWebController/list">版本表列表</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymVersionWebController/save" method="post" enctype="multipart/form-data"  class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">类型：</label>
				<div class="controls">
					<form:select path="type" class="input-medium">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('version_type')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">版本号：</label>
				<div class="controls">
					<form:input path="versionNo" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">版本名称：</label>
				<div class="controls">
					<form:input path="versionName" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">版本描述：</label>
				<div class="controls">
					<form:input path="versionDesc" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">上传安装包：</label>
				<div class="controls">
					<input type="file" name="fileUrls" value="${entity.fileUrl }"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">下载链接：</label>
				<div class="controls">
					<form:input path="linkUrl" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">强制更新：</label>
				<div class="controls">
					<form:select path="remarks" class="input-medium">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('remarks')}"   htmlEscape="false"/>
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
