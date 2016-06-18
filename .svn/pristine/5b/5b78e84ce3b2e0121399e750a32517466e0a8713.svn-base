$(".icon").fileinput({
	//uploadUrl: "http://localhost/index.php", // server upload action
	uploadAsync: false,
	allowedFileExtensions : ['jpg', 'png','gif'],
	initialPreview: [
			'<img src="/tpl/manager/img/0.jpg" class="file-preview-image"/>',
		],
	overwriteInitial: true,
	maxFileCount: 1
});
$.post(
	"/manager/queryallad",
	null,
	function(data){
		var json = eval('(' + data + ')');
		$.each(json.value,function(idx, item){
			var id = $("<td/>").text(item.id);
			var url = $("<td/>").text(item.url);
			var img = $("<td/>").html('<a target="_Blank" href="' + item.pic + '">查看图片</a>');
			var del = $("<td/>").html('<a id=' +item.id+ ' class="del">删除</a>');
			var tr = $("<tr/>").append(id).append(url).append(img).append(del);
			$("#adtable tbody").append(tr);
		});
	}
);
$("#adtable").delegate(".del","click",function(){
	var a = $(this);
	alert(a.attr('id'));
	$.post(
		"/manager/delad",
		{id : a.attr('id')},
		function(data){
				a.parent().parent().remove();
		}
	);
	return false;
});


//ajax



/*
	$("form").submit(function(){
		
		alert($(this).serialize());
		if(!this.children('icon1').val() ){
			alert("请插入图片");
			return false;
		}
	});
*/


/*	alert($(".fileinput-upload-button").attr("title"));

	function doUpload() {  
		alert('ccc');
		var formData = new FormData($( "#uploadForm" )[0]);  
		$.ajax({  
			url: '/index.php/manager/uploadad' ,  
			type: 'POST',  
			data: formData,  
			async: false,  
			cache: false,  
			contentType: false,   //contentType:"multipart/form-data",
			processData: false,  
			success: function (returndata) {  
				alert(returndata);  
				//return false;
			},  
			error: function (returndata) {  
				alert(returndata);  
				//return false;
			}  
		});  	
	}
	$(".fileinput-upload-button").unbind("click");
	$(".fileinput-upload-button").bind('click',doUpload)
	//alert($(".fileinput-upload-button").attr('title'));
	*/
