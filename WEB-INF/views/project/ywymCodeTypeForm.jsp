<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>商品表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymCodeTypeWebController/list">卡券列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymCodeTypeWebController/form">卡券添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx }/sys/ywymCodeTypeWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">商品编号：</label>
				<div class="controls">
					<form:input path="codeNo" htmlEscape="false" class="input-xlarge required" readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">图片：</label>
				<div class="controls">
					<sys:img name="img" value="${entity.img }" multiSelect="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">商品名称：</label>
				<div class="controls">
					<form:input path="title" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">描述：</label>
				<div class="controls">
					<form:input path="diec" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<%-- <div class="control-group">
				<label class="control-label">规格：</label>
				<div class="controls">
					<form:input path="specifications" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div> --%>
			
			<div class="control-group">
				<label class="control-label">是否使用：</label>
				<div class="controls">
					<form:select path="authStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('product_types')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">使用量：</label>
				<div class="controls">
					<form:input path="browse" htmlEscape="false" class="input-xlarge " readonly="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">价钱：</label>
				<div class="controls">
					<form:input path="price" htmlEscape="false" class="input-xlarge "/>
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
