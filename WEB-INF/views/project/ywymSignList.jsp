<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>签约表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font" id="nav-list">
			<li class="active"><a href="${ctx }/sys/ywymSignWebController/list">签约表总表</a></li>
			<%-- <li><a href="${ctx }/sys/ywymSignWebController/list?status=2">待所长审核</a></li>
			<li><a href="${ctx }/sys/ywymSignWebController/list?status=3">待部长审核</a></li>
			<li><a href="${ctx }/sys/ywymSignWebController/list?status=4">待商家确认</a></li>
			<li><a href="${ctx }/sys/ywymSignWebController/list?status=8">待开始</a></li>
			<li><a href="${ctx }/sys/ywymSignWebController/list?status=9">进行中</a></li>
			<li><a href="${ctx }/sys/ywymSignWebController/list?status=10">已结束</a></li> --%>
			<%-- <li><a href="${ctx }/sys/ywymSignWebController/list"></a></li> --%>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymSign" action="${ctx }/sys/ywymSignWebController/list" method="post" class="breadcrumb form-search">
			<ul class="ul-form">
				<li><label>签约类型：</label>
					<select name="" style="width: 200px" id="conType">
							<option value="">请选择</option>
						<c:forEach var="conList" items="${conList }">
							<option value="${conList.id }">${conList.title }</option>
						</c:forEach>
					</select>
				</li>
				
				<%-- <li><label>关联商家：</label>
					<select name="" style="width: 200px" id="shang">
							<option value="">请选择</option>
						<c:forEach var="shangList" items="${shangList }">
							<option value="${shangList.id }">${shangList.shopName }</option>
						</c:forEach>
					</select>
				</li>
				<li><label>关联业务员：</label>
					<select name="" style="width: 200px" id="ye">
							<option value="">请选择</option>
						<c:forEach var="yeList" items="${yeList }">
							<option value="${yeList.id }">${yeList.shopName }</option>
						</c:forEach>
					</select>
				</li> --%>
				<li><label>商家名称：</label>
					<form:input path="userId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>业务员名称：</label>
					<form:input path="adminId" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<%-- <li><label>活动时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>有效时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li> --%>
				<li><label>发起时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="cha" class="btn btn-info" type="submit" value="查询"/></li>
				<li class="btns"><input id="btnSubmit" class="btn btn-success test-out" type="button" value="导出"/></li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="button" onclick="download()" value="下载模板"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		
		<sys:message content="${message }"/>
		<form method="post"  enctype="multipart/form-data" id="myform">
			<input id="importBatch" type="button" value="批量上传" class="btn btn-info" />
			<input type="file" name="file" id="file" /> 
		</form>
		
		<form:form id="contentTableForm" modelAttribute="ywymSign" style="background:none" action="${ctx }/sys/ywymSignWebController/send" method="post" class="breadcrumb form-search">
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<!-- <th><input type="checkbox" id="allbox" /></th> -->
				<th>签约类型</th>
				<th>活动时间</th>
				<th>有效时间</th>
				<!-- <th>费用</th> -->
				<th>关联商家</th>
				<!-- <th>业务员编号</th> -->
				<th>业务员姓名</th>
				<!-- <th>业务员余额</th> -->
				<th>备注</th>
				<th>状态</th>
				<th>创建时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<%-- <td><input type="checkbox" name="aId" value="${entity.id }"/></td> --%>
				<td>${entity.signType }</td>
				<td><fmt:formatDate value="${entity.contractTime}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd"/></td>
				<%-- <td>${entity.total }</td> --%>
				<td>${entity.userId }</td>
				<%-- <td>${entity.adminId }</td> --%>
				<td>${entity.userName }</td>
				<%-- <td>${entity.adminWallet }</td> --%>
				<td>${entity.remark }</td>
				<td>${fnc:getDictLabel(entity.status , 'sign_status' ,'') }</td>
				<td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<%-- <c:if test="${entity.status ne 6 || entity.status ne 7 ||entity.status ne 8 || entity.status ne 9 || entity.status ne 10}">
						<a href="${ctx }/sys/ywymSignWebController/form?id=${entity.id }">修改</a>
						<a href="${ctx }/sys/ywymSignWebController/delete?id=${entity.id }" onclick="return confirm('您确定要删除该项吗？')">删除</a>
					</c:if> --%>
					<c:if test="${entity.status ne 1 }">
						<%-- <a href="${ctx }/sys/ywymSignWebController/byId?id=${entity.id }">查看详情</a> --%>
						<a href="javascript:;" onclick="selectDetails('${entity.id }')" id="seeReport">查看详情</a>
						<a href="javascript:seereport('${entity.id }');" id="seeReport">查看汇报</a>
					</c:if>
					<c:if test="${entity.status eq 10 && entity.sendType ne 1 && (countSys eq 2 || countSys eq 3)}">
						<a href="${ctx }/sys/ywymSignWebController/confirmSend?id=${entity.id }&sendType=1">确定发放</a>
					</c:if>
					<a href="${ctx}/sys/ywymSignWebController/exportLog?id=${entity.id }">导出</a>
					<!-- 审核状态判断 start-->
					<c:if test="${entity.status eq 2 && countSys eq 1 }">
						<a href="${ctx}/sys/ywymSignWebController/save?id=${entity.id }&status=3"  onclick="return confirm('确定操作？')">审核通过</a>
						<a href="javascript:void(0)" id="refuse" userId="${entity.id }">拒绝</a>
					</c:if>
					<c:if test="${(entity.status eq 2 || entity.status eq 3) && (countSys eq 2 || countSys eq 3)}">
						<a href="${ctx}/sys/ywymSignWebController/save?id=${entity.id }&status=4"  onclick="return confirm('确定操作？')">审核通过</a>
						<a href="javascript:void(0)" id="refuse" userId="${entity.id }">拒绝</a>
					</c:if>
					<!-- 审核状态判断 end-->
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form:form>
	<sys:page page="${page }"/>
	<script type="text/javascript">
			function download() {
		        window.location = "${ctx}/static/3.xlsx";
		    }
	  		
		  	$('.test-out').on('click', function(){
				var createDateStart = $('.DateStart').val();
				var createDateEnd = $('.DateEnd').val();
				var status = $('#status').val();
				window.location.href="${ctx}/sys/ywymSignWebController/exportLog?createDateStart="+createDateStart+"&createDateEnd="+createDateEnd;
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
			//批量上传代码
			$("#importBatch").click(function(){
				var formData = new FormData($("#myform")[0]);
				//首先验证文件格式
				
					var fileName = $("#file").val();
					if(fileName  == ""){
						alert("请选择文件先");
						return false;
					}
					var fileType = (fileName.substring(fileName
	                        .lastIndexOf(".") + 1, fileName.length))
	                        .toLowerCase();
	                if (fileType !== 'xls' && fileType !== 'xlsx') {
	                    alert("文件格式不正确,请选择xls或xlsx格式的文件");
	                    return false;
	                }
				
				$.ajax({
					url:"${ctx }/sys/ywymSignWebController/importBatch",
					type:"post",
					data:formData,
					async: false,  
			        cache: false,  
			        contentType: false,  
			        processData: false,  
					success:function(data){
						alert(data.resultData);
						 
					},
					error:function(){
						alert("未知错误请联系开发人员");
						//location.replace(location.href);
					}
				});
				location.reload();
			})
			
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
			$("#cha").click(function(){
				var conId = $("#conType").val();
				var shangId = $("#shang").val();
				var yeId = $("#ye").val();
				var status = getUrlParam('status');
				$.ajax({
					url:"${ctx }/sys/ywymSignWebController/list",
					type:"post",
					data:{
						conId:conId,
						shangId:shangId,
						yeId:yeId,
						status:status
					},
					success:function(data){
						alert(222);
					}
				});
			})
	</script>	
	<script>
  //下载模板
  		
	    
		
  	</script>
  	</body>
</html>
