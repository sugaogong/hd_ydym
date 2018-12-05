<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>商品表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
    	<script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymProductWebController/list">商品表列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymProductWebController/form">商品表添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymProductWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">所属分类：</label>
				<div class="controls">
					<select name="typeId"  style="width:200px">
						<c:forEach var="map" items="${map }">
							<option <c:if test="${map.id eq entity.typeId}">selected=selected</c:if> value="${map.id }">${map.name }</option>
						</c:forEach>
					</select>
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
			<div class="control-group">
				<label class="control-label">规格：</label>
				<div class="controls">
					<form:input path="specifications" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">推荐：</label>
				<div class="controls">
					<form:select path="hotStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('hot')}"   htmlEscape="false"/>
					</form:select>
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
			<div class="control-group">
				<label class="control-label">浏览量：</label>
				<div class="controls">
					<form:input path="browse" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">价格：</label>
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
