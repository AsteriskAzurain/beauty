<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html> <!-- html5的定义,如果不这么定义编辑器格式会有问题 -->
<html>
<head>
<meta charset="UTF-8">
<title>美 一眼望穿 后台管理系统</title>
<% 
String path = request.getContextPath();
request.setCharacterEncoding("UTF-8");
%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" >
    <link href="<%=path %>/css/ms/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/css/ms/style.css">
    <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css">
    
        <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=path %>/css/ms/select2.css">
    <link rel="stylesheet" href="<%=path %>/css/ms/summernote-bs4.css">
    <link rel="stylesheet" href="<%=path %>/css/ms/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=path %>/css/ms/bootstrap-select.css">
    
    <style>
    #typebox{
    	max-height: 277.333px; 
    	overflow: hidden; 
    	min-height: 0px; 
    	position: absolute; 
    	transform: translate3d(0px, 40px, 0px); 
    	top: 0px; 
    	left: 0px; 
    	will-change: transform;
    }
    </style>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">预览博客</h5>
                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
            </div>
            <div class="modal-body" id="preview">
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-secondary" data-dismiss="modal">关闭</a>
            </div>
        </div>
    </div>
</div>

    <!-- main wrapper -->
    <div class="dashboard-main-wrapper">

        <!-- left sidebar -->
		<script type="text/javascript">
			//var roleid = ${roleid}
			var roleid=<%=session.getAttribute("roleid")%>
		</script>
		<script type="text/javascript" src="<%=path %>/js/ms/sidebar.js"></script>
        <!-- end left sidebar -->
        
        <!-- wrapper  -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<!-- 正文开始 -->
		                <div class="main-content container-fluid p-0">
		                    <div class="email-head">
		                        <div class="email-head-title">编辑博客<span class="icon mdi mdi-edit"></span></div>
		                    </div>
		                    <form  method="post" action="<%=path %>/back/updateblog" enctype="application/json">
		                    	<div class="email-compose-fields">
			                        <div class="subject">
			                        	<div class="form-group row pt-2">
			                                <label class="col-1 col-md-1 control-label p-0 mb-3">ID</label>
			                                <div class="col-8 col-md-8">
			                                	<div class="form-group">
	                                                <input id="id" type="text" class="form-control"  disabled="disabled" value="${thisblog.id }">
                                            	</div>
											</div>
			                            </div>
			                            <div class="form-group row pt-2">
			                                <label class="col-1 col-md-1 control-label p-0 mb-3">分类</label>
			                                <div class="col-8 col-md-8">
												<div class="dropdown bootstrap-select">
													<select name="typeid" class="selectpicker" tabindex="-98" id="select_addhere"></select>
												</div>
											</div>
			                            </div>
			                            <div class="form-group row pt-2">
			                                <label class="col-1 col-md-1 control-label p-0 mb-3">标题</label>
			                                <div class="col-8 col-md-8">
			                                    <input name="title" class="form-control" type="text" placeholder="起一个吸引人的标题" required="required" value="${thisblog.title }">
			                                </div>
			                                <div class="col-2  col-md-2">
			                                	<input type="hidden" name="id" value="${thisblog.id }"> 
			                                	<button id="prebtn" type="button" class="pull-right btn btn-primary px-4"  data-toggle="modal" data-target="#exampleModal">预览</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
		                    	 <div class="email editor">
			                        <div class="col-md-12 p-0">
			                            <div class="form-group">
			                                <label class="control-label sr-only" for="summernote">描述 </label>
			                                <textarea class="form-control" id="summernote" name="content" rows="6"  required="required" >${thisblog.content }</textarea>
			                                
			                            </div>
			                        </div>
			                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row">
			                         
			                         	<input type="hidden" id="writer" name="userid" value="${thisblog.userid }">	                         	
			                         	
										<div class="card card-figure col-3">
		                                    <figure class="figure">
		                                        <div class="figure-img">
		                                            <img class="img-fluid" src="<%=path %>/${thisblog.picUrl1 }" alt="Card image cap">
		                                            <div class="figure-action">
														<div class="custom-file custom-file-naked">
															<input name="picUrl1" type="file" class="custom-file-input" id="picfile1" accept="image/*"> 
															<label class="custom-file-label" for="customFile"> 
																<a href="#" class="btn btn-block btn-sm btn-primary">上传</a>
															</label>
														</div>
													</div>
		                                        </div>
		                                        <figcaption class="figure-caption">
		                                           <input name="pic1" type="text" class="text-muted mb-0"  placeholder="添加图片描述" value="${thisblog.pic1 }"> 
		                                        </figcaption>
		                                    </figure>
		                                </div>
		                                <div class="card card-figure col-3">
		                                    <figure class="figure">
		                                        <div class="figure-img">
		                                            <img name="picUrl2" class="img-fluid" src="<%=path %>/${thisblog.picUrl2 }" alt="Card image cap">
		                                            <div class="figure-action">
		                                                <div class="custom-file custom-file-naked">
															<input type="file" class="custom-file-input" id="picfile2"> 
															<label class="custom-file-label" for="customFile"> 
																<a href="#" class="btn btn-block btn-sm btn-primary">上传</a>
															</label>
														</div>
		                                            </div>
		                                        </div>
		                                        <figcaption class="figure-caption">
		                                            <input name="pic2" type="text" class="text-muted mb-0"  placeholder="添加图片描述" value="${thisblog.pic2 }"> 
		                                        </figcaption>
		                                    </figure>
		                                </div>
		                                <div class="card card-figure col-3">
		                                    <figure class="figure">
		                                        <div class="figure-img">
		                                            <img  name="picUrl3" class="img-fluid" src="<%=path %>/${thisblog.picUrl3 }" alt="Card image cap" id="pic3">
		                                            <div class="figure-action">
		                                                <div class="custom-file custom-file-naked">
															<input type="file" class="custom-file-input" id="picfile3"> 
															<label class="custom-file-label" for="customFile"> 
																<a href="#" class="btn btn-block btn-sm btn-primary">上传</a>
															</label>
														</div>
		                                            </div>
		                                        </div>
		                                        <figcaption class="figure-caption">
		                                           	<input name="pic3"  type="text" class="text-muted mb-0" placeholder="添加图片描述" value="${thisblog.pic3 }"> 
		                                        </figcaption>
		                                    </figure>
		                                </div>
		                            </div>
			                        <div class="email action-send">
			                            <div class="col-md-12 ">
			                                <div class="form-group text-right">
			                                    <button id="btn-data" class="btn btn-primary btn-space" type="submit"><i class="icon s7-mail"></i> 提交</button>
			                                    <button class="btn btn-secondary btn-space" type="button" onclick="javascript: window.location.href='../ms/ms-blog.jsp'"><i class="icon s7-close"></i> 取消</button>
			                                </div>
			                            </div>
			                        </div>
			                       
			                    </div>
		                    </form>
		                </div>
						<div id="rsthtml"></div>
					</div>
                </div>
            </div>
            <!-- footer -->
            <div class="footer text-center ">
                Copyright &copy; 2020. reachableBeauty All rights reserved.
            </div>
            <!-- end footer -->
        </div>
        <!-- end main wrapper -->
    </div>

    <!-- end main wrapper -->

    <!-- Optional JavaScript -->

    <script src="<%=path%>/js/jquery/jquery.min.js"></script>
	<script src="<%=path%>/js/popper.js/umd/popper.min.js"></script>
	<script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
	<script src="<%=path%>/js/jquery.cookie/jquery.cookie.js"> </script>
	<script src="<%=path%>/js/js.cookie.min.js"></script>
	<script src="<%=path%>/js/front.js"></script>
	<script src="<%=path%>/js/custom/getcookie.js"></script>
    <script src="<%=path%>/js/bootstrap/bootstrap.bundle.js"></script> 
    <script src="<%=path%>/js/ms/jquery.slimscroll.js"></script>
    <script src="<%=path%>/js/ms/select2.min.js"></script>
    <script src="<%=path%>/js/ms/summernote-bs4.js"></script>
    <script src="<%=path%>/js/ms/main-js.js"></script>
    <script src="<%=path%>/js/ms/summernote-zh-CN.js"></script>
    <script type="text/javascript" src="<%=path%>/js/ms/htmlencode.js"></script>
    <script src="<%=path%>/js/ms/bootstrap-select.js"></script>

    <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            lang : 'zh-CN',
            minHeight : 300,
            dialogsFade : true,// Add fade effect on dialogs
            dialogsInBody : true,// Dialogs can be placed in body, not in
            // summernote.
            disableDragAndDrop : false,// default false You can disable drag
            // and drop
            toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['height', ['height']],
	          ['table', ['table']],
	          ['insert', ['link']],
	          ['view', ['fullscreen', 'codeview']]
	        ]
        });
    });
    </script>
	<script type="text/javascript">
		$(window).on('load', function(){
			
			$("#sidebar").find("a").removeClass("active");
			$("#blog-admin a").addClass("active");
			$("#blog-up a").addClass("active");
			
			$("#prebtn").click(function(){
				var markupStr = $('#summernote').summernote('code');
				preview.innerHTML=markupStr
			});
			
			$(".custom-file-input").change(function(){
				  var text=$(this).val();
				  console.info(text);
				 /*  var i=text.lastIndexOf("\\");
				  text=text.substring(i+1); */
			      var file = $(this).get(0).files[0];
			      var reader = new FileReader();
			      reader.readAsDataURL(file);
			      var obj=$(this).parents(".figure-img").children("img").get(0)
			      reader.onload=function(e){
			        console.log(e);
					$(obj).attr("src",e.target.result)
			      }
			  });
			
			$.ajax({
				url: '<%=path %>/back/loadtype',
				type: 'get',
				dataType:'JSON',
				success:function(response,status,xhr){
					console.log(response)
					console.log(status)
					console.log(xhr);
					afterajax(response)
				},
				error:function(){
					alert("error");
				}
			});
		});
		
		function afterajax(data) {
			$("#select_addhere").empty();
			var n = data.typemap.length
			var myhtml=""
			for (i=0; i<n; i++){
				var id = data.typemap[i].id
				var typename = data.typemap[i].typename;
				myhtml+=('<option value="' + id + '">' + typename + '</option>')
			}
			select_addhere.innerHTML=myhtml
			//$('#select_addhere').selectpicker('val',${thisblog.typeid});
			$('select').selectpicker("refresh");
			$('#select_addhere').selectpicker('val',${thisblog.typeid});
			
		}
		
	</script>
</body>
</html>