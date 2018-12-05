<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>协议合约添加</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
    	<script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymContractWebController/list">协议合约列表</a></li>
			<li class="active"><a href="${ctx }/sys/ywymContractWebController/form">协议合约添加</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymContractWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">图标：</label>
				<div class="controls">
					<sys:img name="icon" value="${entity.icon }" multiSelect="false"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">名称：</label>
				<div class="controls">
					<form:input path="title" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<!-- <div class="control-group groupOuter">
				<div class="groupItem">
					<div class="control-group">
						<label class="control-label">选择分类：</label>
						<div class="controls classify">
							<select></select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">选择品项：</label>
						<div class="controls goods">
							<select>
								<option>请选择</option>
							</select>
						</div>
					</div>
					<div class="control-group control-group-del" style="display: none;">
						<label class="control-label"></label>
						<div class="controls">
							<input class="btn btn-danger" type="button" id="delItem" value="删除">
						</div>
					</div>
				</div>	
			</div>	
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<input class="btn btn-default" type="button" id="addItem" value="添加">
				</div>
			</div> -->
			<div class="control-group">
				<label class="control-label">说明：</label>
				<div class="controls">
					<form:input path="explains" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<%-- <div class="control-group">
				<label class="control-label">活动时间：</label>
				<div class="controls">
					<form:input path="contractTime" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">最后有效期：</label>
				<div class="controls">
					<input name="endTime" type="text" maxlength="20" class="input-medium Wdate " readOnly="true" value="<fmt:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:input path="remark" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>--%>
			<div class="control-group">
				<label class="control-label">协议模板内容：</label>
				<div class="controls">
					<script id="content" name="content" type="text/plain"  style="width:1024px;height:500px;">${entity.content}</script>
				</div>
			</div>
			<div class="form-actions">
				<input type="hidden" name="productId" />
				<input id="btnSubmit" class="btn btn-info" type="submit" value="保 存"  onclick="return check(this.form)" />&nbsp;
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
  	</body>
	<script type="text/javascript">
   		 var ue = UE.getEditor('content');
   		 
   	//加载分类
 		$.ajax({
 			type:"get",
 			url:"${ctx}/api/product/typeList",
 			success:function(data){
 				console.log(data);
 				if(data.resultCode == 0){
 					var txt = new Array();
 					txt += "<select>";
 					txt += "<option value=''>请选择</option>";
 					if(data.resultData.length > 0){
 						for(var i in data.resultData){
 							txt += "<option value='"+ data.resultData[i].id +"'>"+ data.resultData[i].name +"</option>";
 						}
 					}
 					txt += "</select>";
 					$(".classify").html(txt);
 				}else{
 					layer.msg(data.resultMessage);
 				}
 			}
 		});
 		
 		$(".classify select").live("change",function(){
 			goods(this);
 		});
 		
 		$("#addItem").click(function(){
 			var item = $(".groupItem").html();
 			$(".groupOuter").append("<div class='groupItem'>"+ item +"</div>");
 			$(".control-group-del").show();
 		});
 		
 		$("#delItem").live("click",function(){
 			var item = $(this).parents(".groupItem");
 			item.remove();
 			if( $(".groupOuter").find(".groupItem").length < 2 ){
 				$(".control-group-del").hide();
 			}			
 		});
 		
 		function goods(obj){
 			var pitem = $(obj).parents(".groupItem");
 			var typeId = $(obj).find("option:selected").val();
 			$.ajax({
 				type:"get",
 				url:"${ctx}/api/product/activityList?typeId="+typeId+"&page=0&pageSize=999",
 				success:function(data){
 					console.log(data);
 					if(data.resultCode == 0){
 						var txt = new Array();
 						txt += "<select name='goods'>";
 						txt += "<option value=''>请选择</option>";
 						if(data.resultData.list.length > 0){
 							for(var i in data.resultData.list){
 								txt += "<option value='"+ data.resultData.list[i].id +"'>"+ data.resultData.list[i].title +"</option>";
 							}
 						}
 						txt += "</select>";
 						pitem.find(".goods").html(txt);
 					}else{
 						layer.msg(data.resultMessage);
 					}
 				}
 			});
 		}
 		
 		
 		 function check(form) {
 			 var productId = "";
 			 var len = $(".groupOuter").find("select").length;
 			 for(var i = 0 ; i < len ; i++ ){
 				 var v = $(".groupOuter").find("select").eq(i).find("option:selected").val();
 				 
 				 if(v == "" || v == null){
 					 layer.msg("请选择分类/品项");
 					 return false;
 				 }
 			 }
 			 $(".groupOuter").find("select[name=goods]").each(function(e){
 				 productId = productId + $(this).find("option:selected").val() + ",";
 			 })
 			 $("input[name=productId]").val(productId);
 	         return true;
          }
  	</script>
</html>
