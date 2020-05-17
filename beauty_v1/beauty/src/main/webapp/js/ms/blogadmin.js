		function todate(ts) {
			var rtndate=new Date()
			if(ts!=null){
				rtndate=new Date(parseInt(ts));
			}
			var year = rtndate.getFullYear();
			var month = rtndate.getMonth()+1;
			var day = rtndate.getDate();
			var hours = rtndate.getHours();
	        var minu = rtndate.getMinutes();
			month = month < 10 ? "0"+month:month;
			day = day < 10 ? "0"+day:day;
			return (year+'-'+month+'-'+day+' '+hours+':'+minu) ;
		}
		
		function writetable(data) {
			var n = data.rstmap.length
			var myhtml=""
				for (i=0; i<n; i++){
					var id =  data.rstmap[i].id
					var title = data.rstmap[i].title
					var type = data.typemap[i]
					var strtime = data.rstmap[i].createtime;
					var n_star = data.starmap[i];
					var n_cmt = data.cmtmap[i]
					
					var cdate = todate(strtime)
					
					myhtml += ( '<tr>' + '<th scope="row ">' + id +'</th>' 
							+ '<th>' + title + '</th>'
							+ '<th>' + type + '</th>'
							+ '<th>' + cdate + '</th>'
							+ '<th>' + n_star + '</th>'
							+ '<th>' + n_cmt + '</th>'
							+ '<th> <div class="inline"> ' 
							+ '<button type="button" class="btn btn-sm btn-outline-dark btn-upd mr-3" name="' + id + '">编辑</button>' )
//							+'<button type="button" class="btn btn-sm btn-outline-danger btn-del" name="' + id + '">删除</button>'
//							+' </div> </th>'
//							+ '</tr>' )
							if( data.rstmap[i].delFlag==false){
								myhtml+=(
										'<button type="button" class="btn btn-sm btn-outline-success btn-res" name="' + id + '">恢复</button>'		
								)
							}else{
								myhtml+=(
										'<button type="button" class="btn btn-sm btn-outline-danger btn-del" name="' + id + '">删除</button>'
								)
							myhtml+=( ' </div> </th></tr>' )
							}
				}
			blog_addhere.innerHTML=myhtml
		}
		
		function addcpn(cpn) {
			var obj=$("#numpage").find("li a")
			$(obj).each(function(){
				var num= $(this).attr("name")
			    if(num==cpn) $(this).parent().addClass("active")
			  });
		}
