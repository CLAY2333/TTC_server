(function($){
	/**
	 * 这里需要一些方法
	 *    查询方法
	 *    修改的方法
	 *    删除的方法
	 */
	$.fn.GridPanel = {
		/**
		 * 初始化事件
		 */
		initEvent:function(){
			/**
			 * 给table中的所有的超级链接添加事件
			 */
			$("#"+$.fn.GridPanel.defaultConfig.table_id).delegate("a","click",function(){
				if($(this).text()=="删除"){
					$.fn.GridPanel.method.deleteRow.call(this);
				}else if($(this).text()=="修改"){
					
				}
			})
			
			/**
			 * 当点击一个td的时候，触发td的click事件
			 * 
			 * "td:not(:has(a))"  不含有超级链接的td
			 */
			$("#"+$.fn.GridPanel.defaultConfig.table_id).delegate("td:not(:has(a))","click",function(){
				if($(this).children("input").length==0){//td下面没有文本框
					var value = $(this).text();
					$(this).empty();//把该元素下面的所有的子子元素清空
					var $txt = $.fn.GridPanel.method.createText();
					$(this).append($txt);
					$txt.focus();//聚焦
					$txt.attr("value",value);//赋值	
				}
			})
			
			/*
			 * 添加td中的文本框失去焦点的事件
			 */
			$("#"+$.fn.GridPanel.defaultConfig.table_id).delegate("input","blur",function(){
				$.fn.GridPanel.method.updateCell.call(this);
			})
		},
		/**
		 * 默认的配置
		 */
		defaultConfig:{
			table_id:'',
			url:'',
			/**
			 * 特定的操作要往后台传递的参数
			 */
			option:{
				/**
				 * 查询操作
				 */
				query:{
					
				},
				/**
				 * 删除操作
				 */
				del:{
					
				},
				/**
				 * 修改操作
				 */
				update:{
					
				}
			},
			/**
			 * <th field="name">姓名</th>
			   <th field="description">描述</th>
			   <th field="del">删除</th>
			   <th field="update">修改</th>
			 */
			fields:'',
			filedUpdate:'',
			filedDelete:''
		},
		/**
		 * 对表格操作的所有的方法全部放在method中
		 */
		method:{
			/**
			 * 从后台加载数据，利用ajax技术形成表格
			 */
			createTable:function(config){
				/**
				 * 1、请求后台，把数据传到客户端
				 */
				//把客户端传递过来的参数覆盖掉默认的配置  true为深度迭代
				$.extend(true,$.fn.GridPanel.defaultConfig,config);
				
				/**
				 * 执行initEvent方法
				 */
				$.fn.GridPanel.initEvent();
				
				$.post($.fn.GridPanel.defaultConfig.url,$.fn.GridPanel.defaultConfig.option.query,function(data){
					/**
					 * data:
					 * [
					 * 	{
					 * 		pid:1,
					 * 		name:'aa',
					 * 		description:'aa'
					 *  },
					 *  {
					 *  	pid:2,
					 *  	name:'bb',
					 *  	description:'bb'
					 *  }
					 * ]
					 */
					 //把后台回调过来的数据转化成json对象
					 var array = eval("("+data+")");
					 /**
					  * 遍历array数组中的每一个元素
					  * 第二个参数为回调，在该函数中创建tr
					  */
					 $.each(array,function(){
					 	 /**
					 	  * 每遍历一次，调用一次createTR方法
					 	  * 当createTR方法调用完毕以后创建了一个tr,再把tr追加到tbody上
					 	  */
					 	 $("#"+$.fn.GridPanel.defaultConfig.table_id+" tbody").append(
						 	$.fn.GridPanel.method.createTR.call(this));
					 });
				});
			},
			/**
			 * 修改其中的一个单元格
			 */
			updateCell:function(){
				/**
				 * this为当前的文本框
				 */
				var updateObj = $(this);
				var pid = $(this).parent().parent().data("id");
				var value = $(this).val(); //文本框的值
				var $td = $(this).parent();//文本框的父节点td
				var item = $td.attr("item");//要修改的列名
				$.post($.fn.GridPanel.defaultConfig.url,{
					id:pid,
					item:item,
					value:value,
					method:'update'
				},function(data){
					updateObj.remove();
					$td.text(value);
				});
				
			},
			/**
			 * 给table添加一行
			 */
			addRow:function(){
				
			},
			/**
			 * 删除指定的行
			 */
			deleteRow:function(){
				var delObj = $(this);
				if (window.confirm("您确认要删除吗")) {
					/*
					 * 因为在查询的时候把id利用该tr放入到了jQuery的缓存中，所以在这里可以提取到
					 */
					$.fn.GridPanel.defaultConfig.option.del.pid = $(this).parent().parent().data("id");
					$.post($.fn.GridPanel.defaultConfig.url, $.fn.GridPanel.defaultConfig.option.del, function(data){
						delObj.parent().parent().remove();
					});
				}
			},
			/**
			 * 创建一个tr
			 */
			createTR:function(){
				/**
				 * this为{
					   	pid:2,
					   	name:'bb',
					   	description:'bb'
					   }
				 */
				var jsonObj = this;
				var $tr = $("<tr/>");
				/**
				 * 相当于把key为id,value为jsonObj.pid加在了jQuery.cache中
				 * 可以利用$tr.data("id")获取到值
				 */
				$tr.data("id",jsonObj.pid);
				/**
				 * 因为$.fn.GridPanel.defaultConfig.fields的数组的长度就是多少列
				 */
				$.each($.fn.GridPanel.defaultConfig.fields,function(){
					/**
					 * this代表正在遍历的每一个元素就是fields中的每一个元素
					 */
					$tr.append($.fn.GridPanel.method.createTD.call(this,jsonObj));
				});
				return $tr;
			},
			/**
			 * 创建一个td
			 * jsonObj
			 *    {
					   	pid:2,
					   	name:'bb',
					   	description:'bb'
					   }
			 */
			createTD:function(jsonObj){
				/**
				 * this  <th field="name">姓名</th>
				 */
				if($(this).attr("field")==$.fn.GridPanel.defaultConfig.filedDelete){//如果是删除
					return $("<td/>").append($.fn.GridPanel.method.createA("删除"));
				}else if($(this).attr("field")==$.fn.GridPanel.defaultConfig.filedUpdate){//如果是修改
					return $("<td/>").append($.fn.GridPanel.method.createA("修改"));
				}else{//不是超级链接
					return $("<td/>").attr("item",$(this).attr("field")).text(jsonObj[$(this).attr("field")]);
				}
			},
			createA:function(text){
				return $("<a/>").css("cursor","pointer").text(text);
			},
			createText:function(){
				return $("<input type='text'/>");
			}
		}
	};
})($);
