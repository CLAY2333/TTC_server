(function($){
    $.nameSapce = function(namespaceString){
        var temp = [];//������һ���յ�����
        var array = namespaceString.split(".");
        for (var i = 0; i < array.length; i++) {
            temp.push(array[i]);
            /**
             * �Ѷ��json���������window��
             */
            eval("window." + temp.join(".") + "={}");
        }
    }
})($);
