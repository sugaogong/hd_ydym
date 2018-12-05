<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
    		<li class="active"><a href="${ctx }/sys/ywymCoderWebController/userList">所拥有卡券列表</a></li>
			<%-- <li><a href="${ctx }/sys/ywymCoderWebController/xiaList">下级卡券添加</a></li>
			<li><a href="${ctx }/sys/ywymCoderWebController/list">下级卡券修改</a></li> --%>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymCoder" action="${ctx }/sys/ywymCoderWebController/userList" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<%-- <li><label>用户名称：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li> --%>
				
				<%-- <li><label>卡券名称：</label>
					<form:input path="codeId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li> --%>
				
				<%-- <li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCoder.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCoder.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCoder.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymCoder.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li> --%>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				
				<th>卡券名称</th>
				<th>卡券描述</th>
				<th>卡券数量</th>
				<!-- <th>用户名称</th>
				<th>上级名称</th>
				<th>备注</th> -->
				<th>创建时间</th>
				<!-- <th>修改时间</th> -->
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				
				<td>${entity.codeName }</td>
				<td>${entity.diec }</td>
				<td>${entity.nums }</td>
				<%-- <td>${entity.userName }</td>
				<td>${entity.adminName }</td>
				<td>${entity.remarks }</td> --%>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<%-- <td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
				<td>
    				<a href="javascript:void(0)" class="ruzhu" data-id="+  ${entity.codeId }  +">发放</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
  	<script type="text/javascript">
				var id = "";
				$(".ruzhu").live('click', function() {
					console.log("focus");
					id = $(this).attr("data-id");
					openSon();

				});
				function openSon(){
		            layer.open({
		                type: 2,
		                area: ['80%', '600px'],
		                fixed: false, //不固定
		                maxmin: true,
		                content: '../../sys/ywymCoderWebController/xiaList?id='+id
		            });
		        }
			</script>
</html>
