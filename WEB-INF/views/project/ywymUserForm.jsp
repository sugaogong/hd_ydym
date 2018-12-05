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
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymUserWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">店铺名称：</label>
				<div class="controls">
					<form:input path="shopName" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">联系人：</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">身份证号码：</label>
				<div class="controls">
					<form:input path="cardNo" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">身份证图片：</label>
				<div class="controls">
					<img alt="" src="${entity.identityCard }" width="350px">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">营业执照图片：</label>
				<div class="controls">
					<img alt="" src="${entity.businessImg }" width="350px">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">省：</label>
				<div class="controls">
					<form:select path="provinceId"  class="input-large required" onchange="provinceChange()">
						<form:option value="" label=""/>
						<form:options items="${fnc:getAllProvince()}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">市：</label>
				<div class="controls">
					<form:select path="cityId" class="input-medium required" onchange="cityChange()">
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
			</div>
			<div class="control-group">
				<label class="control-label">店铺图片：</label>
				<div class="controls img-list">
					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">电话：</label>
				<div class="controls">
					<form:input path="phone" htmlEscape="false" class="input-xlarge required"/>
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
			<div class="control-group">
				<label class="control-label">资料审核状态：</label>
				<div class="controls">
					<form:select path="autoStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('autoStatus')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">登录状态：</label>
				<div class="controls">
					<form:select path="loginStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('loginStatus')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
  	<script type="text/javascript">
  		var imgList = "${entity.shopImg }".split(',');
  		console.log(imgList);
  		for (var i = 0; i < imgList.length; i++) {
  			var img = $('<img>');
  			$(img).css({'margin-top': '10px', 'width': '350px', 'display': 'block'})
  			$(img).attr('src', imgList[i]);
  			console.log(0)
  			$('.img-list').append(img);
  		}
  	</script>
</html>
