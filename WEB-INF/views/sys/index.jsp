<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
	    <title>管理后台</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
	    <style>
	    html, body{height:100%;}
	    
	    .clearfix:after{content:"";display:block;height:0;clear:both;visibility:hidden;}
		.clearfix{zoom:1;}
	    div{margin:0;padding:0;position:relative;font-family:微软雅黑;}
	    .div-wrap{width:100%;height:100%;}
	    .div-nav{margin-bottom:10px;}
	    .div-body{width:100%;height:100%;}
	    /* .body-left{width:150px;position:absolute;left:0;top:0; }  */
	    .body-right{position:absolute;left:160px;top:0;}
	    .menu-a,{text-decoration:none !important;text-align:left;font-weight:bold;}
	    .menu-three-div{margin-top:0;}
	    
	    
	    /* 固定导航在顶部  */
	   	.barTop_style{
	   		background: #fff;
	   	}
	   	.barTop_style .navbar-inner{
	   		padding:0 30px;
	   	}
	    .div-body{
	    	position:fixed;
	    	margin-top:54px;
	    }
	    
	    
	    
	    /*二级选项*/
	    .menu-three-a{
	    	display:block;wdith:100%;text-align:center;text-decoration:none !important;
	    	padding:8px 0px;
			color:#000;
			transition: .2s all;
		
		}
		/* .menu-three-a::before{
			content:"";
			display:inline-block;
			width:20px;
			height:20px;
			vertical-align:top;
			background:url(${ctx}/static/sys/img/list-dian.png) center center no-repeat;
			bockground-size:cover;
			
		} */
	    .menu-three-a:hover{
			background:#608833;
			
		}
		.menu-three-a-active{background-color:#608833;color:fff !important;border-radius:2px;}
	    .iframe-body{width:100%;height:100%;overflow:scroll;}
	    .hide{display:none;}
	    .a-logout{float:right;margin-top:10px;}
	    .body-left{width:150px;position:absolute;left:0;top:-10px;bottom:0;background:#444;     
    border-right: 2px solid #eee; padding-top: 10px;} 
	    .body-left a{
	    	color:#fff;
	    }
 		
 		
 		.accordion-group {
 			border-width:0px;
 			border-radius:0px;
 			margin-bottom:0px;
 		}
 		
 		/* 1级别 激活 */
 		.accordion-heading{
 		padding:5px;
 		
 		}
 		.accordion-heading:hover{
 			background: #608833;
 		}
 		.accordion-heading:hover a{
 			color:#fff;
 			padding-left: 40px !important;
 		}
 		.accordion-heading a:hover,.accordion-heading a:focus{
 			text-decoration: none;
 		}
 		.accordion-heading .menu-a{
 			transition: padding .2s;
 			padding-left:30px;
 		}
 		
 		.accordion-heading.active{
 			background: #608833;
 		}
 		.accordion-heading.active  .menu-a{
 			color:#fff; 
 		}
 		 
 		.accordion-group.active{
 		background-color: #858585;
 		}
		.accordion-inner{
			padding:0px;
			border-top-width:0px;
		}
		
		
		 
		 
		 /* 顶部导航 */
		 
		 .navbar .brand{
		 	padding: 0px 20px;
		 	height:50px;
		 	line-height: 50px;
		 /* 	-webkit-box-shadow:   3px 0px 3px rgba(0,0,0,.2);
		 	box-shadow:   3px 0px 3px rgba(0,0,0,.2); */
		 	border-right:1px solid #eee;
		 	margin-right:5px;
		 	font-size: 16px;
		 }
		 .a-logout{
		 	margin-top:15px;
		 }
		 .navbar-inner{
		 	z-index:10;
		 	min-height:50px;
		 	background:none;
		 	border-width:0px;
		 	overflow: hidden;
		 	  box-shadow: 0 1px 8px rgba(0, 0, 0, 0.41);
		 	
		 }
		 .navbar-inner .ksf_logo{
		 	padding:5px 0;
		 	 height:40px;
		 	 vertical-align: top;
		 }
		 
		 .navbar .nav>li>a{
		 	text-shadow: none;
		 	padding:15px 15px 15px;
		 	-webkit-transition:.2s all;
		 	transition:.2s all;
		 }
		 .navbar .nav>li>a:hover{
		 /* 	-webkit-box-shadow:  inset 0 -2px 0px #ff5454; 
		 	box-shadow: inset 0 -2px 0px #ff5454; */
		 	-webkit-box-shadow:  inset 0 -2px 0px #608833;  
		  	box-shadow: inset 0 -2px 0px #608833;
		 	 
		 }
		 .navbar .nav>.active>a, .navbar .nav>.active>a:hover, .navbar .nav>.active>a:focus{
		 	background-color:#fff;
		 	color:#fff;
		  	box-shadow: inset 0 -2px 0px #ff5454;
		 	-webkit-box-shadow:  inset 0 -50px 0px #ff5454;
			box-shadow: inset 0 -2px 0px #608833;
		 	-webkit-box-shadow:  inset 0 -50px 0px #608833;
		 }
	    </style>
  	</head>
	<body>
    	<div class=" div-wrap">
			<div class="navbar div-nav navbar-fixed-top barTop_style">
			  	<div class="navbar-inner">
			  		
					<a class="brand" href="javascript:;">
						<img class="ksf_logo" alt="" src= "">
						 </a>
				    <ul class="nav menu-one-ul">
				    	<!-- <li class="active menu-one-li"><a href="javascript:;">系统设置</a></li>
				      	<li class="menu-one-li"><a href="javascript:;">首页</a></li> -->
				    </ul>
				    <a class="a-logout" href="${ctx }/logout">退出</a>
				    <a class="a-logout" href="javascript:void(0)" style="margin-right: 40px;">欢迎您：${username }</a>
				    <a class="a-logout editPassword" href="javascript:void(0)" style="margin-right: 20px;">修改密码</a>
			  	</div>
			</div>
    		<!-- 主体 -->
	    	<div class="div-body clearfix">
	   			<div class="body-left">
					<div class="accordion" id="menu-left">
					</div>
				</div>
	   			<div class="body-right">
					<iframe class="iframe-body" name="main" frameborder="no" border="0" marginwidth="0" marginheight="0" ></iframe>
				</div>
	    	</div>
    	</div>
	</body>
	<style>
		
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		// 用一个全局数组变量缓存二级菜单
		var menuTwos = [];
		// 设定主体div的宽高自适应
		var rw = $(window).width() - $(".body-left").width();
		var rh = $(window).height() - 70;
		$(".body-right").width(rw-20);
		$(".body-right").height(rh);
		// 一级菜单点击
		$(".menu-one-li").live("click",function(){
			$(".menu-one-li").removeClass("active");
			$(this).addClass("active");
			var index = $(this).index();
			$("#menu-left").html(menuTwos[index]);
		});
		// 三级菜单点击
		$(".menu-three-a").live("click",function(){
			$(".menu-three-a").removeClass("menu-three-a-active");
			$(this).addClass("menu-three-a-active");
		});
		// 异步读取一级菜单		
		$.ajax( {
			url : "${ctx}/ajax/menuAjaxController/findAllList",
			type : "post",
			dataType : "json",
			success : function(data) {
				var menuOneStr = "";
				for(var i=0;i<data.resultData.length;i++){
					var menuTwo = "";
					if(i == 0){
						menuOneStr += "<li title='"+data.resultData[i].id+"' class='active menu-one-li'><a href='javascript:;'>"+data.resultData[i].name+"</a></li>";
					}else{
						menuOneStr += "<li title='"+data.resultData[i].id+"' class='menu-one-li'><a href='javascript:;'>"+data.resultData[i].name+"</a></li>";
					}
					if(data.resultData[i].childList != null && typeof(data.resultData[i].childList) != "undefined" && data.resultData[i].childList.length>0){
						var menuTwoList = data.resultData[i].childList;
						for(var k=0;k<menuTwoList.length;k++){
							/* ------------------- 二级菜单 start ------------------- */
							menuTwo += "<div class='accordion-group menu-two-group "+data.resultData[i].id+"'>";
							menuTwo += "<div class='accordion-heading'>";
							menuTwo += "<a class='accordion-toggle menu-a collapsed' data-toggle='collapse' data-parent='#menu-left' href='#sys-menu-two"+menuTwoList[k].id+"'>"+menuTwoList[k].name+"</a>";
							menuTwo += "</div>";
							menuTwo += "<div id='sys-menu-two"+menuTwoList[k].id+"' class='accordion-body collapse'>";
							menuTwo += "<div class='accordion-inner'>";
							if(menuTwoList[k].childList != null && typeof(menuTwoList[k].childList) != "undefined" && menuTwoList[k].childList.length>0){
								var menuThreeStr = "";
								for(var c=0;c<menuTwoList[k].childList.length;c++){
									var menuThree = menuTwoList[k].childList[c];
									menuThreeStr += "<div class='menu-three-div'><a class='menu-three-a' href='${ctx}"+menuThree.href+"' target='main'>"+menuThree.name+"</a></div>";
								}
								menuTwo += menuThreeStr;
							}
							menuTwo += "</div>";
							menuTwo += "</div>";
							menuTwo += "</div>";
							/* -------------------- 二级菜单 end ------------------- */
						}
					}
					menuTwos.push(menuTwo);	// 把二级菜单放进全部数组变量menuTwo中
				}
				
				$(".menu-one-ul").html(menuOneStr);	// 显示一级菜单
				$("#menu-left").html(menuTwos[0]);	// 显示二级菜单数组menuTwo的第0个
				// 首页默认打开第1个二级菜单的第1个三级菜单
				var href = $("#menu-left .menu-three-a").eq(0).attr("href");
				window.main.location.href=href;
				$("#menu-left .menu-three-a").eq(0).addClass("menu-three-a-active");
				
				
				$(".accordion-heading").live("click",function(event){
					$(".accordion-group").removeClass("active");
					$(".accordion-heading").removeClass("active");
					$(this).closest(".accordion-group").addClass("active");
					$(this).addClass("active");
				});
			},error: function(XMLHttpRequest, textStatus, errorThrown) {
				console.log("error : ${ctx}/ajax/menuAjaxController/findAllList");
            }
		});
		
	});
	 $(".editPassword").live('click',function(){
         openSon();
     });
	 function openSon(){
         layer.open({
             type: 2,
             area: ['30%', '300px'],
             fixed: false, //不固定
             maxmin: true,
             content: '../../sys/indexWebController/goEditPassword'
         });
     }
	</script>
</html>
