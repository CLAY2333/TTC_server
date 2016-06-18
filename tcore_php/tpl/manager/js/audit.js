function queryaudit(count) {
	$.post(
		"/manager/queryauditall",
		{pagecount : count},
		function(data){
			var json = eval('(' + data + ')');
			$("#allaudit").html("");
			if(json.value[0] == null ){
				$("#allaudit").append($('<p>暂时没有店铺</p>'));
				//$("#allaudit").attr("height", "300px");
			}
			//alert(json.value[1].totalpage);
			//alert(json.value[1].pagecount);
			$('#pagecount').text(json.value[1].pagecount);
			$('#totalpage').text(json.value[1].totalpage);
			pagecount = json.value[1].pagecount;
			$.each(json.value[0],function(idx, item){
				var table = $('<div class="block"><div class="navbar navbar-inner block-header"><div class="muted pull-left">待审店铺</div></div><div class="block-content collapse in"><div class="span12"><table class="table"><tbody><tr><td>店铺名称</td><td id="shop_name">' + item.shop_name + '</td><td>店铺编号</td><td id="id">' + item.id + '</td></tr><tr><td>联系方式</td><td id="phone_number">' + item.phone_number + '</td><td>联系人</td><td id="host_name">' + item.host_name + '</td></tr><tr><td>店铺地址</td><td id="address" colspan="3">' + 'longitude:' + item.longitude + '     latitude:' + item.latitude + '</td></tr><tr><td colspan="4"><button type="button" class="btn btn-large btn-block show" data="' + item.id + '">点击进入详细</button></td></tr></tbody></table></div></div></div>');
				$("#allaudit").append(table);
			});
		$("#allaudit").delegate(".show","click",function(){
				window.location.href="/manager/auditbyid?id=" + $(this).attr("data");
			});
		}
	);
}
var pagecount = 1;
queryaudit(pagecount);

$('#pre').click(function(){
	if(pagecount<2){
		return false;
	}
	queryaudit(pagecount*1-1);
});

$('#next').click(function(){
	if(pagecount >= $('#totalpage').text()){
		return false;
	}
	queryaudit(pagecount*1+1);
});




