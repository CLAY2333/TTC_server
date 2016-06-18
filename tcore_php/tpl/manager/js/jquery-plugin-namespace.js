(function($){
    $.nameSapce = function(namespaceString){
        var temp = [];//声明了一个空的数组
        var array = namespaceString.split(".");
        for (var i = 0; i < array.length; i++) {
            temp.push(array[i]);
            /**
             * 把多个json对象添加了window上
             */
            eval("window." + temp.join(".") + "={}");
        }
    }
})($);
