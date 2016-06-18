(function init() {
	$("#username").html("<i class='icon-user'></i>"+username+"<i class='caret'>");
	$("#navt1").text(username);
})();
function iFrameHeight() {  
	var ifm= document.getElementById("iframe");   
	var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;   
	if(ifm != null && subWeb != null) {   
		ifm.height = subWeb.body.scrollHeight;   
	}
};
var nhref = $('#nhref').attr('href');
function chifm(){
    /*
	if($(this).href == nhref){
		return;
	}
    */
    if(!$(this).hasClass("breadcrumblink")) {
        if(!$(this).parent().hasClass("accordion-heading")) {
            $("#navt1").text($(this).parent().parent().parent().parent().prev().text());
            
            $("#navt2").text($(this).text());
            $("#navt2").attr("href", $(this).attr("href"));
        } else {
            $("#navt1").text($(this).text());
            $("#navt2").text("");
        }
    }
	var href = this.href;
	var iframe= document.getElementById("iframe");
	$(this).parent().parent().prev().modal('hide');
	iframe.src = href;
	if (iframe.attachEvent){
		iframe.attachEvent("onload", function(){
			setTimeout("iFrameHeight()", 200);
		});
	} else {
		iframe.onload = function(){
			setTimeout("iFrameHeight()", 200);
		};
	}

	return false;
};

$(".alink").click(chifm);