<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>修改密码</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<!-- <ul class="nav nav-tabs sys-font">
			<li class="active"><a href="javascript:;">修改密码</a></li>
		</ul> -->
		<sys:message content="${message }"/>
		<form id="inputForm" action="${ctx }/sys/userWebController/editPassword" method="post" class="form-horizontal">
			<div class="control-group">
				<label class="control-label">旧密码：</label>
				<div class="controls">
					<input id="oldPassword" type="password" name="oldPassword" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">新密码：</label>
				<div class="controls">
					<input id="password" type="password" name="password" class="input-xlarge required"/>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存" />&nbsp;
				<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/> -->
			</div>
		</form>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#inputForm").submit(function(){
				var password = $("#password").val();
				var oldPassword = $("#oldPassword").val();
				// 密码sha1加密
				if(notBlank(password) && notBlank(oldPassword)){
					var shaObj = new jsSHA("SHA-1", "TEXT");
					shaObj.update(password);
					password = shaObj.getHash("HEX");
	  				$("#password").val(password);
	  				
	  				var shaObj = new jsSHA("SHA-1", "TEXT");
					shaObj.update(oldPassword);
					oldPassword = shaObj.getHash("HEX");
	  				$("#oldPassword").val(oldPassword);
	  				return true;
				}
			});
		});
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
  	</body>
</html>
