var app = "232dce8d8ab44e778e3342442d2fe6f5";
var myApp = angular.module('myApp',['ionic','ionic-native-transitions','ngWaterfall']);
	myApp.run(function($ionicPlatform) {
		$ionicPlatform.ready(function() {
	      	// Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
	      	// for form inputs)
	      	if(window.cordova && window.cordova.plugins.Keyboard) {
	        	cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
	      	}
	      	if(window.StatusBar) {
	        	StatusBar.styleDefault();
	      	}
		});
	});
	myApp.directive('showTabs', function ($rootScope) {
	  return {
	    restrict: 'A',
	    link: function ($scope, $el) {
	      $rootScope.hideTabs = false;
	    }
	  };
	});
	myApp.directive('hideTabs', function ($rootScope) {
	  return {
	    restrict: 'A',
	    link: function ($scope, $el) {
	      $rootScope.hideTabs = true;
	    }
	  };
	});
	myApp.filter('to_trusted', ['$sce', function ($sce) {
		return function (text) {
		    return $sce.trustAsHtml(text);
		};
	}]);
	myApp.config(function($stateProvider, $urlRouterProvider,$httpProvider,$ionicNativeTransitionsProvider) {
		$ionicNativeTransitionsProvider.setDefaultOptions({
	        duration: 400, // in milliseconds (ms), default 400,
	        slowdownfactor: 4, // overlap views (higher number is more) or no overlap (1), default 4
	        iosdelay: -1, // ms to wait for the iOS webview to update before animation kicks in, default -1
	        androiddelay: -1, // same as above but for Android, default -1
	        winphonedelay: -1, // same as above but for Windows Phone, default -1,
	        fixedPixelsTop: 0, // the number of pixels of your fixed header, default 0 (iOS and Android)
	        fixedPixelsBottom: 0, // the number of pixels of your fixed footer (f.i. a tab bar), default 0 (iOS and Android)
	        triggerTransitionEvent: '$ionicView.afterEnter', // internal ionic-native-transitions option
	        backInOppositeDirection: false // Takes over default back transition and state back transition to use the opposite direction transition to go back
	    });
		$httpProvider.defaults.transformRequest = function(obj){ 
		     var str = [];  
		     for(var p in obj){
		         str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));  
		     }
		     return str.join("&");  
	   };
	   $httpProvider.defaults.headers.post = {  
	        'Content-Type': 'application/x-www-form-urlencoded'  
	   };
	  	$stateProvider
	  	.state('login', {  //登录
		    url: '/login',
		    cache: false,
		    templateUrl: 'view/login/login.html',
			controller: 'loginCtrl',
	  	})
	  	.state('retrievepas', {  //找回密码
		    url: '/retrievepas',
		    cache: false,
		    templateUrl: 'view/login/retrievepassword.html',
			controller: 'retrievepasCtrl',
	  	})
	  	.state('resetpassword', {  //重置密码
		    url: '/resetpassword',
		    cache: false,
		    templateUrl: 'view/login/resetpassword.html',
			controller: 'resetpasswordCtrl',
	  	})
	  	.state('register', {  //注册
		    url: '/register',
		    cache: false,
		    templateUrl: 'view/login/register.html',
			controller: 'registerCtrl',
	  	})
	  	.state('index', {  //首页
		    url: '/index',
		    cache: false,
		    templateUrl: 'view/index/index.html',
			controller: 'IndexCtrl',
	  	})
	  	.state('contractdetail', {  //签约详情
		    url: '/contractdetail',
		    cache: false,
		    templateUrl: 'view/index/contractdetail.html',
			controller: 'contractdetailCtrl',
	  	})
	  	.state('userCenter', {  //我的 
		    url: '/userCenter',
		    cache: false,
		    templateUrl: 'view/home/index.html',
			controller: 'userCenterCtrl',
	  	})
	  	.state('personaldata', {  //个人资料 
		    url: '/personaldata',
		    cache: false,
		    templateUrl: 'view/home/personaldata.html',
			controller: 'personaldataCtrl',
	  	})
	  	.state('salesman', {  //业务员详情 
		    url: '/salesman',
		    cache: false,
		    templateUrl: 'view/home/salesman.html',
			controller: 'salesmanCtrl',
	  	})
	  	.state('myContract', {  //我的签约 
		    url: '/myContract',
		    cache: false,
		    templateUrl: 'view/contract/list.html',
			controller: 'myContractCtrl',
	  	})
	  	.state('myContractDetail', {  //我的签约详情
		    url: '/myContractDetail',
		    cache: false,
		    templateUrl: 'view/contract/myContractDetail.html',
			controller: 'myContractDetailCtrl',
	  	})
	  	.state('signAgreement', {  //协议详情
		    url: '/signAgreement',
		    cache: false,
		    templateUrl: 'view/contract/Agreement.html',
			controller: 'signAgreementCtrl',
	  	})
	  	.state('contractAgreement', {  //合同签署
		    url: '/contractAgreement',
		    cache: false,
		    templateUrl: 'view/contract/contractAgreement.html',
			controller: 'contractAgreementCtrl',
	  	})
	  	.state('brand', {  //品牌
		    url: '/brand',
		    cache: false,
		    templateUrl: 'view/brand/index.html',
			controller: 'brandCtrl',
	  	})
	  	.state('brandDesc', {  //品牌详情
		    url: '/brandDesc',
		    cache: false,
		    templateUrl: 'view/brand/desc.html',
			controller: 'brandDescCtrl',
	  	})
	  	.state('myCardVoucher', {  //我的卡券
		    url: '/myCardVoucher',
		    cache: false,
		    templateUrl: 'view/card/index.html',
			controller: 'myCardVoucherCtrl',
	  	})
	  	.state('myCardVoucherCode', {  //卡券二维码
		    url: '/myCardVoucherCode',
		    cache: false,
		    templateUrl: 'view/card/code.html',
			controller: 'myCardVoucherCodeCtrl',
	  	})
	  	.state('order', {  //我的订单
		    url: '/order',
		    cache: false,
		    templateUrl: 'view/order/index.html',
			controller: 'orderCtrl',
	  	})
	  	.state('orderDateil', {  //订单详情
		    url: '/orderDateil',
		    cache: false,
		    templateUrl: 'view/order/dateil.html',
			controller: 'orderDateilCtrl',
	  	})
	  	.state('activity', {  //活动
		    url: '/activity',
		    cache: false,
		    templateUrl: 'view/activity/index.html',
			controller: 'activityCtrl',
	  	})
	  	.state('activityDetail', {  //活动详情
		    url: '/activityDetail',
		    cache: false,
		    templateUrl: 'view/activity/activityDetail.html',
			controller: 'activityDetailCtrl',
	  	})
	  	 .state('consummate', {  //注册
		    url: '/consummate',
		    cache: false,
		    templateUrl: 'view/login/consummate.html',
			controller: 'consummateCtrl',
	  	})
	  	$urlRouterProvider.otherwise('/brand'); 
	});

	myApp.controller('consummateCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 0;
		$scope.userId = $location.search().userId;
		$scope.mapHeight = $window.innerHeight - 46 - 52 - 46;
		$scope.province = ""; //省份
		$scope.city = ""; //城市
		$scope.district = ""; //区县
		$scope.address = ""; //详细地址
		$scope.lat = "";
		$scope.lng = "";
		$scope.identityCard = "";
		$scope.curprovince = ""; //省
		$scope.curcity = ""; //城市
		$scope.curdistrict = ""; //区县
		$scope.curaddress = ""; //详细地址
		$scope.curlat = "";
		$scope.curlng = "";
		$scope.curidentityCard = "";
		$scope.timer = 60;
		$scope.sendLoad = true;
	    
	    //发送验证码
		$scope.sendCode = function($event){
			if($scope.sendLoad == false){
				return false;
			}
			$scope.sendLoad = false;
			var obj = $(event.target);
			if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
			if(!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test($scope.phone))){
				layer.msg("请输入正确手机号码");
				return false;
			}
			$scope.sendCodeLayer = layer.load(2);
			$http({
				method:"post",
				url:"../api/login/sendCode",
				data:{
					types:1,
					phone:$scope.phone,
				}
			}).success(function(data){
				layer.close($scope.sendCodeLayer);
				if(data.resultCode == 0){
					var sendCodeTimer = setInterval(function(){
						if($scope.timer > 0){
							obj.text($scope.timer+"s");
							$scope.timer--;
						}else{
							obj.text("验证码");
							$scope.timer = 60;
							clearInterval(sendCodeTimer);
							$scope.sendLoad = true;
						}
					},1000);
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	    
	    
	    $scope.chooseMap = function(){
			$scope.province = $scope.curprovince;
			$scope.city = $scope.curcity;
			$scope.district = $scope.curdistrict
			$scope.address = $scope.curaddress;
			$scope.lat = $scope.curlat;
			$scope.lng = $scope.curlng;
			$("#mapAddress").text($scope.address);
			$("#openMap").text($scope.address);
	        $("#map").hide();
	    }
	    $scope.cancelMap = function(){
	        $("#map").hide();
	    }
	    $scope.openMap = function($event){
	    	AMapUI.loadUI(['misc/PositionPicker'], function(PositionPicker) {
		        //地图加载
			    var map = new AMap.Map("mapContainer", {
			        resizeEnable: true,
		       		center: [113.263471,23.123915],
		    		zoom: 13,
		            scrollWheel: false
			    });
			    //输入提示
			    var autoOptions = {
			        input: "tipinput"
			    };
			    var auto = new AMap.Autocomplete(autoOptions);
			    var placeSearch = new AMap.PlaceSearch({
			        map: map,
			    });  
			    //构造地点查询类
			    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
			    function select(e) {
			        placeSearch.setCity(e.poi.adcode);
			        placeSearch.search(e.poi.name);  //关键字查询查询
			    }
		        var positionPicker = new PositionPicker({
		            mode: 'dragMap',
		            map: map
		        });
		        
		    	positionPicker.on('success', function(positionResult) {
					$scope.curprovince = positionResult.regeocode.addressComponent.province; //省份
					$scope.curcity = positionResult.regeocode.addressComponent.city; //城市
					$scope.curdistrict = positionResult.regeocode.addressComponent.district; //区县
					$scope.curaddress = positionResult.address; //详细地址
					$scope.curlat = positionResult.position.lat;
					$scope.curlng = positionResult.position.lng;
					$("#mapAddress").text($scope.curaddress);
	        });
		        positionPicker.on('fail', function(positionResult) {
		            layer.msg('系统繁忙,请稍后再试');
		        });
		        positionPicker.start(map.getBounds().getSouthWest());
		        map.panBy(0, 1);
		
		        map.addControl(new AMap.ToolBar({
		            liteStyle: true
		        }));
		    });
	    	$("#map").show();
	    }
	    //注册
	    
	    $scope.registerSubmit = function(){
	    	if($scope.shopName == null || $scope.shopName == ""){
				layer.msg("请输入店铺名称");
				return false;
			}
	    	if($("input[name=identityCard]").val() == null || $("input[name=identityCard]").val() == ""){
				layer.msg("请上传身份证照片");
				return false;
			}
	    	if($scope.cardNo == null || $scope.cardNo == ""){
				layer.msg("请输入身份证号码");
				return false;
			}
	    	if($scope.name == null || $scope.name == ""){
				layer.msg("请输入身份证姓名");
				return false;
			}
	    	if($("input[name=businessImg]").val() == null || $("input[name=businessImg]").val() == ""){
				layer.msg("请上传营业执照");
				return false;
			}
	    	if($scope.address == null || $scope.address == ""){
				layer.msg("请输入店铺地址");
				return false;
			}
	    	if($scope.password == null || $scope.password == ""){
				layer.msg("请输入登录密码");
				return false;
			}
	    	if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
	    	if($scope.code == null || $scope.code == ""){
				layer.msg("请输入手机验证码");
				return false;
			}
	    	if($(".itemImgs").eq(0).find("img").attr("src") == null || $(".itemImgs").eq(0).find("img").attr("src") == ""){
				layer.msg("请上传店铺照片");
				return false;
			}
	    	
			$("input[name=password]").val(hex_sha1($scope.password));
	    	
	    	
	    	
			var formData = new FormData($( "#registerInput" )[0]);  
			//register(formData);
	var firstLayer = layer.load(2);
	$.ajax({
	    url:"../api/login/firstRegister",
        type: 'POST',  
        data: formData,  
        async: false,  
        cache: false,  
        contentType: false,  
        processData: false,  
		success:function(data){
			layer.close(firstLayer);
			console.log(data);
			if(data.resultCode == 0){
				layer.msg("提交成功,请前往首页登录!");
				setTimeout(function(){
					location.href = "#login";
				},2000);
			}else{
				layer.msg(data.resultMessage);
			}
		}
	});
	    }
	});
	//活动详情
	myApp.controller('activityDetailCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			//location.href = "#login";
		}
		$scope.id = $location.search().id;
		$scope.activityLayer = layer.load(2);
		$scope.activityData = new Array();
		$http({
			method:"get",
			url:"../api/index/getActivity?activityId="+$scope.id,
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				$scope.activityData = data.resultData;
			}else{
				layer.msg(data.resultMessage);
			}
		});
		layer.close($scope.activityLayer);
	});
	//活动
	myApp.controller('activityCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.menu = 2;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			//location.href = "#login";
		}
		$scope.imgs = new Array();
		$scope.hotList = new Array();
		$scope.activityLayer = layer.load(2);
		$http({
			method:"get",
			url:"../api/index/advList"
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				if(data.resultData != null && data.resultData != ""){
					for (var i in data.resultData) {
						$scope.imgs.push(data.resultData[i].imgs);
					}
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//获取热门活动
		$http({
			method:"get",
			url:"../api/index/activityList?hot=2&page=0",//热门 1 否 2是
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				for (var i in data.resultData.list) {
					$scope.hotList.push(data.resultData.list[i]);
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
		$scope.moreDataCanBeLoaded = true;
		$scope.signLoad = true;
		$scope.page = 0;
		$scope.signData = new Array();
		//获取全部活动
		$scope.signList = function(page){
			if($scope.signLoad == false){
				return false;
			}
			$scope.signLoad = false;
			$http({
				method:"get",
				url:"../api/index/activityList?hot=1&page="+page,//热门 1 否 2是
			}).success(function(data){
				console.log(data);
				$scope.moreDataCanBeLoaded = false;
				if(data.resultCode == 0){
					if(data.resultData != null && data.resultData != "" && data.resultData != " "){
						if(data.resultData.list.length > 0){
							for(var i in data.resultData.list){
								$scope.signData.push(data.resultData.list[i]);
							}
							$scope.signLoad = true;
							$scope.moreDataCanBeLoaded = true;
							$scope.page++;
							$scope.$broadcast('scroll.infiniteScrollComplete');
						}else{
							$scope.nodata = "暂无数据.";
						}
					}
					$(".cardItem input").prop("checked",false);
					$("#all").prop("checked",false);
					$scope.allChecked = false;
					$scope.total = 0;
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.signList($scope.page);
		$scope.loadMore = function(){
			$scope.signList($scope.page);
		}
		layer.close($scope.activityLayer);
	});
	//订单详情
	myApp.controller('orderDateilCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.total = 0;
		$scope.id = $location.search().id;
		$scope.getOrder = new Array();
		$scope.orderDetailLoad = layer.load(2);
		$http({
			method:"post",
			url:"../api/order/getOrderId",
			data:{
				orderId:$scope.id,
				userId:$scope.userId,
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.orderDetailLoad);
			if(data.resultCode == 0){
				$scope.getOrder = data.resultData;
			}else{
				layer.msg(data.resultMessage);
			}
		});
	});
	//我的订单
	myApp.controller('orderCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.menu = 5;
		$scope.menuIndex = 0;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.page = 0;
		$scope.status = 0;
		$scope.signData = new Array();
		$scope.signLoad = true;
		$scope.moreDataCanBeLoaded = true;
		$scope.allChecked = false;
		$scope.total = 0;
		//签约列表
		$scope.signList = function(page,status){
			if($scope.signLoad == false){
				return false;
			}
			$scope.signLoad = false;
			if(page == 0){
				$scope.signLayer = layer.load(2);
			}
			$http({
				method:"post",
				url:"../api/order/findOrderStatus",
				data:{
					userId:$scope.userId,
					status:status,// -1待支付 0全部 1待确认 2 待发货 3 待收货 4 已完成 5 已取消	
					page:page
				}
			}).success(function(data){
				console.log(data);
				if(page == 0){
					layer.close($scope.signLayer);
				}
				$scope.moreDataCanBeLoaded = false;
				if(data.resultCode == 0){
					if(data.resultData != null && data.resultData != "" && data.resultData != " "){
						if(data.resultData.list.length > 0){
							for(var i in data.resultData.list){
								$scope.signData.push(data.resultData.list[i]);
							}
							$scope.signLoad = true;
							$scope.moreDataCanBeLoaded = true;
							$scope.page++;
							$scope.$broadcast('scroll.infiniteScrollComplete');
						}else{
							$scope.nodata = "暂无数据.";
						}
					}
					$(".cardItem input").prop("checked",false);
					$("#all").prop("checked",false);
					$scope.allChecked = false;
					$scope.total = 0;
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.signList($scope.page, $scope.status);
		$scope.loadMore = function(){
			$scope.signList($scope.page, $scope.status);
		}
		//menu
		$scope.contractMenu = function(index,status){
			$scope.menuIndex = index;
			$scope.status = status;
			$scope.signLoad = true;
			$scope.moreDataCanBeLoaded = true;
			$scope.signData = new Array();
			$scope.page = 0;
			$ionicScrollDelegate.scrollTop();
			$scope.signList($scope.page, $scope.status);
		}
	});
	//卡券二维码
	myApp.controller('myCardVoucherCodeCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$scope.ids = $location.search().ids;
		$("#qrCode").qrcode($scope.ids)
	});

	//我的卡券
	myApp.controller('myCardVoucherCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.nodata = "正在加载中...";
		$scope.menuIndex = 0;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.hei = $window.innerHeight - 58;
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.page = 0;
		$scope.status = 0;
		$scope.signData = new Array();
		$scope.signLoad = true;
		$scope.moreDataCanBeLoaded = true;
		$scope.allChecked = false;
		$scope.total = 0;
		//签约列表
		$scope.signList = function(page,status){
			if($scope.signLoad == false){
				return false;
			}
			$scope.signLoad = false;
			if(page == 0){
				$scope.signLayer = layer.load(2);
			}
			$http({
				method:"post",
				url:"../api/code/codeList",
				data:{
					shopId:$scope.userId,
					status:status,//0未兑换 1已兑换 2已核销
				}
			}).success(function(data){
				console.log(data);
				if(page == 0){
					layer.close($scope.signLayer);
				}
				$scope.moreDataCanBeLoaded = false;
				if(data.resultCode == 0){
					if(data.resultData != null && data.resultData != "" && data.resultData != " "){
						if(data.resultData.list.length > 0){
							for(var i in data.resultData.list){
								if(data.resultData.list[i].img.indexOf(",") != -1){
									data.resultData.list[i].img = data.resultData.list[i].img.split(",")[0]
								}
								$scope.signData.push(data.resultData.list[i]);
							}
							$scope.signLoad = true;
							$scope.moreDataCanBeLoaded = true;
							$scope.page++;
							$scope.$broadcast('scroll.infiniteScrollComplete');
						}else{
							$scope.nodata = "暂无数据.";
						}
					}
					$(".cardItem input").prop("checked",false);
					$("#all").prop("checked",false);
					$scope.allChecked = false;
					$scope.total = 0;
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.signList($scope.page, $scope.status);
		$scope.loadMore = function(){
			$scope.signList($scope.page, $scope.status);
		}
		//menu
		$scope.contractMenu = function(index,status){
			$scope.menuIndex = index;
			$scope.status = status;
			$scope.signLoad = true;
			$scope.moreDataCanBeLoaded = true;
			$scope.signData = new Array();
			$scope.page = 0;
			$ionicScrollDelegate.scrollTop();
			$scope.signList($scope.page, $scope.status);
		}
		$scope.allCheckbox = function($event){
			$scope.total = 0;
			if( $(event.target).is(":checked") ){
				$(".cardItem input[type=checkbox]").prop("checked",true);
			$(".cardItem").each(function(i){
				if($(".cardItem").eq(i).find("input[type=checkbox]").is(":checked")){
					$scope.total = $scope.total + parseInt($(".cardItem").eq(i).find("input[type=checkbox]:checked").attr("data-nums"));
				}
			})
			}else{
				$(".cardItem input[type=checkbox]").prop("checked",false);
				$scope.total = 0;
			}
		}
		$scope.changeCheckbox = function($event){
			$scope.total = 0;
			if( $(event.target).is(":checked") ){
				if( $(".cardItem input[type=checkbox]:checked").length == $(".cardItem").length){
					$("#all").prop("checked",true);
				}else{
					$("#all").prop("checked",false);
				}
			}else{
				$("#all").prop("checked",false);
			}
			$(".cardItem").each(function(i){
				if($(".cardItem").eq(i).find("input[type=checkbox]").is(":checked")){
					$scope.total = $scope.total + parseInt($(".cardItem").eq(i).find("input[type=checkbox]:checked").attr("data-nums"));
				}
			})
		}
		//批量
		$scope.exchangeCard = function(){
			$scope.cardIds = "";
			if( $(".cardItem input[type=checkbox]:checked").length < 1){
				layer.msg("请选择要兑换的卡券");
				return false;
			}
			for(var i = 0; i < $(".cardItem input[type=checkbox]:checked").length;i++){
				$scope.cardIds = $scope.cardIds + $(".cardItem input[type=checkbox]:checked").eq(i).val() + ",";
			}
			console.log($scope.cardIds)
			$scope.exchangeCodeLoad = layer.load(2);
			$http({
				method:"post",
				url:"../api/code/exchangeCode",
				data:{
					id:$scope.cardIds,
					userId:$scope.userId,
				}
			}).success(function(data){
				console.log(data);
				layer.close($scope.exchangeCodeLoad);
				if(data.resultCode == 0){
					location.href = "#order";
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	});
	//品牌详情
	myApp.controller('brandDescCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.menu = 1;
		$scope.menuIndex = 0;
		$scope.brandMenu = new Array();
		$scope.brandData = new Array();
		$scope.pid = $location.search().id;
		$scope.typeId = "";
		$scope.brandItm = layer.load(2);
		$scope.imgs = [];
		$http({
			method:"get",
			async:false,
			url:"../api/index/brandItemTypeList?pid="+$scope.pid,
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				if(data.resultData != null && data.resultData != ""){
					for(var i in data.resultData){
						if(i == 0){
							$scope.typeId = data.resultData[0].id;
						}
						$scope.brandMenu.push(data.resultData[i]);
					}
					$scope.getbrandType($scope.typeId)
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//获取品牌详情
		$scope.getbrandType = function(typeId){
			$http({
				method:"get",
				url:"../api/index/getbrandType?typeId="+typeId,
			}).success(function(data){
				console.log(data);
				layer.closeAll();
				if(data.resultCode == 0){
					if(data.resultData.img.indexOf(",") == -1){
						$scope.imgs.push(data.resultData.img);
					}else{
						for(var x = 0; x < data.resultData.img.split(",").length;x++){
							$scope.imgs.push(data.resultData.img.split(",")[x]);
						}
					}
					$scope.brandData = data.resultData;
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	});
	//品牌
	myApp.controller('brandCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.menu = 1;
		$scope.brandList = new Array();
		$scope.brandLoad = layer.load(2);
		$http({
			method:"get",
			url:"../api/index/brandTypeList",
		}).success(function(data){
			console.log(data);
			layer.close($scope.brandLoad);
			if(data.resultCode == 0){
				if(data.resultData != null && data.resultData != ""){
					for(var i in data.resultData){
						$scope.brandList.push(data.resultData[i]);
					}
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
	});
	//合同签署
	myApp.controller('contractAgreementCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.AgreementSign = 0;
		$scope.signImg = "";
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		
		$scope.id = $location.search().id;
		$scope.data = new Array();
		$scope.imgs = [];
		$scope.getSign = layer.load(2);
		$http({
			method:"post",
			url:"../api/business/getSign",
			data:{
				signId:$scope.id
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.getSign);
			if(data.resultCode == 0){
				$scope.data = data.resultData;
			}else{
				layer.msg(data.resultMessage);
			}
		});
		$scope.openAgreementSign = function(){
			$(".contractDescMask").show();
		}
		$scope.closeAgreementSign = function(){
			$(".contractDescMask").hide();
		}
		var canvas = document.getElementById('canvas');
	 	var ctx = canvas.getContext('2d');
	 	canvas.addEventListener('touchstart', function (ev) {
		 	var h = $(".contractDescMaskOuter").position().top;
		 	var l = $(".contractDescMaskOuter").offset().left;
		 	console.log(l)
		 	ev.preventDefault();
		 	ctx.beginPath();
		 	ctx.strokeStyle = 'red';
		 	ctx.lineWidth="4";
		 	var ev = ev.touches[0] || window.event.touches[0];
		 	ctx.moveTo(ev.clientX-canvas.offsetLeft - l,ev.clientY-canvas.offsetTop-h);
		 	canvas.addEventListener('touchmove',function (ev) {
			 	var ev = ev.touches[0] || window.event.touches[0];
			 	ctx.lineTo(ev.clientX-canvas.offsetLeft - l,ev.clientY-canvas.offsetTop-h);
			 	ctx.stroke();
		 	});
	 	});
	 	$scope.clearCanvas = function(){
	 		canvas.width = canvas.width;
	 	}
	 	$scope.submitCanvas = function(){
	 		$scope.signImg = canvas.toDataURL("image/png");
	 		$('#qmimg').attr("src",canvas.toDataURL("image/png"));
	 		$(".contractDescMask").hide();
	 		$scope.AgreementSign = 1;
	 	}
	 	$scope.submissionAudit = function(){
	 		$scope.UpdateSignLayer = layer.load(2);
	 		$http({
			    url:"../api/business/businessUpdateSignWX",
		        method: 'POST',  
		        headers: {'Content-Type': undefined},
		        transformRequest: function(data) {
		            var formData = new FormData();
					formData.append('signId', $scope.id);
					formData.append('status', 6);
					formData.append('userId', $scope.userId);
					formData.append('reason', $scope.reason);
					formData.append('signImg', $scope.signImg);
		            return formData;
		        },
		        data:{
		        	signId:$scope.signId,
		        	status:$scope.status,
		        	userId:$scope.userId,
		        	reason:$scope.reason,
		        	signImg:$scope.signImg,
		        }
			}).success(function(data){
				layer.close($scope.UpdateSignLayer);
				console.log(data);
				if(data.resultCode == 0){
					$scope.data = data.resultData;
					layer.msg("提交成功");
					setTimeout(function(){
						location.href = "#myContractDetail?id="+$scope.id;
					},2000);
				}else{
					layer.msg(data.resultMessage);
				}
			});
	 	}
	});
	//协议详情
	myApp.controller('signAgreementCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		
		$scope.id = $location.search().id;
		$scope.data = new Array();
		$scope.imgs = [];
		$scope.getSign = layer.load(2);
		$http({
			method:"post",
			url:"../api/business/getSign",
			data:{
				signId:$scope.id
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.getSign);
			if(data.resultCode == 0){
				$scope.data = data.resultData;
			}else{
				layer.msg(data.resultMessage);
			}
		});
	});
	//我的签约详情
	myApp.controller('myContractDetailCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		
		$scope.id = $location.search().id;
		$scope.data = new Array();
		$scope.imgs = [];
		$scope.getSign = layer.load(2);
		$http({
			method:"post",
			url:"../api/business/getSign",
			data:{
				signId:$scope.id
			}
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				$scope.data = data.resultData;
				if(data.resultData.putTypeJson.length > 0){
					for(var x = 0; x < data.resultData.putTypeJson.length;x++){
						$scope.imgs.push(data.resultData.putTypeJson[x].imgs);
					}
				}else{
					$scope.imgs.push(data.resultData.contractIcon);
				}
				var mySwiper = new Swiper('.myContractDetailSwiper', {
					autoplay: 5000,//可选选项，自动滑动
					pagination : '.myContractDetailSwiper .swiper-pagination',
					observer:true,//修改swiper自己或子元素时，自动初始化swiper
				    observeParents:true,//修改swiper的父元素时，自动初始化swiper
				});
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//签约动态列表  
		$scope.nodata = "正在加载中...";
		$scope.page = 0;
		$scope.signData = new Array();
		$scope.signLoad = true;
		$scope.moreDataCanBeLoaded = true;
		
		
		var d = new Date();
		$scope.date = d.getFullYear() + "年" + parseInt(d.getMonth() + 1) + "月" + d.getDate() + "日";
		
		//拒绝签约
		$scope.refuseMask = function(){
			$(".myContractDetailMask").show();
		}
		$scope.refuseContract = function(){
			if($scope.reason == null || $scope.reason == ""){
				layer.msg("请输入拒绝原因");
				return false;
			}
			var UpdateSignLayer = layer.load(2);
			$http({
			    url:"../api/business/businessUpdateSign",
		        method: 'POST',  
		        headers: {'Content-Type': undefined},
		        transformRequest: function(data) {
		            var formData = new FormData();
					formData.append('signId', $scope.id);
					formData.append('status', 7);
					formData.append('userId', $scope.userId);
					formData.append('reason', $scope.reason);
					formData.append('file', $("input[name=signImg]")[0]);
		            return formData;
		        },
		        data:{
		        	signId:$scope.signId,
		        	status:$scope.status,
		        	userId:$scope.userId,
		        	reason:$scope.reason,
		        	file:$scope.file,
		        }
			}).success(function(data){
				layer.close(UpdateSignLayer);
				console.log(data);
				$(".myContractDetailMask").hide();
				if(data.resultCode == 0){
					$scope.data = data.resultData;
					$scope.data.adminName = data.resultData.salesId;
					layer.msg("拒绝成功");
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.photoUpload = function(){
			$(".contractUploadMask").show();
		}
		
		$scope.lat = "";
		$scope.lng = "";
		$scope.address = "";
		$scope.page = 0;
		$scope.status = 0;
		$scope.patrolData = new Array();
		$scope.patrolLoad = true;
		$scope.moreDataCanBeLoaded = false;
		var map, geolocation;
	    //加载地图，调用浏览器定位服务
	    map = new AMap.Map('container', {
	        resizeEnable: true
	    });
	    map.plugin('AMap.Geolocation', function() {
	        geolocation = new AMap.Geolocation({
	            enableHighAccuracy: true,//是否使用高精度定位，默认:true
	            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
	            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
	            zoomToAccuracy: true,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
	            buttonPosition:'RB'
	        });
	        map.addControl(geolocation);
	        geolocation.getCurrentPosition();
	        AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
	        AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
	    });
	    //解析定位结果
	    function onComplete(data) {
	    	console.log(data)
	        console.log("|")
			$scope.lat = data.position.lat;
			$scope.lng = data.position.lng;
			$scope.address = data.formattedAddress;
			layer.close($scope.getSign);
	    }
	    //解析定位错误信息
	    function onError(data) {
	        console.log('定位失败');
			layer.close($scope.getSign);
	    }
		//签约动态列表
		$scope.patrolList = function(page){
			if( $scope.patrolLoad == false ){
				return false;
			}
			$scope.patrolLoad = false;
			$http({
				method:"post",
				url:"../api/business/ywymPatrolList",
				data:{
					userId:$scope.userId,
					signId:$scope.id,
					page:page,
				}
			}).success(function(data){
				console.log(data);
				if(data.resultCode == 0){
					if(data.resultData.list.length > 0){
						for(var i in data.resultData.list){
							$scope.patrolData.push(data.resultData.list[i]);
						}
						$scope.page++;
						$scope.patrolLoad = true;
						$scope.moreDataCanBeLoaded = true;
						$scope.$broadcast('scroll.infiniteScrollComplete');
					}else{
						$scope.nodata = "暂无数据.";
						$scope.moreDataCanBeLoaded = false;
					}
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.closeContractUpload = function(){
			$(".contractUploadMask").hide();
		}
		$scope.saveContractUpload = function(){
			if(  $("input[name=shopImg]").eq(0).val() == null ||  $("input[name=shopImg]").eq(0).val() == "" ){
				layer.msg("请上传照片");
				return false;
			}
			$scope.saveContractUploadLayer = layer.load(2);
	 		$http({
			    url:"../api/business/businessUploadImgSign",
		        method: 'POST',  
		        headers: {'Content-Type': undefined},
		        transformRequest: function(data) {
		            var formData = new FormData();
					formData.append('signId', $scope.id);
					formData.append('userId', $scope.userId);
					formData.append('address',$scope.address);
					formData.append('longitude',$scope.lng);
					formData.append('latitude',$scope.lat);
					$("input[name=shopImg]").each(function(i){
						formData.append('imgs', $("input[name=shopImg]")[i].files[0]);
					});
		            return formData;
		        },
		        data:{
		        	signId:$scope.signId,
		        	userId:$scope.userId,
		        	imgs:$scope.signImg,
		        	address:$scope.address,
		        	longitude:$scope.longitude,
		        	latitude:$scope.latitude,
		        }
			}).success(function(data){
				layer.close($scope.saveContractUploadLayer);
				console.log(data);
				if(data.resultCode == 0){
					$scope.data = data.resultData;
					layer.msg("提交成功");
					$(".contractUploadMask").hide();
					$scope.patrolList($scope.page);
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.patrolList($scope.page);
		$scope.loadMore = function(){
			$scope.patrolList($scope.page);
		}
	});
	//我的签约
	myApp.controller('myContractCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.nodata = "正在加载中...";
		$scope.index = 0;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.hei = $window.innerHeight - 58;
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.page = 0;
		$scope.status = 0;
		$scope.signData = new Array();
		$scope.signLoad = true;
		$scope.moreDataCanBeLoaded = true;
		//签约列表
		$scope.signList = function(page,status){
			if($scope.signLoad == false){
				return false;
			}
			$scope.signLoad = false;
			if(page == 0){
				$scope.signLayer = layer.load(2);
			}
			$http({
				method:"post",
				url:"../api/business/signList",
				data:{
					userId:$scope.userId,
					userType:1,
					status:status,//0全部 1 业务员发起协议 2 等待所长审核 3 等待部长审核 4 终端未确认 5 终端发起待业务审核 6 双方同意签约 7 已拒绝 8 待开始 9 已结束
					page:page,
				}
			}).success(function(data){
				console.log(data);
				if(page == 0){
					layer.close($scope.signLayer);
				}
				$scope.moreDataCanBeLoaded = false;
				if(data.resultCode == 0){
					if(data.resultData.list.length > 0){
						for(var i in data.resultData.list){
							if(data.resultData.list[i].putTypeJson.length > 0){
								data.resultData.list[i].putTypeJson = [];
								for(var x in data.resultData.list[i].putTypeJson){
									data.resultData.list[i].putTypeJson.push(data.resultData.list[i].putTypeJson[x].name);
								}
								data.resultData.list[i].putTypeJson = data.resultData.list[i].putTypeJson.join("、");
							}else{
								data.resultData.list[i].putTypeJson = "未设置";
							}
							console.log(data.resultData.list[i].putTypeJson);
							$scope.signData.push(data.resultData.list[i]);
						}
						$scope.signLoad = true;
						$scope.moreDataCanBeLoaded = true;
						$scope.page++;
						$scope.$broadcast('scroll.infiniteScrollComplete');
					}else{
						$scope.nodata = "暂无数据.";
					}
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.signList($scope.page, $scope.status);
		$scope.loadMore = function(){
			$scope.signList($scope.page, $scope.status);
		}
		//menu
		$scope.contractMenu = function(index,status){
			$scope.index = index;
			$scope.status = status;
			$scope.signLoad = true;
			$scope.moreDataCanBeLoaded = true;
			$scope.signData = new Array();
			$scope.page = 0;
			$ionicScrollDelegate.scrollTop();
			$scope.signList($scope.page, $scope.status);
		}
	});
	//业务员详情
	myApp.controller('salesmanCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.id = $location.search().id;
		$scope.salesmanLayer = layer.load(2);
		$scope.salesmanData = new Array();
		$http({
			method:"post",
			url:"../api/admin/getAdminUser",
			data:{
				userId:$scope.id,
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.salesmanLayer);
			if(data.resultCode == 0){
				$scope.salesmanData = data.resultData;
				if(data.resultData.shopImg.indexOf(",") == -1){
					$scope.salesmanData.shopImg = data.resultData.shopImg;
				}else{
					$scope.salesmanData.shopImg = data.resultData.shopImg.split(",")[0];
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
	});
	//个人资料
	myApp.controller('personaldataCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.hideTabs = true;
		$rootScope.menu = 4;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.userData = new Array();
		$scope.imgs = [];
		//获取个人资料
		$scope.getUserLyaer = layer.load(2);
		$http({
			method:"post",
			url:"../api/user/addNotPayOrder",
			data:{
				userId:$scope.userId
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.getUserLyaer);
			if(data.resultCode == 0){
				$scope.userData = data.resultData;
				if(data.resultData.shopImg.indexOf(",") == -1){
					$scope.imgs.push(data.resultData.shopImg);
				}else{
					for(var x = 0; x < data.resultData.shopImg.split(",").length;x++){
						$scope.imgs.push(data.resultData.shopImg.split(",")[x]);
					}
				}
				console.log($scope.imgs)
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//添加邀请码
		$scope.openAddInvitingCode = function(){
			$(".personalMask").show();
		}
		$scope.closeAddInvitingCode = function(){
			$(".personalMask").hide();
		}
		$scope.submitInvitingCode = function(){
			if($scope.InvitingCode == null || $scope.InvitingCode == ""){
				layer.msg("请输入邀请码");
				return false;
			}
			$scope.InvitingCodeLyaer = layer.load(2);
			$http({
				method:"post",
				url:"../api/user/bindingAdmin",
				data:{
					userId:$scope.userId,
					userno:$scope.InvitingCode,
				}
			}).success(function(data){
				console.log(data);
				layer.close($scope.InvitingCodeLyaer);
				if(data.resultCode == 0){
					layer.msg('绑定成功');
					$scope.userData.adminId = data.resultData.adminId;
					$scope.userData.adminIdTemp = data.resultData.adminIdTemp;
					$scope.userData.adminDistributor = data.resultData.adminDistributor;
					$(".personalMask").hide();
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	});
	//我的
	myApp.controller('userCenterCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.menu = 4;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.userData = new Array();
		//获取个人资料
		$scope.getUserLyaer = layer.load(2);
		$http({
			method:"post",
			url:"../api/user/addNotPayOrder",
			data:{
				userId:$scope.userId
			}
		}).success(function(data){
			console.log(data);
			layer.close($scope.getUserLyaer);
			if(data.resultCode == 0){
				$scope.userData = data.resultData;
				if(data.resultData.shopImg.indexOf(",") == -1){
					$scope.userData.shopImg = data.resultData.shopImg;
				}else{
					$scope.userData.shopImg = data.resultData.shopImg.split(",")[0];
				}
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//退出
		$scope.exit = function(){
			$.cookie("userId",null,{ expires: 9999, path: '/' });
			location.href = "#login";
		}
	});
	//签约详情
	myApp.controller('contractdetailCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.hideTabs = true;
		$rootScope.menu = 3;
		$scope.userId = $.cookie("userId");
		if($scope.userId == null || $scope.userId == "" || $scope.userId == "null"){
			location.href = "#login";
		}
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.id = $location.search().id;
		$scope.data = new Array();
		$scope.imgs = [];
		$http({
			method:"get",
			url:"../api/admin/contractList"
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				for(var i in data.resultData){
					if($scope.id == data.resultData[i].id){
						$scope.data = data.resultData[i];
						if(data.resultData[i].icon.indexOf(",") == -1){
							$scope.imgs.push(data.resultData[i].icon);
						}else{
							for(var x = 0; x < data.resultData[i].icon.split(",").length;x++){
								$scope.imgs.push(data.resultData[i].icon.split(",")[x]);
							}
						}
					}
				}
				var mySwiper = new Swiper('.contractDetailSwiper', {
					autoplay: 5000,//可选选项，自动滑动
					pagination : '.contractDetailSwiper .swiper-pagination',
					observer:true,//修改swiper自己或子元素时，自动初始化swiper
				    observeParents:true,//修改swiper的父元素时，自动初始化swiper
				});
			}else{
				layer.msg(data.resultMessage);
			}
		});
		//发起签约
		$scope.businessAddsign = function(){
			$scope.businessAddsignLayer = layer.load(2);
			$http({
				method:"post",
				url:"../api/business/businessAddsign",
				data:{
					signType:$scope.id,
					userId:$scope.userId,
				}
			}).success(function(data){
				console.log(data);
				layer.close($scope.businessAddsignLayer);
				if(data.resultCode == 0){
					$(".contractDetailMask").show();
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		$scope.closeContractDetailMask = function(){
			$(".contractDetailMask").hide();
		}
	});
	//首页
	myApp.controller('IndexCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.menu = 3;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.contractList = new Array();
		$http({
			method:"get",
			url:"../api/admin/contractList"
		}).success(function(data){
			console.log(data);
			if(data.resultCode == 0){
				$scope.contractList = data.resultData;
			}else{
				layer.msg(data.resultMessage);
			}
		});
	});
	
	myApp.controller('registerCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory,$window){
		$rootScope.hideTabs = true;
		$rootScope.menu = 0;
		$scope.mapHeight = $window.innerHeight - 46 - 52 - 46;
		$scope.province = ""; //省份
		$scope.city = ""; //城市
		$scope.district = ""; //区县
		$scope.address = ""; //详细地址
		$scope.lat = "";
		$scope.lng = "";
		$scope.identityCard = "";
		$scope.curprovince = ""; //省
		$scope.curcity = ""; //城市
		$scope.curdistrict = ""; //区县
		$scope.curaddress = ""; //详细地址
		$scope.curlat = "";
		$scope.curlng = "";
		$scope.curidentityCard = "";
		$scope.timer = 60;
		$scope.sendLoad = true;
	    
	    //发送验证码
		$scope.sendCode = function($event){
			if($scope.sendLoad == false){
				return false;
			}
			$scope.sendLoad = false;
			var obj = $(event.target);
			if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
			if(!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test($scope.phone))){
				layer.msg("请输入正确手机号码");
				return false;
			}
			$scope.sendCodeLayer = layer.load(2);
			$http({
				method:"post",
				url:"../api/login/sendCode",
				data:{
					types:1,
					phone:$scope.phone,
				}
			}).success(function(data){
				layer.close($scope.sendCodeLayer);
				if(data.resultCode == 0){
					var sendCodeTimer = setInterval(function(){
						if($scope.timer > 0){
							obj.text($scope.timer+"s");
							$scope.timer--;
						}else{
							obj.text("验证码");
							$scope.timer = 60;
							clearInterval(sendCodeTimer);
							$scope.sendLoad = true;
						}
					},1000);
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	    
	    
	    $scope.chooseMap = function(){
			$scope.province = $scope.curprovince;
			$scope.city = $scope.curcity;
			$scope.district = $scope.curdistrict
			$scope.address = $scope.curaddress;
			$scope.lat = $scope.curlat;
			$scope.lng = $scope.curlng;
			$("#mapAddress").text($scope.address);
			$("#openMap").text($scope.address);
	        $("#map").hide();
	    }
	    $scope.cancelMap = function(){
	        $("#map").hide();
	    }
	    $scope.openMap = function($event){
	    	AMapUI.loadUI(['misc/PositionPicker'], function(PositionPicker) {
		        //地图加载
			    var map = new AMap.Map("mapContainer", {
			        resizeEnable: true,
		       		center: [113.263471,23.123915],
		    		zoom: 13,
		            scrollWheel: false
			    });
			    //输入提示
			    var autoOptions = {
			        input: "tipinput"
			    };
			    var auto = new AMap.Autocomplete(autoOptions);
			    var placeSearch = new AMap.PlaceSearch({
			        map: map,
			    });  
			    //构造地点查询类
			    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
			    function select(e) {
			        placeSearch.setCity(e.poi.adcode);
			        placeSearch.search(e.poi.name);  //关键字查询查询
			    }
		        var positionPicker = new PositionPicker({
		            mode: 'dragMap',
		            map: map
		        });
		        
		    	positionPicker.on('success', function(positionResult) {
					$scope.curprovince = positionResult.regeocode.addressComponent.province; //省份
					$scope.curcity = positionResult.regeocode.addressComponent.city; //城市
					$scope.curdistrict = positionResult.regeocode.addressComponent.district; //区县
					$scope.curaddress = positionResult.address; //详细地址
					$scope.curlat = positionResult.position.lat;
					$scope.curlng = positionResult.position.lng;
					$("#mapAddress").text($scope.curaddress);
	        });
		        positionPicker.on('fail', function(positionResult) {
		            layer.msg('系统繁忙,请稍后再试');
		        });
		        positionPicker.start(map.getBounds().getSouthWest());
		        map.panBy(0, 1);
		
		        map.addControl(new AMap.ToolBar({
		            liteStyle: true
		        }));
		    });
	    	$("#map").show();
	    }
	    //注册
	    
	    $scope.registerSubmit = function(){
	    	if($scope.shopName == null || $scope.shopName == ""){
				layer.msg("请输入店铺名称");
				return false;
			}
	    	if($("input[name=identityCard]").val() == null || $("input[name=identityCard]").val() == ""){
				layer.msg("请上传身份证照片");
				return false;
			}
	    	if($scope.cardNo == null || $scope.cardNo == ""){
				layer.msg("请输入身份证号码");
				return false;
			}
	    	if($scope.name == null || $scope.name == ""){
				layer.msg("请输入身份证姓名");
				return false;
			}
	    	if($("input[name=businessImg]").val() == null || $("input[name=businessImg]").val() == ""){
				layer.msg("请上传营业执照");
				return false;
			}
	    	if($scope.address == null || $scope.address == ""){
				layer.msg("请输入店铺地址");
				return false;
			}
	    	if($scope.password == null || $scope.password == ""){
				layer.msg("请输入登录密码");
				return false;
			}
	    	if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
	    	if($scope.code == null || $scope.code == ""){
				layer.msg("请输入手机验证码");
				return false;
			}
	    	if($(".itemImgs").eq(0).find("img").attr("src") == null || $(".itemImgs").eq(0).find("img").attr("src") == ""){
				layer.msg("请上传店铺照片");
				return false;
			}
	    	
			$("input[name=password]").val(hex_sha1($scope.password));
	    	
	    	
	    	
			var formData = new FormData($( "#registerInput" )[0]);  
			register(formData);
	    }
	});
	//重置密码
	myApp.controller('resetpasswordCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.hideTabs = true;
		$rootScope.menu = 0;
		$scope.phone = $location.search().phone;
		$scope.code = $location.search().code;
		console.log($scope.phone +","+$scope.code);
		$scope.reset = function(){
			if($scope.newpass == null || $scope.newpass == ""){
				layer.msg("请输入新密码");
				return false;
			}
			if($scope.newpassword == null || $scope.newpassword == ""){
				layer.msg("请再次输入新密码");
				return false;
			}
			if($scope.newpass != $scope.newpassword){
				layer.msg("请输入一致的密码");
				return false;
			}
			$scope.resetLayer = layer.load(2);
			$http({
				method:"post",
				url:"../api/login/updateLoginPwd",
				data:{
					phone:$scope.phone,
					password:hex_sha1($scope.newpassword),
					code:$scope.code,
				}
			}).success(function(data){
				layer.close($scope.resetLayer);
				if(data.resultCode == 0){
					location.href = "#login";
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	});
	//找回密码
	myApp.controller('retrievepasCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.hideTabs = true;
		$rootScope.menu = 0;
		$scope.timer = 60;
		$scope.sendLoad = true;
		//发送验证码
		$scope.sendCode = function($event){
			if($scope.sendLoad == false){
				return false;
			}
			$scope.sendLoad = false;
			var obj = $(event.target);
			if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
			if(!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test($scope.phone))){
				layer.msg("请输入正确手机号码");
				return false;
			}
			$scope.sendCodeLayer = layer.load(2);
			$http({
				method:"post",
				url:"../api/login/sendCode",
				data:{
					types:2,
					phone:$scope.phone,
				}
			}).success(function(data){
				layer.close($scope.sendCodeLayer);
				if(data.resultCode == 0){
					var sendCodeTimer = setInterval(function(){
						if($scope.timer > 0){
							obj.text($scope.timer+"s");
							$scope.timer--;
						}else{
							obj.text("验证码");
							$scope.timer = 60;
							clearInterval(sendCodeTimer);
							$scope.sendLoad = true;
						}
					},1000);
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
		//校验验证码
		$scope.checkCode = function(){
			if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入手机号码");
				return false;
			}
			if(!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test($scope.phone))){
				layer.msg("请输入正确手机号码");
				return false;
			}
			if($scope.code == null || $scope.code == ""){
				layer.msg("请输入手机验证码");
				return false;
			}
			location.href = "#resetpassword?phone="+$scope.phone+"&code="+$scope.code;
		}
	});
	//登录
	myApp.controller('loginCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope,$ionicHistory){
		$rootScope.menu = 0;
		$scope.goback=function(){
			$ionicHistory.goBack();
		}
		$scope.login = function(){
			if($scope.phone == null || $scope.phone == ""){
				layer.msg("请输入账号/手机号码");
				return false;
			}
			if($scope.password == null || $scope.password == ""){
				layer.msg("请输入密码");
				return false;
			}
			$scope.layer = layer.load(2);
			$http({
				method:"post",
				url:"../api/login/loginByPhoneWX",
				data:{
					phone:$scope.phone,
					password:hex_sha1($scope.password),
				}
			}).success(function(data){
				console.log(data);
				layer.close($scope.layer);
				if(data.resultCode == 0){
					$.cookie("userId",data.resultData.id,{ expires: 9999, path: '/' });
					if(data.resultData.phone == null || data.resultData.phone == ""){
						location.href = "index.html#consummate?userId="+data.resultData.id;
					}else{
						location.href = "index.html#index";
					}
				}else{
					layer.msg(data.resultMessage);
				}
			});
		}
	});
	
	myApp.controller('homeCtrl',function($http,$scope,$ionicScrollDelegate,$ionicHistory,$location,$rootScope){
		$scope.userId = $.cookie("userId");
		console.log($scope.userId);
		var url = window.location.href;
			if( $scope.userId == null || $scope.userId == "" ){
				//location.href = "index.html#login";
			}
	});
function register(formData){
	var indexLayer = layer.load(2);
	$.ajax({
	    url:"../api/login/register",
        type: 'POST',  
        data: formData,  
        async: false,  
        cache: false,  
        contentType: false,  
        processData: false,  
		success:function(data){
			layer.close(indexLayer);
			console.log(data);
			if(data.resultCode == 0){
				layer.msg("提交成功,请耐心等待审核!");
				setTimeout(function(){
					location.href = "#login";					
				},2000);
			}else{
				layer.msg(data.resultMessage);
			}
		}
	});
}