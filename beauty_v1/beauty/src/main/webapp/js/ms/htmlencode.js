var HtmlUtil = {
	 /*1.用正则表达式实现html转码*/
	htmlEncodeByRegExp:function (str){ 
	var s = "";
	if(str.length == 0) return "";
	s = str.replace(/&/g,"&amp;");
	s = s.replace(/</g,"&lt;");
	s = s.replace(/>/g,"&gt;");
	s = s.replace(/ /g,"&nbsp;");
	s = s.replace(/\'/g,"&#39;");
	s = s.replace(/\"/g,"&quot;");
	return s; 
	},
	/*2.用正则表达式实现html解码*/
	htmlDecodeByRegExp:function (str){ 
	var s = "";
	if(str.length == 0) return "";
	s = str.replace(/&amp;/g,"&");
	s = s.replace(/&lt;/g,"<");
	s = s.replace(/&gt;/g,">");
	s = s.replace(/&nbsp;/g," ");
	s = s.replace(/&#39;/g,"\'");
	s = s.replace(/&quot;/g,"\"");
	return s; 
	}
};

/*
 * 使用实例
 $("#btn-data").click( function() {
	var markupStr = $('#summernote').summernote('code');
	var encodeHTML = HtmlUtil.htmlEncodeByRegExp(markupStr);
	console.info("用正则表达式进行html转码，encodeHTML：" + encodeHTML);
	var decodeHTML = HtmlUtil.htmlDecodeByRegExp("用正则表达式进行html解码：" + encodeHTML);
	console.info(decodeHTML);
	rsthtml.innerHTML=decodeHTML
});
 * 
 * */
