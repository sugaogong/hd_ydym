<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>活动表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
    	<script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymActivityWebController/list">活动表列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymActivityWebController/form">活动表添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymActivityWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">图片：</label>
				<div class="controls">
					<sys:img name="imgs" value="${entity.imgs }" multiSelect="false"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">活动标题：</label>
				<div class="controls">
					<form:input path="title" htmlEscape="false" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">描述：</label>
				<div class="controls">
					<form:input path="disc" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">摘要：</label>
				<div class="controls">
					<form:input path="abstracts" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">活动时间：</label>
				<div class="controls">
					<form:input path="activityDate" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">推荐：</label>
				<div class="controls">
					<form:select path="hot" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('hot')}"   htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">排序（数字小的靠前）：</label>
				<div class="controls">
					<form:input path="flag" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:input path="remarks" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">内容：</label>
				<div class="controls">
					<script id="content" name="content" type="text/plain"  style="width:1024px;height:500px;">${entity.content}</script>
				</div>
			</div>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
	<script type="text/javascript">
   		 var ue = UE.getEditor('content');
  	</script>
</html>
