<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>巡查统计分析报表</title>
	    <%@ include file="/WEB-INF/views/include/style.jsp"%>
	    <link rel="stylesheet" type="text/css" href="${ctxStatic }/charts/css/userChart.css"/>
	    <script type="text/javascript" src="${ctxStatic }/charts/js/echarts.js"></script>
  	</head>
	<body>
    	<ul class="nav nav-tabs sys-font">
			<li class="active"><a href="">巡查统计分析报表</a></li>
		</ul>
    	<div class="userChartbyForm">
    		<div class="userChartbyFormTop">
    			<div class="userChartbyFormTopLeft fl">
    				<select class="w200" name="buListBy">
    					<option>请选择</option>
    					<option>海珠经销部</option>
    				</select>
    			</div>
    			<div class="userChartbyFormTopRight fr">
    				<ul>
    					<li><span>本周</span></li>
    					<li>|</li>
    					<li><span>本月</span></li>
    					<li>|</li>
    					<li><span>上月</span></li>
    					<li>
							<input name="createDateStart" id="finance_startTime" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="" pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'finance_EndTime\');}'})" /> - 
							<input name="createDateEnd" id="finance_EndTime" type="text" readonly="true" maxlength="20" class="input-medium Wdate" value="" pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'finance_startTime\');}'})" />
    					</li>
    					<li>
    						<button class="btn btn-info" id="dataQuery">筛选</button>
    					</li>
    				</ul>
    			</div>
    		</div>
    		<div class="userChartbyFormMain">
    			<div class="userChartbyFormMenu fl">
    				<a href="javascript:void(0)" class="selected">趋势分析</a>
    				<a href="javascript:void(0)">按组织</a>
    			</div>
    		</div>
    	</div>
    	<div class="dataContainer">
    		<div id="container"></div>
    		<div class="dataTable">
    			<div>
    				<a href="javascript:void(0)" onclick="exportForm()" class="btn btn-info fr" style="margin:0px 15px 15px 0px">导出</a>
    			</div>
    			<table>
    			</table>
    		</div>
   		</div>
  	</body>
  	<script>
  		var dataType = 1; //1 按趋势 2 按组织
  		var ids = GetQueryString("id");
  		var dataTxt = GetQueryString("date");
  		var subordinate = true;
  		if(dataTxt == null || dataTxt == ""){
  			dataTxt = "本周";
  		}
  		if(ids == null || ids == ""){
  			ids = "";
  		}
  		$.ajax({
  			url:"${ctx}/api/data/getBuListByUser",
  			type:"post",
  			async:false,
  			data:{
  				userId:ids,
  			},
  			success:function(data){
  				console.log(data);
  				if(data.resultCode == 0){
  					var txt = new Array();
  					subordinate = data.resultData.type;
  						for(var i in data.resultData.list){
  		  					if(i == 0){
  							 	 txt += '<option value="'+ data.resultData.list[i].id +'" selected>'+ data.resultData.list[i].name +'</option>';
  							 	 $("#s2id_autogen1 .select2-chosen").text(data.resultData.list[i].name);
  		  					}else{
  		  						txt += '<option value="'+ data.resultData.list[i].id +'" >'+ data.resultData.list[i].name +'</option>';
  		  					}
  						}
  						$("select[name=buListBy]").html(txt);
  						for(var x = 0;x < $(".userChartbyFormTopRight li").length; x++){
  							if( dataTxt == $(".userChartbyFormTopRight li").eq(x).find("span").text() ){
  								$(".userChartbyFormTopRight li").removeClass("cur");
  								$(".userChartbyFormTopRight li").eq(x).addClass("cur");
  							}
  						}
  				  		if(chooseDate(dataTxt)){
  				  			$("#finance_startTime").val(chooseDate(dataTxt).startTime);
  				  			$("#finance_EndTime").val(chooseDate(dataTxt).endTime);
  				  			dataQuery();
  				  		}
  				}else{
  					layer.msg(data.resultMessage);
  				}
  			}
  		});
  		//选择日期
  		$(".userChartbyFormTopRight li").click(function(){
  			if($(this).find("span").length < 1){
  				return false;
  			}
  			var text = $(this).find("span").text();
  			$("#finance_startTime").val(chooseDate(text).startTime);
  			$("#finance_EndTime").val(chooseDate(text).endTime);
  			$(".userChartbyFormTopRight li").removeClass("cur");
  			$(this).addClass("cur");
  			dataQuery();
  		});
  		//选择分类
  		$(".userChartbyFormMenu a").click(function(){
  			$(".userChartbyFormMenu a").removeClass("selected");
  			$(this).addClass("selected");
  			var index = $(this).index();
  			if(index == 0){
  				dataType = 1;
  			}else{
  				dataType = 2;
  			}
  			dataQuery();
  		});
  		//筛选
  		$("#dataQuery").click(function(){
  			dataQuery();
  		});
  		
  		function dataQuery(){
  			var beginDate = $("#finance_startTime").val();
  			var endDate = $("#finance_EndTime").val();
  			var userId = $("select[name=buListBy]").find("option:selected").val();
  			if( beginDate == "" || beginDate == null || endDate == "" || endDate == null ){
  				layer.msg("请选择要筛选的日期");
  				return false;
  			}
  			//按趋势
  			if(dataType == 1){
	  			var getUserDataByDateLayer = layer.load(2);
	  			$.ajax({
	  				type:"post",
	  				url:"${ctx}/api/data/getPatrolDataByDate",
	  				data:{
	  					userId:userId,
	  					beginDate:beginDate,
	  					endDate:endDate,
	  				},
	  				success:function(data){
	  					console.log(data);
	  					layer.close(getUserDataByDateLayer);
	  					if(data.resultCode == 0){
	  						var xAxis = []; //totlCount 总注册人数  activCount 激活人数   autoCount 未激活人数
	  						var totlseries = [];
	  						var activseries = [];
	  						var autoseries = [];
	  						var series = new Array();
	  						var txt = new Array();
	  						var activseriesNums = 0,autoseriesNums = 0,totlseriesNums = 0;
	  						txt += '<thead>';
	  						txt += '	<tr>';
  							txt += '		<td></td>';
  							txt += '		<td>已巡次数</td>';
  							txt += '	</tr>';
  							txt += '</thead>';
  							txt += '<tbody>';
	  						for(var i in data.resultData){
	  							xAxis.push(data.resultData[i].createDate.split(" ")[0]);
	  							/* totlseries.push(data.resultData[i].totlCount);
	  							activseries.push(data.resultData[i].activCount); */
	  							autoseries.push(data.resultData[i].comCount);
	  							txt += '<tr>';
	  							txt += '	<td>'+ data.resultData[i].createDate.split(" ")[0] +'</td>';
	  							txt += '	<td>'+ data.resultData[i].comCount +'</td>';
	  							txt += '</tr>'; 
	  							/* activseriesNums = activseriesNums + parseInt(data.resultData[i].activCount);
	  							autoseriesNums = autoseriesNums + parseInt(data.resultData[i].autoCount); */
	  							totlseriesNums = totlseriesNums + parseInt(data.resultData[i].comCount);
	  						}
  						 	txt += '<tr>';
  							txt += '	<td>总计</td>';
  							txt += '	<td>'+ totlseriesNums +'</td>';
  							txt += '</tr>';
	  						txt += '</tbody>';
	  						echartquery(1,xAxis,totlseries,activseries,autoseries);
	  						$(".dataTable table").html(txt);
	  					}else{
	  						layer.msg(data.resultMessage);
	  					}
	  				}
	  			});
  			}else{
  				//按组织
  				var getUserDataByUserLayer = layer.load(2);
	  			$.ajax({
	  				type:"post",
	  				url:"${ctx}/api/data/getPatrolDataByUser",
	  				data:{
	  					userId:userId,
	  					beginDate:beginDate,
	  					endDate:endDate,
	  				},
	  				success:function(data){
	  					console.log(data);
	  					layer.close(getUserDataByUserLayer);
	  					if(data.resultCode == 0){
	  						var xAxis = []; //totlCount 总注册人数  activCount 激活人数   autoCount 未激活人数
	  						var totlseries = new Array();
	  						var activseries = [];
	  						var autoseries = [];
	  						var series = new Array();
	  						var txt = new Array();
	  						var name = $("select[name=buListBy]").find("option:selected").text();
	  						var totlseriesNums = 0,activseriesNums = 0,autoseriesNums = 0;
	  						txt += '<thead>';
	  						txt += '	<tr>';
	  										if(subordinate==true){
  							txt += '		<td>'+ name +'</td>';
	  										}else{
							txt += '		<td></td>';					
	  										}
  							txt += '		<td>已巡次数</td>';
  							txt += '		<td>未巡次数</td>';
  							txt += '		<td>应巡次数</td>';
  							txt += '	</tr>';
  							txt += '</thead>';
  							txt += '<tbody>';
	  						for(var i in data.resultData){
	  							xAxis.push(data.resultData[i].name);
  								var arr = {
  	  									name: data.resultData[i].name,
  	  									value:data.resultData[i].totalCount,
  	  									userDefined: data.resultData[i].id
  		  							}
  								var arr1 = {
  	  									name: data.resultData[i].name,
  	  									value:data.resultData[i].waitCount,
  	  									userDefined: data.resultData[i].id
  		  							}
  								var arr2 = {
  	  									name: data.resultData[i].name,
  	  									value:data.resultData[i].comCount,
  	  									userDefined: data.resultData[i].id
  		  							}
  								totlseries.push(arr);
	  							activseries.push(arr1);
	  							autoseries.push(arr2);
	  							txt += '<tr>';
	  							txt += '	<td>'+ data.resultData[i].name +'</td>';
	  							txt += '	<td>'+ data.resultData[i].comCount +'</td>';
	  							txt += '	<td>'+ data.resultData[i].waitCount +'</td>';
	  							txt += '	<td>'+ data.resultData[i].totalCount +'</td>';
	  							txt += '</tr>';
	  							activseriesNums = activseriesNums + parseInt(data.resultData[i].comCount);
	  							autoseriesNums = autoseriesNums + parseInt(data.resultData[i].waitCount);
	  							totlseriesNums = totlseriesNums + parseInt(data.resultData[i].totalCount);
	  						}
  							txt += '<tr>';
  							txt += '	<td>总计</td>';
  							txt += '	<td>'+ activseriesNums +'</td>';
  							txt += '	<td>'+ autoseriesNums +'</td>';
  							txt += '	<td>'+ totlseriesNums +'</td>';
  							txt += '</tr>';
	  						echartquery(2,xAxis,totlseries,activseries,autoseries);
	  						$(".dataTable table").html(txt);
	  					}else{
	  						layer.msg(data.resultMessage);
	  					}
	  				}
	  			});
  			}
  		}
  		//折线
  		function echartquery(types,xAxis,totlseries,activseries,autoseries){
  			var dom = document.getElementById("container");
  	  		var myChart = echarts.init(dom);
	  		var app = {};
	  		option = null;
	  		if(types == 1){//折线
		  		option = {
		  		    title: {
		  		        text: '巡查统计分析报表'
		  		    },
		  		    tooltip: {
		  		        trigger: 'axis'
		  		    },
		  		    legend: {
		  		    	data:['']
		  		  		//data:['应巡次数','未巡次数','已巡次数']
		  		    },
		  		    grid: {
		  		        left: '3%',
		  		        right: '3%',
		  		        bottom: '3%',
		  		        containLabel: true
		  		    },
		  		    toolbox: {
		  		    	show : true,
		  		    	right: '60',
		  		        feature: {
		  		            saveAsImage: {
		  		            	show: true
		  		            }
		  		        }
		  		    },
		  		    xAxis: {
		  		        type: 'category',
		  		        boundaryGap: false,
		  		     	axisLabel:{
		  		     		rotate:30
		  		     	},
		  		        data: xAxis
		  		    },
		  		    yAxis: {
		  		        type: 'value'
		  		    },
		  		    series: [
		  		        /* {
		  		            name:'应巡次数',
		  		            type:'line',
		  		            data:totlseries
		  		        },
		  		        {
		  		            name:'未巡次数',
		  		            type:'line',
		  		            data:activseries
		  		        }, */
		  		        {
		  		            name:'已巡次数',
		  		            type:'line',
		  		            data:autoseries
		  		        }
		  		    ]
		  		};
	  		}else{
	  			var posList = [
	  			             'left', 'right', 'top', 'bottom',
	  			             'inside',
	  			             'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
	  			             'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
	  			         ];

	  			         app.configParameters = {
	  			             rotate: {
	  			                 min: -90,
	  			                 max: 90
	  			             },
	  			             align: {
	  			                 options: {
	  			                     left: 'left',
	  			                     center: 'center',
	  			                     right: 'right'
	  			                 }
	  			             },
	  			             verticalAlign: {
	  			                 options: {
	  			                     top: 'top',
	  			                     middle: 'middle',
	  			                     bottom: 'bottom'
	  			                 }
	  			             },
	  			             position: {
	  			                 options: echarts.util.reduce(posList, function (map, pos) {
	  			                     map[pos] = pos;
	  			                     return map;
	  			                 }, {})
	  			             },
	  			             distance: {
	  			                 min: 0,
	  			                 max: 100
	  			             }
	  			         };

	  			         app.config = {
	  			             rotate: 90,
	  			             align: 'left',
	  			             verticalAlign: 'middle',
	  			             position: 'insideBottom',
	  			             distance: 15,
	  			             onChange: function () {
	  			                 var labelOption = {
	  			                     normal: {
	  			                         rotate: app.config.rotate,
	  			                         align: app.config.align,
	  			                         verticalAlign: app.config.verticalAlign,
	  			                         position: app.config.position,
	  			                         distance: app.config.distance
	  			                     }
	  			                 };
	  			             }
	  			         };


	  			         var labelOption = {
	  			             normal: {
	  			                 show: true,
	  			                 position: app.config.position,
	  			                 distance: app.config.distance,
	  			                 align: app.config.align,
	  			                 verticalAlign: app.config.verticalAlign,
	  			                 rotate: app.config.rotate,
	  			                 formatter: '{c}  {name|{a}}',
	  			                 fontSize: 16,
	  			                 rich: {
	  			                     name: {
	  			                         textBorderColor: '#fff'
	  			                     }
	  			                 }
	  			             }
	  			         };

	  			         option = {
	  			             color: ['#003366', '#006699', '#4cabce', '#e5323e'],
	  			             tooltip: {
	  			                 trigger: 'axis',
	  			                 axisPointer: {
	  			                     type: 'shadow',
	  			                 }
	  			             },
	  			             legend: {
	  			  		        //data:['应巡次数','未巡次数','已巡次数']
	  			            	data:['应巡次数','未巡次数','已巡次数']
	  			             },
	  			             toolbox: {
	  			                 show: true,
	  			                 right: '60',
	  			                 top: 'top',
	  			                 feature: {
	  			                     mark: {show: true},
	  			                     dataView: {show: true, readOnly: false},
	  			                     magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	  			                     restore: {show: true},
	  			                     saveAsImage: {show: true}
	  			                 }
	  			             },
	  			             calculable: true,
	  			             xAxis: [
	  			                 {
	  			                	triggerEvent:true,
	  			                     type: 'category',
	  			                     axisTick: {show: false},
	  			                     data:xAxis
	  			                 }
	  			             ],
	  			             yAxis: [
	  			                 {
	  			                	triggerEvent:true,
	  			                     type: 'value'
	  			                 }
	  			             ],
	  			             series: [
	  			                  {
	  			                     name: '应巡次数',
	  			                     type: 'bar',
		  			                 label: {
		  			                     normal: {
		  			                         show: true,
		  			                         position: 'top'
		  			                     }
		  			                 },
	  			                     data: totlseries,
	  			                 },
	  			                 {
	  			                     name: '未巡次数',
	  			                     type: 'bar',
		  			                 label: {
		  			                     normal: {
		  			                         show: true,
		  			                         position: 'top'
		  			                     }
		  			                 },
	  			                     data: activseries
	  			                 }, 
	  			                 {
	  			                     name: '已巡次数',
	  			                     type: 'bar',
		  			                   label: {
		  			                     normal: {
		  			                         show: true,
		  			                         position: 'top'
		  			                     }
		  			                 },
	  			                     data:autoseries
	  			                 }
	  			             ]
	  			         };
	  		}
	  		if (option && typeof option === "object") {
	  		    myChart.setOption(option, true);
	  		}
	  		var domain = window.location.href;
	  		myChart.on("click", function (param){  
				if(dataType == 1 || subordinate == false){
					return false;
				}
	  	  		if(domain.indexOf("?id=") == -1){
	  	  			location.href = domain + "?id="+ param.data.userDefined+"&dataType="+dataType+"&date="+$(".userChartbyFormTopRight .cur").find("span").text();  
	  	  		}else{
					location.href = domain.split("?id")[0] + "?id="+ param.data.userDefined+"&dataType="+dataType+"&date="+$(".userChartbyFormTopRight .cur").find("span").text(); 
	  	  		}
            }); 
  		}
  		//导出
  		function exportForm(){
  			var userId = $("select[name=buListBy]").find("option:selected").val();
  			var beginDate = $("#finance_startTime").val();
  			var endDate = $("#finance_EndTime").val();
  			if(dataType == 1){ //日期
  				location.href = "${ctx}/api/data/exportPatrolDataByDate?userId="+ userId + "&beginDate=" + beginDate + "&endDate=" +endDate;
  			}else{ //组织
  				location.href = "${ctx}/api/data/exportPatrolDataByUser?userId="+ userId + "&beginDate=" + beginDate + "&endDate=" +endDate;
  			}
  		}
  		//日期
  		function chooseDate(text){
  			console.log(text)
  			var today = new Date();
  		    var oneday = 1000 * 60 * 60 * 24;
  		    var nowDate= new Date();
  		    //当前日
  		    var nowDay = nowDate.getDate();
  		    //今天是本周的第几天
  		    var nowDayOfWeek= nowDate.getDay();
  		    //当前月
  		    var nowMonth = nowDate.getMonth();
  		    //当前年
  		    var nowYear = nowDate.getFullYear();
  		    //var nowHours = nowDate.getHours();
  		    //var nowMinutes = nowDate.getMinutes();
  		    //var nowSeconds = nowDate.getSeconds();
  		    nowYear += (nowYear < 2000) ? 1900 : 0;
  		    //上月日期
  		    var lastMonthDate = new Date();
  		    lastMonthDate.setDate(1);
  		    console.log(lastMonthDate.setDate(1));
  		    lastMonthDate.setMonth(lastMonthDate.getMonth()-1);
  		    console.log(lastMonthDate.setMonth(lastMonthDate.getMonth()-1));
  		    var lastYear = lastMonthDate.getYear();
  		    console.log(lastYear);
  		    var lastMonth = lastMonthDate.getMonth();
  		    console.log(lastMonth);
  		    var format='yyyy-MM-dd hh:mm:ss';
  		    var begindate;
  			//-----进入循环-------
  		    switch(text)
  		    {
  		    //今天
  		     case '今天':
  		        begindate=new Date();
  		        break;
  		    //昨天
  		    case '昨天':
  		        begindate=new Date(today - oneday);
  		        today=new Date(today - oneday);
  		        break;
  		    //一周
  		     case '本周':
  		        begindate= new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
  		        break;
  		      //上周
  		     case '上周':
  		        begindate= new Date(nowYear, nowMonth, nowDay - nowDayOfWeek -7);
  		        today= new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek - 7));
  		        break;
  		     //本月
  		     case '本月':
  		        begindate= new Date(nowYear, nowMonth, 1);
  		        break;
  		      //上月
  		     case '上月':
  		        begindate= new Date(nowYear, lastMonth+1, 1);
  		        today= new Date(nowYear, lastMonth+1, getMonthDays(lastMonth+1));
  		        break;
  		      //本年
  		     case '本年':
  		        begindate= new Date(nowYear,0, 1);
  		        break;  
  		    if(begindate){
  		        begindate.setHours(0);
  		        begindate.setMinutes(0);
  		        begindate.setSeconds(0);
  		        begindate.setMilliseconds(0);
  		    }
  		    if(today){
  		        today.setHours(23);
  		        today.setMinutes(59);
  		        today.setSeconds(59);
  		        today.setMilliseconds(59);
  		    }
  		    }
  		    var finance_startTime=timeStamp2String(begindate);
  		    var finance_EndTime=timeStamp2String(today);
  		    var data = {
		    		startTime:finance_startTime,
		    		endTime:finance_EndTime,
  		    }
  		    return data;
  		}
  		function getMonthDays(myMonth){ 
  		    var nowDate= new Date();
  		    //当前月
  		    var nowMonth = nowDate.getMonth();
  		    //当前年
  		    var nowYear = nowDate.getFullYear();
  			var monthStartDate = new Date(nowYear, myMonth, 1); 
  			var monthEndDate = new Date(nowYear, myMonth + 1, 1); 
  			var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24); 
  			return days; 
 		} 
  		//---------格式化日期---------
  		function timeStamp2String(time){
  		    var datetime = new Date();
  		    datetime.setTime(time);
  		    var year = datetime.getFullYear();
  		    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
  		    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
  		    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
  		    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
  		    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();

  		    return year + "-" + month + "-" + date;
  		}
  		function GetQueryString(name)
  		{
  	        var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
  	        var result = window.location.search.substr(1).match(reg);
  	        return result?decodeURIComponent(result[2]):null;
  		}
  	</script>
</html>
