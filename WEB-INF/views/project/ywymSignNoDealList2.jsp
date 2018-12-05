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
			<li><a href="${ctx }/sys/ywymSignWebController/NoDeal">待处理签约</a></li>
			<li class="active"><a href="${ctx }/sys/ywymSignWebController/NoDeal?status=10">待发放签约</a></li>
			<li><a href="${ctx }/sys/ywymUserWebController/NoDealList">待处理用户</a></li>
			<li><a href="${ctx }/sys/ywymTotalOrderWebController/NoDeallist">未处理订单</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymSign" action="${ctx }/sys/ywymSignWebController/NoDeal" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<%-- <li><label>状态：</label>
					<form:select path="status" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('sign_status')}"   htmlEscape="false"/>
					</form:select>
				</li> --%>
				
				<li><label>发起时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<sys:message content="${message }"/>
		<!-- <input id="checkSelects" class="btn btn-info" type="button" value="批量审核"/><br/> -->
		<br/>
		<input id="sendSelects" class="btn btn-info" type="button" value="批量发放"/><br/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th><input type="checkbox" id="allbox" /></th>
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
			<tr data-idList = "${entity.id }" >
				<td><input type="checkbox" name="aId" value="${entity.id }"/></td>
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
					<c:if test="${entity.status eq 10 && entity.sendType ne 1 && (countSys eq 2 || countSys eq 3)}">
						<a href="${ctx }/sys/ywymSignWebController/confirmSend?id=${entity.id }&sendType=1">确定发放</a>
					</c:if>
					<a href="${ctx}/sys/ywymSignWebController/exportLog?id=${entity.id }">导出</a>
					<!-- 审核状态判断 start-->
					<%-- <c:if test="${entity.status eq 2 && countSys eq 1 }">
						<a href="${ctx}/sys/ywymSignWebController/save?id=${entity.id }&status=3"  onclick="return confirm('确定操作？')">审核通过</a>
						<a href="javascript:void(0)" id="refuse" userId="${entity.id }">拒绝</a>
					</c:if>
					<c:if test="${(entity.status eq 2 || entity.status eq 3) && (countSys eq 2 || countSys eq 3)}">
						<a href="${ctx}/sys/ywymSignWebController/save?id=${entity.id }&status=4"  onclick="return confirm('确定操作？')">审核通过</a>
						<a href="javascript:void(0)" id="refuse" userId="${entity.id }">拒绝</a>
					</c:if> --%>
					<!-- 审核状态判断 end-->
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<sys:page page="${page }"/>
  	</body>
  	<script>
  		/* if("${countSys eq 5}"){
  			window.location.href="${ctx }/sys/ywymTotalOrderWebController/NoDeallist";
  		} */
	  	$('.test-out').on('click', function(){
			var createDateStart = $('.DateStart').val();
			var createDateEnd = $('.DateEnd').val();
			var status = $('#status').val();
			window.location.href="${ctx}/sys/ywymSignWebController/exportLog?createDateStart="+createDateStart+"&createDateEnd="+createDateEnd+"&status="+status;
		});
	  	$("#allbox").click(function(){
	  		if( $(this).is(":checked") ){
	  			$("#contentTable tbody").find("input[type=checkbox]").prop("checked",true);
	  		}else{
	  			$("#contentTable tbody").find("input[type=checkbox]").prop("checked",false);
	  		}
	  	});
	  	$("#contentTable tbody").find("input[type=checkbox]").click(function(){
	  		var len = $("#contentTable tbody").find("input[type=checkbox]").length;
	  		if( $("#contentTable tbody").find("input[type=checkbox]:checked").length == len ){
	  			$("#allbox").prop("checked",true);
	  		}else{
	  			$("#allbox").prop("checked",false);
	  		}
	  	});
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
		$("#refuse").live("click",function(){
			var id = $(this).attr("userId");
			var obj = $(this);
			layer.prompt({title: '请输入拒绝理由'}, function(reason, index){
			  layer.close(index);
			  $.ajax({
					url:"${ctx}/sys/ywymSignWebController/rufuse",
					type:"post",
					data:{reason:reason , userId:id},
					success:function (data) {
						if(data.resultCode == 0){
				            layer.msg("已拒绝");
				            window.location.href="${ctx }/sys/ywymSignWebController/NoDeal";
	                    }else{
						    layer.msg(data.resultMessage);
	                    }
	                }
				});
			});
		})
		//批量审核
		var isLoaded=true;
		$("#checkSelects").click(function(){
			if(!isLoaded ){
  				alert("正在批量审核中，请稍等...");
  				return;
  			}
			if(isLoaded){
			isLoaded=false;
			var idList = [];
			$('#contentTable tbody tr td input').each(function(){
	  				if($(this).is(':checked')){
	  					idList.push($(this).parents('tr').attr('data-idList'));
	  				}
	  			});
			if(idList.length <= 0){
	  				alert("请选择要审核的用户");
	  				return;
	  			}
	  			idList=idList.join(",");
	  			alert(idList);
	  			$.ajax({
  	  				type:"post",
  	  				url: "${ctx }/sys/ywymSignWebController/checkSelects",
  	  				data:{
  	  					idList: idList
  	  				},
  	  				dataType:'json',
  	  				success:function(msg){
  	  					alert(JSON.stringify(msg.resultData));
  	  					window.location.reload();
  	  				},
  					complete: function(msg){
  						isLoaded=true;
  					}  			
  	  			});	
			}
		})
		//批量发放
		var isLoaded=true;
		$("#sendSelects").click(function(){
			if(!isLoaded ){
  				alert("正在批量发放中，请稍等...");
  				return;
  			}
			if(isLoaded){
			isLoaded=false;
			var idList = [];
			$('#contentTable tbody tr td input').each(function(){
	  				if($(this).is(':checked')){
	  					idList.push($(this).parents('tr').attr('data-idList'));
	  				}
	  			});
			if(idList.length <= 0){
	  				alert("请选择要发放的用户");
	  				return;
	  			}
	  			idList=idList.join(",");
	  			alert(idList);
	  			$.ajax({
  	  				type:"post",
  	  				url: "${ctx }/sys/ywymSignWebController/sendSelects",
  	  				data:{
  	  					idList: idList
  	  				},
  	  				dataType:'json',
  	  				success:function(msg){
  	  					alert(JSON.stringify(msg.resultData));
  	  					window.location.reload();
  	  				},
  					complete: function(msg){
  						isLoaded=true;
  					}  			
  	  			});	
			}
		})
  	</script>
</html>
