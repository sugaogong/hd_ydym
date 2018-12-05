<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>管理后台登陆</title>
<%@ include file="/WEB-INF/views/include/style.jsp"%>
<style>
html,body {
	width: 100%;
	height: 100%;
}

body {
	background: #fafafa;
	background: url("${ctx }/static/sys/img/bg.png") no-repeat center center;
	background-size: cover;
}

.form-wrap {
	padding: 20px 70px;
}

.div-error {
	width: 480px;
	margin: 0 auto;
	margin-top: 30px;
	display: none;
}

#inputForm {
	width: 100%;
	margin-bottom: 0px;
}

#inputForm  .control-group {
	border: 2px solid #eee;
	margin-bottom: 20px;
	border-radius: 5px;
	overflow: hidden;
}

#inputForm  .control-group input.nonTopBorder {
	border-top: 0px solid #f5f5f5;
}

#inputForm  .control-group input {
	font-size: 14px;
	padding: 12px;
	height: 50px;
	line-height: 50px;
	width: 100%;
	box-sizing: border-box;
	border: 0;
	border-radius: 0;
	box-shadow: none;
	font-family: 'Microsoft Yahei';
	color: #666;
	background-color: #fff !important;
	text-align: center;
}

.form_sublime {
	margin-top: 10px;
}

.form_sublime input[type=submit] {
	outline: none;
	width: 100%;
	padding: 0;
	letter-spacing: 5px;
	background: #ffa400;
	box-shadow: none;
	border: 0;
	border-radius: 0px;
	line-height: 41px;
	color: #fff;
	display: block;
	font-size: 14px;
	cursor: pointer;
	border-radius: 100px;
	font-family: 'Microsoft Yahei';
}

.form_sublime input[type=submit]:hover {
	background: #fcb637;
}

.ksf_title {
	text-align: center;
	font-size: 20px;
	font-weight: 500;
	letter-spacing: 1px;
	color: #ff9801;
}

.form-wrap .posRel {
	position: relative;
}

.icon_img {
	position: absolute;
	left: 15px;
	width: 24px;
	height: 50px;
	background: no-repeat center center;
	background-size: contain;
}

.icon_img.icon_mima {
	background-image: url("${ctx }/static/sys/img/icon-ys.png")
}

.icon_img.icon_zh {
	background-image: url("${ctx }/static/sys/img/icon-ren.png")
}

.logo_s_ksf {
	position: absolute;
	bottom: 50px;
	left: 50px
}

.form-wrap ::-webkit-input-placeholder { /* WebKit browsers */
	color: #999;
}

.error_info {
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #e86b6b;
}

.loginWrapTop {
	height: 150px;
}

.loginWrap {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 750px;
	height: 470px;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	background: #fff;
	-webkit-box-shadow: 1px 3px 20px rgba(0, 0, 0, 0.76);
	box-shadow: 1px 3px 20px rgba(0, 0, 0, 0.76);
}

.tisWrap {
	float: left;
	width: 300px;
	height: 100%;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.23);
}

.tisWrap .tis_content {
	padding: 20px;
	background: #b91f1f;
	color: #d9d9d9;
}

.tisWrap .tis_content h2 {
	font-size: 20px;
	font-weight: 500;
}

.tisWrap .tis_content span {
	display: block;
	width: 50px;
	border-top: 1px solid #fff;
	margin-left: 5px;
}

.tisWrap .tis_content p {
	padding: 10px 0px;
	font-size: 12px;
}

.tisWrap .tis_img {
	overflow: hidden;
}

.tisWrap .tis_img img {
	transform: scale(.9);
	transition: .5s all;
}

.tisWrap .tis_img img:hover {
	transform: scale(1);
}

.cntWrap {
	margin-left: 300px;
	width: 450px;
	height: 100%;
}

.logoWrap {
	width: 300px;
	height: 80px;
	margin: 0 auto;
	padding: 60px 30px 20px;
	overflow: hidden
}

.logoWrap img {
	float: left;
}

.logoWrap .logo_img {
	width: 30px;
}

.logoWrap .logo_imgTitle {
	width: 250px;
	margin: 25px 0 0 10px;
}

.tt_title {
	position: absolute;
	width: 400px;
	bottom: 20px;
	left: 50%;
	margin-left: -200px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	color: #fff;
}
</style>
</head>
<body>
	<!-- 错误提示  -->
	<%-- <div class="alert alert-error div-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<span id="error-message">${message }</span>
	</div> --%>

	<div class="loginWrapTop"></div>
	<div class="loginWrap">
		<div class="tisWrap">
			<div class="tis_content">
				<h2>系统提示:</h2>
				<span class="tis_line"></span>
				<p>
					此系统为XXXXXXXXX后台管理系统，进入系统需要验证身份，若多次验证错误，系统将冻结您的账户信息，如有疑问请联系开发人员！</p>
			</div>
			<div class="tis_img">
				<img alt="${ctx}/static/sys/img/ch.png"
					src="${ctx}/static/sys/img/ch.png">
			</div>
		</div>

		<div class="cntWrap">
			<div class="logoWrap">
				<%-- <img class="logo_img" alt="${ctx }/static/sys/img/jd-logo.png"
					src="${ctx }/static/sys/img/jd-logo.png"> <img
					class="logo_imgTitle"
					alt="${ctx }/static/sys/img/ksf_login_title.png"
					src="${ctx }/static/sys/img/ksf_login_title.png"> --%>
			</div>
			<div class="form-wrap">
				<form id="inputForm" method="post"
					action="${ctx }/sys/loginWebController/login"
					class="form-horizontal">
					<div class="inputs_group">
						<div class="control-group posRel">
							<!--  <label class="control-label">用户名：</label>   -->
							<span class="icon_img icon_zh"></span> <input id="username"
								type="text" name="username" placeholder="输入账号"
								class="nonTopBorder" />
						</div>
						<div class="control-group posRel">
							<!--  <label class="control-label">密码：</label>   -->

							<span class="icon_img icon_mima"></span> <input id="password"
								type="password" placeholder="输入密码" name="password" />
						</div>
					</div>

					<div class="error_info">
						<span id="error-message">${message }</span>
					</div>

					<div class="form_sublime">
						<input type="submit" value="登录" class="btn btn-large btn-info" />
					</div>
				</form>
			</div>
		</div>

	</div>


	<!-- 左下侧logo -->
	<%-- 	<div class="logo_s_ksf">
		<img class="logo_img" alt="${ctx }/static/sys/img/logo_ksf_sy.png"
			src="${ctx }/static/sys/img/logo_ksf_sy.png">
	</div> --%>

	<div class="tt_title">
		<span> XXXXXXX有限公司 ｜ Master Kong Holdings Limited </span>
	</div>
	<!-- 
	<div class="form-wrap">
		<form id="inputForm" method="post"
			action="${ctx }/sys/loginWebController/login" class="form-horizontal">
			<div class="control-group"></div>
			<div class="control-group">
				<label class="control-label">用户名：</label>
				<div class="controls">
					<input id="username" type="text" name="username" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">密码：</label>
				<div class="controls">
					<input id="password" type="password" name="password" />
				</div>
			</div>
			<div class="form-actions">
				<input type="submit" value="登录" class="btn btn-large btn-info" />
			</div>
		</form>

 
	</div> -->
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 让登陆页面始终在顶级窗口打开
						if (window.name == "main") {
							window.top.location.href = "${ctx}/sys/loginWebController/login";
						}
						// 错误消息不为空时显示div
						var msg = $("#error-message").text();
						if (msg != null && msg != '' && msg != 'null') {
							$(".div-error").css("display", "block");
						}
						// 表单提交
						$("#inputForm")
								.submit(
										function() {
											var username = $("#username").val();
											var password = $("#password").val();
											// 去除空格
											var reg = new RegExp(' ', "gm");
											username = username
													.replace(reg, '');
											password = password
													.replace(reg, '');
											// 非空校验
											if (typeof (username) != 'undefined'
													&& username != null
													&& username != ''
													&& typeof (password) != 'undefined'
													&& password != null
													&& password != '') {
												// 密码sha1加密
												var shaObj = new jsSHA("SHA-1",
														"TEXT");
												shaObj.update(password);
												password = shaObj
														.getHash("HEX");
												$("#username").val(username);
												$("#password").val(password);
												return true;
											}
											return false;
										});
					});
</script>
</html>
