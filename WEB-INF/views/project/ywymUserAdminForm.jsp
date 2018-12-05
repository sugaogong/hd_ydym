<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>用户表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymUserWebController/list">用户表列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymUserWebController/formAdmin">业务员添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymUserWebController/saveAdmin" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">名称：</label>
				<div class="controls">
					<form:input path="shopName" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<%-- <div class="control-group">
				<label class="control-label">省：</label>
				<div class="controls">
					<form:select path="provinceId"  class="input-large" onchange="provinceChange()">
						<form:option value="" label=""/>
						<form:options items="${fnc:getAllProvince()}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">市：</label>
				<div class="controls">
					<form:select path="cityId" class="input-medium" onchange="cityChange()">
						<form:option value="" label=""/>
						<form:options items="${fnc:getCityMap(entity.cityId)}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">区：</label>
				<div class="controls">
					<form:select path="districtId" class="input-medium">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDistrictMap(entity.districtId)}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">详细地址：</label>
				<div class="controls">
					<form:input path="address" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div> --%>
			<div class="control-group">
				<label class="control-label">电话：</label>
				<div class="controls">
					<form:input path="phone" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">密码：</label>
				<div class="controls">
					<c:choose>
						<c:when test="${empty sysUser.id }">
							<form:input path="password" htmlEscape="false" class="input-xlarge required" type="password"/>
						</c:when>
						<c:otherwise>
							<a id="resetPwd" href="javascript:;">重设密码</a>
							<input id="password" type="password" name="password" class="input-resetPwd hide input-large required" disabled="true"/>
							&nbsp;&nbsp;<a id="cancelResetPwd" href="javascript:;" class="hide">取消</a>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">角色：</label>
				<div class="controls">
					<form:select path="userType" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('userType')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<input name="autoStatus" type="hidden" value="2">
			<input name="loginStatus" type="hidden" value="1">
			
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
  	<script type="text/javascript">
		$(document).ready(function(){
			$("#inputForm").submit(function(){
				var password = $("#password").val();
				// 密码sha1加密
				if(notBlank(password)){
					var shaObj = new jsSHA("SHA-1", "TEXT");
					shaObj.update(password);
					password = shaObj.getHash("HEX");
	  				$("#password").val(password);
	  				return true;
				}
			});
			$("#resetPwd").click(function(){
				$(this).hide();
				$(".input-resetPwd").show();
				$(".input-resetPwd").removeAttr("disabled");
				$("#cancelResetPwd").show();
			});
			$("#cancelResetPwd").click(function(){
				$(this).hide();
				$(".input-resetPwd").hide();
				$(".input-resetPwd").attr("disabled","true");
				$(this).siblings(".sys-error-info").remove();
				$("#resetPwd").show();
				
			});
		});
		</script>
</html>
