<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户表列表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="${ctx }/sys/ywymUserWebController/list">用户表列表</a></li>
			<li><a href="${ctx }/sys/ywymUserWebController/formAdmin">业务员添加</a></li>
		</ul>
		<form:form id="searchForm" modelAttribute="ywymUser" class="breadcrumb form-search">
			<ul class="ul-form">
				
				<li><label>角色：</label>
					<form:select path="userType" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('userType')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>审核状态：</label>
					<form:select path="autoStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('autoStatus')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>登录状态：</label>
					<form:select path="loginStatus" class="input-large ">
						<form:option value="" label=""/>
						<form:options items="${fnc:getDictList('loginStatus')}"   htmlEscape="false"/>
					</form:select>
				</li>
				<li><label>名称：</label>
					<form:input path="shopName" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>电话：</label>
					<form:input path="phone" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>编号：</label>
					<form:input path="userNo" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>创建时间：</label>
					<input name="createDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateStart" value="<fmt:formatDate value="${cpWater.createDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="createDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate DateEnd" value="<fmt:formatDate value="${cpWater.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li><label>更新时间：</label>
					<input name="updateDateStart" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateStart}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/> - 
					<input name="updateDateEnd" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="<fmt:formatDate value="${ywymAdmin.updateDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</li>
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="button" onclick="queryList()" value="查询"/></li>
				<li class="btns"><input id="btnSubmit" class="btn btn-success test-out" type="button" value="导出"/></li>
				<!-- <li class="btns"><input id="btnSubmit" class="btn btn-info" type="button" onclick="download()" value="下载终端，批发商模板"/></li> -->
				<li class="btns"><input id="btnSubmit" class="btn btn-info" type="button" onclick="downloads()" value="下载业务员，所长，部长模板"/></li>
				<li class="clear"></li>
			</ul>
		</form:form>
		<form action="${ctx }/sys/ywymUserWebController/inputExcel"  method="post" enctype="multipart/form-data" style="float: left; margin-left: 30px; margin-top: -4px;">
			<div class="control-group" id="fileCtrl">
				<label>导入类型：</label>
				<select name="input_type" class="input-large ">
					<!-- <option value="1">导入终端，业务员，批发商</option> -->
					<option value="2">导入业务员，所长，部长</option>
				</select>
				<label class="control-label"></label>
					<input type="file" name="file" id="file"   accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"  onchange="boxsCheck()">
					<input type="submit" value="提交" />
					<a style="color: red; text-decoration: none;">请导入角色相对应文件---注：请导入excel文档</a>
			</div>
		</form>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>编号</th>
				<th>联系人</th>
				<th>身份证</th>
				<th>名称</th>
				<th>电话</th>
				<th>角色</th>
				<!-- <th>余额</th> -->
				<th>所属上阶编号</th>
				<th>所属上阶名称</th>
				<th>所属上级编号</th>
				<th>所属上级名称</th>
				<th>审核状态</th>
				<th>登录状态</th>
				<th>营业部</th>
				<th>创建时间</th>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<!-- page -->
	<div class="pagination">
		<ul>
			<li><a href="javascript:;" onclick="pageClick(0)">上一页</a></li>
			<li class="disabled"><a href="javascript:;" id="curPage">1</a></li>
			<li><a href="javascript:;" onclick="pageClick(1)">下一页</a></li>
			<li class="disabled"><a href="javascript:;">共&nbsp;<span id="totalPage">0</span>&nbsp;页，&nbsp;<span id="total">0</span>&nbsp;条</a></li>
			<li>
				<select style="width:80px" onchange="pageselect(this)">
					<option value="">请选择</option>
					<option value="0">1</option>
				</select>
			</li>
		</ul>
	</div>
	<!-- page end -->
  	</body>
  	<script>
	  	 //下载模板
	    function download() {
	        window.location = "${ctx}/static/1.xlsx";
	    }
	    function downloads() {
	        window.location = "${ctx}/static/2.xlsx";
	    }
  	</script>
  	
  	<script src="${ctx }/static/layer/layer.js"></script>
  	
	<script type="text/javascript">
		$('.test-out').on('click', function(){
			var va = $("#searchForm").serialize();
			window.location.href="${ctx}/sys/ywymUserWebController/exportLog?"+va;
		});
	
	
	
		var page = 0;
		var pageSize = 30;
		var total = 0; //总条数
		var totalPage = 0; //总页数
		allUserList(page);
		function queryList(){
			page = 0;
			allUserList(page);
		}
		function allUserList(page){
			var allUserListLoad = layer.load(2);
			var formData = new FormData($( "#searchForm" )[0]);  
			$.ajax({
				url:"${ctx}/sys/ywymUserWebController/getUserList?page="+page+"&type=99",
				type:"post",
				data: formData,  
	            cache: false,  
	            contentType: false,  
	            processData: false, 
				success:function (data) {
					console.log("===")
					console.log(data)
					console.log("===")
					layer.close(allUserListLoad);
					if(data.resultCode == 0){
			           if(data.resultData.list.length > 0){
			        	   var pageTxt = new Array();
			        	   total = data.resultData.count;
			        	   totalPage = total / 30;
			        	   if( parseFloat(totalPage) > parseInt(totalPage) ){
			        		   totalPage = parseInt(totalPage) + 1;
			        	   }
			        	   for(var i = 0; i < totalPage;i++){
			        		   pageTxt += "<option value="+ i +">"+ (i + 1) +"</option>";
			        	   }
			        	   $(".pagination select").html(pageTxt)
			        	   $("#total").text(total);
			        	   $("#totalPage").text(totalPage);
			        	   var txt = new Array();
			        	   for(var i in data.resultData.list){
			        		   var item = data.resultData.list[i];
			        		   var userType = "",autoStatus = "",loginStatus = "";
			        		   txt += '<tr>';
			        		   txt += '<td>'+ item.userNo +'</td>';
			        		   if(item.name !="" && item.name!=null && item.name!="null"){
			        			   txt += '<td>'+ item.name  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        		   }
			        		   
			        		   if( item.cardNo !="" && item.cardNo!=null  && item.cardNo!="null"){
			        			   txt += '<td>'+ item.cardNo  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        		   }
			        		   
			        		   txt += '<td>'+ item.shopName  +'</td>';
			        		   if( item.phone !="" && item.phone!=null && item.phone!="null"){
			        			   txt += '<td>'+ item.phone  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        		   }
			        		   if(item.userType == 1){
			        			   userType = "商家";
			        		   }else if(item.userType == 2){
			        			   userType = "业务员";
			        		   }else if(item.userType == 3){
			        			   userType = "批发商";
			        		   }else if(item.userType == 4){
			        			   userType = "所长";
			        		   }else if(item.userType == 5){
			        			   userType = "部长";
			        		   }
			        		   txt += '<td>'+  userType +'</td>'; //userType;	//用户类型 1 商家 2 巡查员 3 批发商 4 所长 5 部长
			        		   /* txt += '<td class="wallet">'+ item.wallet  +'</td>'; */
			        		   if( item.adminIdTemp !="" && item.adminIdTemp!=null  && item.adminIdTemp!="null"){
			        			   txt += '<td>'+ item.adminIdTemp  +'</td>';
				        		   txt += '<td>'+ item.adminDistributor  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        			   txt += '<td></td>';
			        		   }
			        		   if( item.adminUserNo !="" && item.adminUserNo!=null  && item.adminUserNo!="null"){
			        			   txt += '<td>'+ item.adminUserNo  +'</td>';
			        			   txt += '<td>'+ item.adminUserName  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        			   txt += '<td></td>';
			        		   }
		        			 
			        		   if(item.autoStatus == 1){
			        			   autoStatus = "审核中";
			        		   }else if(item.autoStatus == 2){
			        			   autoStatus = "已通过";
			        		   }else if(item.autoStatus == 3){
			        			   autoStatus = "审核失败";
			        		   }
			        		   txt += '<td>'+ autoStatus +'</td>';//autoStatus;	//审核状态 1 审核中 2 已通过 3 审核失败
			        		   if(item.loginStatus == 1){
			        			   loginStatus = "正常";
			        		   }else if(item.loginStatus == 2){
			        			   loginStatus = "禁用";
			        		   }
			        		   txt += '<td>'+ loginStatus +'</td>'; //loginStatus;	//登录状态 1 正常 2 禁用
			        		   
			        		   if( item.region !="" && item.region!=null && item.region!="null"){
			        			   txt += '<td>'+ item.region  +'</td>';
			        		   }else{
			        			   txt += '<td></td>';
			        		   }
			        		   txt += '<td>'+ item.createDate +'</td>';
			        		   txt += '<td>';
			        		   if(item.userType == 1){
			        		   txt += '		<a href="${ctx}/sys/ywymUserWebController/form?id='+ item.id  +'">修改</a>';
			        		   }else{
			        		   txt += '		<a href="${ctx}/sys/ywymUserWebController/formAdmin?id='+ item.id  +'">修改</a>';
			        		   }
			        		   txt += '	<a href="${ctx}/sys/ywymUserWebController/delete?id='+ item.id  +'" onclick=return confirm("您确定要删除该用户及全部记录吗？")>删除</a>';
			        		   if(item.userType == 1){
			        		   txt += '		<a href="javascript:void(0)" class="ruzhu" data-id="'+ item.id  +'">绑定批发商或业代</a>';
			        		   }
			        		   /* txt += '		<a href="javascript:void(0)" class="setWallet" data-id="'+ item.id  +'">设置余额</a>'; */
			        		   txt += '</td>';
			        		   txt += '</tr>' ;
			        	   } 
			        	   $("#curPage").text( parseInt(page) + 1 );
			        	   $("#contentTable tbody").html(txt);
			           }else{
			        	   $("#contentTable tbody").html("");
			           }
                    }else{
					    layer.msg(data.resultMessage);
                    }
                }
			});
		}
	
		function pageClick(type){
			if(type == 0){
				if(page > 0){
					page--;
					allUserList(page);
				}
			}else{
				page++;
				allUserList(page);
			}
		}
		$(".setWallet").live("click",function(){
			var id = $(this).attr("data-id");
			var obj = $(this);
			layer.prompt({title: '设置余额'}, function(wallet, index){
			  layer.close(index);
			  $.ajax({
					url:"${ctx}/sys/ywymUserWebController/setWallet",
					type:"post",
					data:{wallet:wallet , userId:id},
					success:function (data) {
						if(data.resultCode == 0){
				            layer.msg("设置成功");
				            obj.parents("tr").find(".wallet").text(data.resultData);
	                    }else{
						    layer.msg(data.resultMessage);
	                    }
	                }
				});
			});
		})
		function pageselect(obj){
			page = $(obj).find("option:selected").val();
			allUserList(page);
		}
		
        var id = "";
            $(".ruzhu").live('click',function(){
            console.log("focus");
            id = $(this).attr("data-id");
            openSon();

        });
        function getValueFromSon(data){
            console.log("getValueFromSon");
            console.log(data);
           var userId = data.id;
            $.ajax({
				url:"${ctx}/sys/ywymUserWebController/bindingUser",
				type:"post",
				data:{userId:userId , id:id},
				success:function (data) {
					if(data.resultCode == 0){
			            layer.msg("绑定成功");
			            setTimeout(function(){
			            	window.location.reload();	
			            }, 800);
                    }else{
					    layer.msg(data.resultMessage);
                    }
                }
			});

        }
        function openSon(){
            layer.open({
                type: 2,
                area: ['80%', '600px'],
                fixed: false, //不固定
                maxmin: true,
                content: '../../sys/ywymUserWebController/listView'
            });
        }

	</script>
</html>
