<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>签约表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymSignWebController/listNoPatrol">未巡查列表</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymSign" action="${ctx }/sys/ywymSignWebController/listNoPatrol" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<%-- <li><label>状态：</label>
					<form:select path="status" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('sign_status')}"   htmlEscape="false"/>
					</form:select>
				</li> --%>
				<%-- <li><label>经销部筛选：</label>
					<select name="" style="width: 200px">
							<option>请选择</option>
						<c:forEach var="regionList" items="${regionList }">
							<option value="">${regionList.region }</option>
						</c:forEach>
					</select>
				</li> --%>
				<li><label>发起时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<!-- <li class="btns"><input id="btnSubmit" class="btn btn-success test-out" type="button" value="导出"/></li> -->
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>签约类型</th>
				<th>活动时间</th>
				<th>有效时间</th>
				<th>费用</th>
				<th>关联商家</th>
				<th>业务员编号</th>
				<th>业务员姓名</th>
				<th>业务员余额</th>
				<th>备注</th>
				<th>状态</th>
				<th>创建时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.signType }</td>
				<td><fmt:formatDate value="${entity.contractTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd"/></td>
				<td>${entity.total }</td>
				<td>${entity.userId }</td>
				<td>${entity.adminId }</td>
				<td>${entity.userName }</td>
				<td>${entity.adminWallet }</td>
				<td>${entity.remark }</td>
				<td>${fnc:getDictLabel(entity.status , 'sign_status' ,'') }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test="${entity.status ne 1 }">
						<%-- <a href="${ctx }/sys/ywymSignWebController/byId?id=${entity.id }">查看详情</a> --%>
						<a href="javascript:selectDetails('${entity.id }')" id="seeReport"">查看详情</a>
						<a href="javascript:seereport('${entity.id }')" id="seeReport">查看汇报</a>
					</c:if>
					<a href="${ctx}/sys/ywymSignWebController/exportLog?id=${entity.id }">导出</a>
					
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
  	<script>
	  	function seereport(id){
	  		layer.open({
	  		  type: 2,
	  		  title: '查看汇报',
	  		  area: ['50%','600px'],
	  		  shadeClose:true,
	  		  closeBtn:true,
	  		  content: ['${ctx }/web/dynamicSign.html?signId='+id], //iframe的url，no代表不显示滚动条
	  		});
	  	}
	  	
		function selectDetails(id){
	  		layer.open({
	  		  type: 2,
	  		  title: '查看汇报',
	  		  area: ['70%','800px'],
	  		  shadeClose:true,
	  		  closeBtn:true,
	  		  content: ['${ctx }/sys/ywymSignWebController/byId?id='+id], //iframe的url，no代表不显示滚动条
	  		});
	  	}
  	</script>
</html>
