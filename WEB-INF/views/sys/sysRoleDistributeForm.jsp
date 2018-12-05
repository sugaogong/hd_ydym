<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>系统权限表添加</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="javascript:;">分配权限</a></li>
		</ul>
		<sys:message content="${message }"/>
    	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead class="sys-font">
			<tr>
				<th>所属菜单</th>
				<th>描述</th>
				<!-- <th>权限符号</th>-->
				<!-- <th>创建时间</th>-->
				<!-- <th>更新时间</th>-->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="perm" varStatus="status">
			<tr>
				<td  >
				<c:choose>
					<c:when test="${perm.sysMenu.level eq '2'}">
					<input type="hidden" class="qx_level  qx_level-2"  >
						&nbsp;&nbsp;&nbsp;&nbsp; 
					</c:when>
					<c:when test="${perm.sysMenu.level eq '3'}">
						<input type="hidden" class="qx_level  qx_level-3" >
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${perm.checked eq 'checked' }">
						<input class="qx_check" type="checkbox" name="permId" value="${perm.id }" checked="checked"/>
					</c:when>
					<c:otherwise>
						<input class="qx_check" type="checkbox" name="permId" value="${perm.id }"/>
					</c:otherwise>
				</c:choose>
				&nbsp;${perm.sysMenu.name }
				</td>
				<td>${perm.name }</td>
				<!-- <td>${perm.permission }</td>-->
				<!-- <td><fmt:formatDate value="${perm.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>-->
				<!-- <td><fmt:formatDate value="${perm.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>-->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="form-actions">
		<input id="btnSubmit" class="btn btn-info" type="button" value="保 存"/>&nbsp;
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
	<script type="text/javascript">
	$("#btnSubmit").click(function(){
		var permIds = "";
		$("input[name='permId']:checked").each(function(){
			permIds += $(this).val()+",";
		});
		window.location.href="${ctx }/sys/sysRoleWebController/distributeSave?permIds="+permIds+"&roleId=${sysRole.id}";
	});
	
	var ct_check = function($this){
		$(this).attr("checked",true);
	}
	
	
	var $all_checks;
	//添加分级参数
	function initChecked(){
		$all_checks = $(".qx_check");
		 
		var v1 =0,v2=0,v3=0;
		$all_checks.each(function(index,dom ){
			var $dom = $(dom);
			var _parent =$(this).closest('td');
			var vm = _parent.find('.qx_level');
			if(vm.length){
				//2 3级
				
				//2级
				if(vm.hasClass("qx_level-2")){
					v2++;
					v3 = 1;
					$dom.addClass("LV2");
				}else{
					
					//3级
					$dom.data('v3',v3++ );
					$dom.addClass("LV3");
				}
				
				$dom.data('v2',v2);
				
				  
			}else{
				 
				//1级
				++v1;
				v2=1;
				v3=1;
				$dom.addClass("LV1");
			}
			$dom.data('v1',v1);
			/* console.log($dom.data("v1"),$dom.data("v2"),$dom.data("v3")); */
		});
	}
	
	//添加事件
	$("#contentTable").delegate(':checkbox','click',function(e){
		$this = $(this);
		/* console.log($this.data("v1"),$this.data("v2"),$this.data("v3")); */
	 	//点击1级
	 	var _checked = this.checked; ;
	 	var _v1 = $this.data('v1');
	 	var _v2 = $this.data('v2');
	 	var _v3 = $this.data('v3');
	 	if($this.hasClass('LV1')){
	 		$all_checks.each(function(index,dom){
	 			$dom = $(dom);
	 			if($dom.data('v1')==_v1){
	 				$dom.attr("checked",_checked);
	 			}
	 		});
	 	}else if($this.hasClass('LV2')){
	 		 
		//点击2级
	 		$all_checks.each(function(index,dom){
	 			$dom = $(dom);
	 			if( $dom.data('v1')==_v1 && $dom.data('v2')==_v2 ){
	 				$dom.attr("checked",_checked);
	 			}
	 		});
	 	}else{
	 		
	 		//点击3级
	 		 
	 		var $v2 = $(".LV2").filter(function(index,dom){
	 			var $dom  = $(dom);
 				if($dom.data('v2')  == _v2){
 					return true;
 				}
 				return false;
 			});
	 		
	 		var $v3s = $(".LV3").filter(function(index,dom){
	 			var $dom  = $(dom);
 				if($dom.data('v1')  == _v1 && $dom.data('v2')== _v2   ){
 					return true;
 				}
 				return false;
 			});
	 		 var yes_len=0;
	 		 $v3s.each(function(index,dom){
	 			 if(dom.checked){
	 				 yes_len++;
	 			 }
	 		 })
	 		 
	 		 if(yes_len ==0){
	 			$v2.attr("checked",false);
	 		 }else{
	 			$v2.attr("checked",true);
	 		 }
 
	 		 
	 	}
	 	
		
	});
	
	initChecked();
	
	</script>
  	</body>
</html>
