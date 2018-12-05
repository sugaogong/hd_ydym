function viewImg(obj,n){
	var obj = $(obj);
	var parent = obj.parents("#layer-photos");
	var json = {
	  "start":n,
	  "data": []
	};
	var arr = new Array();
	for (var i = 0; i < parent.find("img").length; i++) {
		var item = parent.find("img").eq(i).attr("data-src");
		var arry = {
			src:item
		}
		arr.push(arry);
	}
	json.data = arr;
	layer.photos({
	    photos: json ,
	    anim: 5,
	 });
}