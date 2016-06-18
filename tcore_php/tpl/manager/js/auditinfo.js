$.post(
	"/manager/queryauditbyid",
	{id : id},
	function(data) {
		var json = eval('(' + data + ')');
		var info = json.value;
		$('#shop_name').text(info['shop_name']);
		$('#id').text(info['id']);
		$('#phone_number').text(info['phone_number']);
		$('#host_name').text(info['host_name']);
		$('#address').text('longitude:' + info['longitude'] + '     latitude:' + info['latitude']);
		$('#manage_range').text(info['manage_range']);
		$('#shop_type').text(info['shop_type']);
		$('#delivery_type').text(info['delivery_type']);
		$('#account').text(info['account']);
		$('#account').text(info['account']);
		var imgs = eval('(' + info.res + ')');
		$('#imgoutdoor').attr("src", imgs['outdoor']);
		$('#imgindoor').attr("src", imgs['indoor']);
		$('#imgbusiness_licence').attr("src", imgs['business_licence']);
		$('#imgserver_licence').attr("src", imgs['server_licence']);
		$('#imgother_licence').attr("src", imgs['other_licence']);
		$('#checked').text(info['checked']);
		if(info["checked"] <= 0) {
			$("#checkedbtn").hide();
			$("#checked").hide();
		} else{
			$("#pass").attr("data", info["id"]);
			$("#fail").attr("data", info["id"]);
			$("#pass").click(function() {
				$.post(
					"/manager/passaudit",
					{id : $(this).attr("data")},
					function(data){
						alert(data);
						alert("审核成功");
						$("#checkedbtn").hide();
					}
				);
			});
			$("#fail").click(function() {
				$.post(
					"/manager/failaudit",
					{id : $(this).attr("data")},
					function(){
						alert("退回成功");
						$("#checkedbtn").hide();
					}
				);
			});
		}
	}
);