<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>订单表添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymTotalOrderWebController/list">订单列表</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymTotalOrderWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">收货人：</label>
				<div class="controls">
					<form:input path="userName" htmlEscape="false" class="input-xlarge " readOnly="readOnly"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">收货电话：</label>
				<div class="controls">
					<form:input path="userPhone" htmlEscape="false" class="input-xlarge " readOnly="readOnly"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">收货地址：</label>
				<div class="controls">
					<form:textarea path="userAddress" htmlEscape="false" class="input-xlarge " readOnly="readOnly"/>
				</div>
			</div>
			<c:if test="${entity.status eq 2}">
				<div class="control-group">
					<label class="control-label">订单状态：</label>
					<div class="controls">
						<select name="status">
							<option value="3">选择发货</option>
							<option value="5">选择拒绝</option>
						</select>
					</div>
				</div>
			</c:if>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:input path="remarks" htmlEscape="false" class="input-xlarge " readOnly="readOnly"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">取消理由：</label>
				<div class="controls">
					<form:input path="reason" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">总价：</label>
				<div class="controls">
					<form:input path="total" htmlEscape="false" class="input-xlarge " readOnly="readOnly"/>
				</div>
			</div>
			<div class="img-list" style="margin-left: 160px;">
			</div>
			<table border="1" style="margin-left: 160px;">
				<tr>
				    <th width="180">商品名</th>
				    <th width="180">规格</th>
				    <th width="180">数量</th>
				    <th width="180">单价</th>
				</tr>
				<c:forEach var="list" items="${list }">
				<tr>
				  
				    <td style="text-align: center">${list.title }</td>
				    <td style="text-align: center">${list.specifications }</td>
				    <td style="text-align: center">${list.productNums }</td>
				    <td style="text-align: center">${list.total }</td>
				  
				</tr>
				</c:forEach>
			</table>
			<div class="form-actions">
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"/>&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
		<script type="text/javascript">
			$(function(){
				
				$.ajax({
					type: 'post',
					url: '${ctx}/sys/ywymOrderWebController/getOrderId',
					data:{orderId : "${entity.id}"},
					success: (data) => {
						console.log(data.resultData);
						var imgList = data.resultData;
						console.log(imgList);
						imgList.forEach(function(item, index){
							var img = $('<img>');
							$(img).css('width', '100px');
							$(img).attr('src',  item.img.split(',')[0]);
							$('.img-list').append(img);
						})
					},
					error: (error) => {
						console.log(error)
					}
				})
				
			})
		</script>
  	</body>
</html>
