<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  	<head>
    	<title>${entity.signType }</title>
    	<%@ include file="/WEB-INF/views/include/style.jsp"%>
    	<link type="text/css" rel="stylesheet" href="${ctx }/static/layer/layer.css">
    	<script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${ctx }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
  	</head>
  	<body>
  		<ul class="nav nav-tabs sys-font">
			<li><a href="${ctx }/sys/ywymSignWebController/list">查看详情</a></li>
		</ul>
		<sys:message content="${message }"/>
  		<form:form id="inputForm" modelAttribute="entity" action="${ctx}/sys/ywymSignWebController/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<div class="control-group">
				<label class="control-label">签名图：</label>
				<div class="controls">
					<img src="${entity.signImg }" width="200px" height="auto">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">协议内容：</label>
				<div class="controls">
					<script id="agreement" name="agreement" type="text/plain"  style="width:1024px;height:500px;">
						${entity.agreement}
					</script>
				</div>
			</div>
		</form:form>
  	</body>
  	
  	<script src="${ctx }/static/layer/layer.js"></script>
		<script type="text/javascript">
  		 var ue = UE.getEditor('agreement');
  		 
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
		
		$("#entityTitle").on('focus',function(){
			console.log("focus");
			openSon();
			
		});
		
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
		
		
		function getValueFromSon(data){
			console.log("getValueFromSon");
			console.log(data);
			$("#signType").val(data.id);
			$("#entityTitle").val(data.entityTitle);
			 
		}
		function openSon(){
			layer.open({
				  type: 2,
				  area: ['80%', '600px'],
				  fixed: false, //不固定
				  maxmin: true,
				  content: '../../sys/ywymContractWebController/list'
				});
		}
		 
		</script>
</html>
