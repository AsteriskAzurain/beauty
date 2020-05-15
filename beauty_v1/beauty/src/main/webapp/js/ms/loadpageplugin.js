/*
 * @desc 使用时，优先载入jquery
 * @author wrt
 * 仅需载入loadpagebtn()、pageload()两个方法
 * loadpagebtn()放在调用方法内的第一行
 * pageload()放在后端数据成功接收后，载入数字页码
 */
/*
 * @method
 * @param obj 页码层对象名称
 * @desc 载入页码按钮
 */
function loadpagebtn(obj){
	var temp="<ul id='prepage' class='pagination'>"+
        		"<li><a>首页</a></li>"+
        		"<li><a>上一页</a></li></ul>"+
        		"<ul id='numpage' class='pagination'></ul>"+
        		"<ul id='nextpage' class='pagination'>"+
        		"<li><a>下一页</a></li>"+
        		"<li><a>尾页</a></li></ul>";
    if($(obj+"").find('ul').length<=0){
    	$(obj+"").append(temp);
    }else{
    	$(obj+"").empty();
    	$(obj+"").append(temp);
    }
}
/*
 * @method
 * @param obj 条数选择层对象名称
 * @param func 被调用方法名称
 * @desc 载入每页数据显示条数
 */
/*function loadsizeopt(obj){
	let temp="<label class='pagination'>显示</label>"+
            "<label class='pagination'>"+
                "<select class='form-control' id='showsize'>"+
                    "<option>5</option><option>10</option>"+
                 "</select></label><label class='pagination'>条记录/页</label>";
	if($(obj+"").find('select').length<=0){
		$(obj+"").append(temp);
	}else{
    	$(obj+"").empty();
    	$(obj+"").append(temp);
    }

}*/
/*
 * @method
 * @param func 被调用方法名称
 * @param data 后端传入数据
 * @param curpage 当前页码
 * @param pageSize 每页条数
 * @desc 数字页码载入
 */
function pageload(func,data,curpage){
	each(func,data,curpage);
	var pagenumarr=data.pageinfo.navigatepageNums;
	var arrlength=pagenumarr.length;
	if(arrlength-curpage>=5){
		// 比方说 一共有19页 现在第10页 那么不显示0~9页
		// 10, 11, 12, 13, 15,  ... , 18, 19
		pagenumarr.splice(0,curpage-1);
	}else{
		// 现在第17页 不显示0~12页
		// 13, 14, 15,16, 17, ... , 18, 19
		pagenumarr.splice(0,arrlength-5);
	}

	var pagenumtemp="";
	var $numobj=$('#numpage');
	$numobj.empty();
	if(pagenumarr.length>5){
		// 如果页面arr很长 就~~前面一半显示5个~~跳过第5个???
		$.each(pagenumarr,function(i,e){
			pagenumtemp+="<li><a href='#' name='"+e+"' >"+e+"</a></li>";
			if(i===4){
				return false;
			}
		});
		$numobj.append(pagenumtemp);
	}else{
		// 如果页码arr很短 就全部显示
		$.each(pagenumarr,function(i,e){
			pagenumtemp+="<li><a href='#' name='"+e+"'>"+e+"</a></li>";
		});
		$numobj.append(pagenumtemp);
	}

}
/*
 * @method
 * @param func 被调用方法名称
 * @param data 后端传入数据
 * @param curpage 当前页码
 * @param pageSize 每页条数
 * @desc 固定按钮a标签属性载入
 */
function each(func,data,curpage){
	var $prepage=$('#prepage li a');
	var prepage=data.pageinfo.prePage;
	$.each($prepage, function(i,e) {
		var $tempobj=$(e);
		if(i===0||prepage===0){
			// btn首页
			ahref(func,$tempobj,1);
		}else if(i===1&&prepage!==0){
			//btn上一页
			ahref(func,$tempobj,prepage);
		}
	});
	var $nextpage=$('#nextpage li a');
	var nextpage=data.pageinfo.nextPage;
	$.each($nextpage, function(i,e) {
		var $tempobj=$(e);
		var tempval=$tempobj.html();
		if(tempval==="尾页"||0===nextpage){
			ahref(func,$tempobj,data.pageinfo.pages);
		}else if(tempval==="下一页"){
			ahref(func,$tempobj,nextpage);
		}
	});
}
/*
 * @method
 * @param func 被调用方法名称
 * @param obj 页码层对象名称
 * @param pagenum 跳转页码
 * @param pageSize 每页条数
 * @desc a标签属性载入(当前页及页码范围)
 */
function ahref(func,obj,pagenum){
	return obj.attr("name",pagenum);
}

