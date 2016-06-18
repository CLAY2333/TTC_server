$.post(
	"/manager/admininfo",
	{
		username: 'zhang',
	},
	function(data) {
		//alert(data);
		var json = eval('(' + data + ')');
		
		//alert(json.value[0][0].username);
		//alert($("#d").text());
		$("#username").html(json.value[0][0].username);
		$("#password").text(json.value[0][0].passwd);
	}
);