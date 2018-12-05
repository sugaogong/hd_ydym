<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>下级列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
    		<%-- <li><a href="${ctx }/sys/ywymCoderWebController/userList">所拥有卡券列表</a></li> --%>
			<%-- <li class="active"><a href="${ctx }/sys/ywymCoderWebController/xiaList">下级卡券添加</a></li> --%>
			<%-- <li><a href="${ctx }/sys/ywymCoderWebController/list">下级卡券修改</a></li> --%>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymUser" action="${ctx }/sys/ywymCoderWebController/xiaList" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<%-- <li><label>名称：</label>
					<form:input path="shopName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>电话：</label>
					<form:input path="phone" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCodeUser.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li> --%>
			</ul>
		</form:form>
		<sys:message content="${message }"/>		
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>名称</th>
				<th>卡券</th>
				<th>数量</th>
				<!-- <th>备注</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr class="id" data-id="${entity.id }">
				
				<td><input maxlength="255" class="input-medium shop" name="shop" value="${entity.shopName }" readonly="readonly"/></td>
				<td ><input data-id="${codeId }" maxlength="255" class="input-medium code" name="code" value="${codeName }" readonly="readonly"/></td>
				<td><input maxlength="255" class="input-medium nums" name="nums" value="0"/></td>
				<!-- <td><input maxlength="255" class="input-medium remarks" name="remarks"/></td> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<input id="reset" class="btn btn-info" type="button" value="重置"/>
	<input id="sub" class="btn btn-info" type="button" value="保存"/>
	<%-- <sys:page page="${page }"/> --%>
  	</body>
  	<script type="text/javascript">
  	$(function(){
  		$("#sub").live('click',function(){
  			var len = $("#contentTable tbody tr").length;
  			var id = "",shop = "",code = "",nums = "",remarks = "";
  			var jsonList = new Array();
  			for(var i = 0;i < len; i++){
  				var item = $("#contentTable tbody tr").eq(i);
  				id = $(item).data('id')
  				shop = item.find("input[name=shop]").val();
  				code = item.find("input[name=code]").data('id');
  				nums = item.find("input[name=nums]").val();
  				/* remarks = item.find("input[name=remarks]").val(); */
  				var arr = {
  						id:id,
  						shop:shop,
  						code:code,
  						nums:nums,
  						remarks:remarks,
  				}
  				jsonList.push(arr);
  			}
  			console.log(jsonList);
  			$.ajax({
  				url:"${ctx}/sys/ywymCoderWebController/newAddCode",
  				type:"post",
  				data:{
  					jsonList:JSON.stringify(jsonList),
  				},
  				success:function(data){
  					console.log(data);
  					if(data.resultCode == 0){
  						alert(data.resultData);
  						window.parent.location.reload();
  						//window.parent.location.href  = "${ctx}/sys/ywymCoderWebController/list";
  					}else {
  						alert(data.errorMessage);
  					}
  				}
  			})
  			
  		});
  	});
  	</script>
</html>
