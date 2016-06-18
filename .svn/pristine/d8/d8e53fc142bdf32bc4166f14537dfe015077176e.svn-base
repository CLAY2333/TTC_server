(function()
{
	var username = window.parent.username;
	var linkList=window.parent.document.getElementsByTagName("link");//获取父窗口link标签对象列表
	//var scriptList=window.parent.document.getElementsByTagName("script");
	var head = document.getElementsByTagName("head").item(0);
	//外联样t
	for(var i=0;i<linkList.length;i++)
	{
		var l = document.createElement("link");
		l.rel = 'stylesheet'
		l.type = 'text/css'; 
		l.href=linkList[i].href;
		head.appendChild(l);
	}
	/*
	for(var i=0;i<scriptList.length;i++)
	{
		var l=document.createElement("script");
		l.src=scriptList[i].src;
		head.appendChild(l);
	}
	*/
})();
