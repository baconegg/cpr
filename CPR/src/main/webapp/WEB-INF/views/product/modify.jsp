<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>

<body style="margin-left: 1px">


<div id="content_wrap" >
        
    <div id="wrap" class="wrap" role="document">
        
			<!-- 제일 위부분의 파란색 바 -->
        	<div id="top-title"></div>
        	
			    <div id="content" class="row-fluid">
				     <div id="main" class="span12" role="main">
				        <div class="wpb_content_wrapper">
					       <article class="post-68 portfolio type-portfolio status-publish hentry" id="post-68">
					          <header>
					        	<h1 class="entry-title">수정페이지</h1>
					        	<span class="post-format"></span>
					            <style type="text/css">
							        .s-text {display:none;}
									.post > header .post-format, .portfolio > header .post-format {background-size:80%}
									.format-video > header .post-format, .portfolio > header .post-format.video_project_format {background-image:none;}
									.summary h3 { font-size:12px; 	}
					        	</style>
					      	  </header>
				      
						      <div class="row-fluid">
						
									<div class="entry-content">
									
							<!-- =================================================================== -->
							
										<div class="row-fluid">
											<form method="post" action="modifyAction" enctype="multipart/form-data" id="modifyAction_form" name="modifyAction_form">
											<div class="wpb_content_element span6 identity column_container">
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_left designers">
														 <div "style="margin-top: 5px">
														 	상품사진  
														 </div>
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 wpb_text_column">
															<div class="wpb_wrapper">															
																
																 
																<div id="preview">
																	<img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${pVo.productImgUUID}" id="productImg"> 
																</div>
																
															    <input type="file" id="file" onchange="previewImage(this, 'preview')" name="file">
															   
															</div> 
														</div> 
													  </div>
													  
												</div> 
											</div>  
											<div class="wpb_content_element span6 note infor column_container">
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_right designers">
														 <div "style="margin-top: 5px"></div>
													 </div>
												 <div class="row-fluid">
													<div class="wpb_content_element span12 wpb_text_column">
														<div class="wpb_wrapper">
															
															<h3>상품설명</h3>
															<p>
																<br/>	
																<input type="hidden" value="${pVo.productIdx}" name="productIdx" id="productIdx"/>
																상품명  <input type="text" value="${pVo.productName}" name="productName"/><br/>	<br/>
																상품설명	<input type="text" value="${pVo.productInfo}" name="productInfo"/><br/><br/>
																원산지 <input type="text" value="${pVo.productOrigin}" name="productOrigin"/><br/>	<br/>
																가격 <input type="text" value="${pVo.productPrice}" name="productPrice"/><br/>	<br/>			
																<p>
																판매유형  
																	<select id="productPackage" name="productPackage">
																		<option value="0" >단품</option>
																		<option value="1" >묶음 상품</option>
																	</select>
																</p><br/>
																<p>
																
																카테고리<select id="tagIdx" name="tagIdx">
																<c:forEach var="i" items="${tagList}">																
																	<option value="${ i.tagIdx}">${ i.tagName}</option>
																</c:forEach>
																
																</select>
																
																</p><br/>
																<p>
																판매방식<select id="productEvent" name="productEvent">
																	<option value="0" >일반</option>
																	<option value="1" >특가</option>
																	<option value="2" >떨이</option>
																	<option value="3" >한정</option>
																	</select>
																</p><br/>
																<p>
																	<input type="hidden"  name="productImg" value="${pVo.productImg}"/>
																	<input type="hidden"  name="productImgUUID" value="${pVo.productImgUUID}"/>
																	<div align="right">
																		<input type="button" class="btn btn-large btn-block btn-success"  id="btnModifyAction" value="완료"/>&nbsp;&nbsp;&nbsp;
																		<input type="button" class="btn btn-large btn-block btn-success"  id="btnCancel" value="취소"/>
																	</div>
																</p>	
																
															</p>		
												
														</div> 								
													</div> 
												  </div> 
											<div class="row-fluid">
											<div class="wpb_content_element wpb_single_image span12">
												<div class="wpb_wrapper">
<!-- 													<img src="" width="" height=""> -->
												</div> 
											</div> </div>		
											
											
											
											
												</div> 
											</div> 
											</form>
										</div>
							<!-- =================================================================== -->
										<div class="row-fluid">
											<div class="wpb_content_element span12 column_container">
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_left designers">
													 	<div>판매자 정보</div>
													 </div>									 
												</div> 
											</div> 
										 </div>
							<!-- =================================================================== -->
										<div class="row-fluid">
											<div class="wpb_content_element span3 left-side profile column_container">
												<div class="wpb_wrapper">
													 <div class="row-fluid">
														<div class="wpb_content_element wpb_single_image span12">
															<div class="wpb_wrapper">
																<img width="225" height="225" src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${msVo.selImgUUID}" class="attachment-medium" alt="">
															</div> 
														</div> 
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 name-box wpb_text_column">
															<div class="wpb_wrapper">												
																<p>${msVo.memberName}</p>			
																<p>${msVo.selStore}</p>
																<p>${msVo.memberTel}</p>									
															</div> 
														</div> 
													  </div> 
												</div> 
											</div>  
											<div class="wpb_content_element span9 note hidden-phone column_container">
												<div class="wpb_wrapper">
													 <div class="row-fluid">
														<div class="wpb_content_element span6 wpb_text_column">
															<div class="wpb_wrapper">
																
																<h3>상점명</h3>
																<p>
																	<input type="hidden" id="selIdx" value="${msVo.selIdx}"/>
																	상인고유번호 : ${msVo.selIdx}<br/>
																	시장명 : ${msVo.guNameMarId}<br/> 
																	업종번호 : ${msVo.selType}<br/>
						 											업종명 : ${msVo.workType}<br/>
																	상점 상세주소 : ${msVo.selAddress}<br/>
																	상점번호 : ${msVo.selStoreNo}<br/>
																	상점정보 : ${msVo.selInfo}<br/>
																	상점평가 : ${msVo.selLike}<br/>
																	
																</p>
													
															</div> 
														</div>  
														<div class="wpb_content_element span6 wpb_text_column">
															<div class="wpb_wrapper">
																
																<h3>상점번호</h3>
																<p>블라블라블라</p>
													
															</div> 
														</div>
											         </div> 
												</div> 
											</div>
										</div> 
										
										<a href="../../product/list/customer/${msVo.selIdx}">상점가기</a>
							
							
							<!-- footer... -->
							<!-- =================================================================== -->
										<div class="wpb_separator wpb_content_element ">
										</div>
										<div class="row-fluid">
											<div class="wpb_content_element span12 social column_container">
												<div class="wpb_wrapper">
													 <div class="fb_like wpb_content_element fb_type_button_count">
													 	<iframe src="http://www.facebook.com/plugins/like.php?href=http://hongikdmd.com/meme/portfolio/item/eat-color-it-color/&amp;layout=button_count&amp;show_faces=false&amp;action=like&amp;colorscheme=light" scrolling="no" frameborder="0" allowtransparency="true">
													 	</iframe>
													 </div>
													 <iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://platform.twitter.com/widgets/tweet_button.1372833608.html#_=1373361839687&amp;count=horizontal&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=http%3A%2F%2Fhongikdmd.com%2Fmeme%2Fportfolio%2Fitem%2Feat-color-it-color%2F&amp;size=m&amp;text=Eat%20Color!%20It%20Color!&amp;url=http%3A%2F%2Fhongikdmd.com%2Fmeme%2Fportfolio%2Fitem%2Feat-color-it-color%2F" class="twitter-share-button twitter-count-horizontal" title="Twitter Tweet Button" data-twttr-rendered="true" style="width: 110px; height: 20px;">
													 </iframe>
													 <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>								 
												</div> 
											</div> 
										 </div>
						              
									</div>
						
						      </div>
						      
						      <footer>
						      </footer>  
						    </article>
				  	    </div> <!-- end .wpb_content_wrapper -->
				     </div><!-- /#main -->
				      
				        <div class="footer-h3">
						    <h2>판매자의 다른 상품</h2>
							<div class="row-fluid other_projects_footer">
								      
								<c:forEach var="list" items="${preList}">
							          <article id="post-72" class="post-72 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
								          
								           <c:choose>
							          	  		<c:when test="${sessionScope.selIdx == msVo.selIdx}">
							          	  			<a href="view/seller?productIdx=${list.productIdx }">	
							          	  		</c:when>
							          	  		
							          	  		<c:otherwise>
							          	  			<a href="view/customer?productIdx=${list.productIdx }">
							          	  		</c:otherwise>
							          	  </c:choose>
								          
								             <div class="post-thumb" style="top: 0px; z-index: 0;" >
								           		<div class="cover"></div>								            
									            <img width="400" height="300"  src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${list.productImgUUID}" class="attachment-portfolio-thumb wp-post-image" alt="DanceMonster_thumb" style="opacity: 1;">
									         </div>
								           
								           	 <header style="opacity: 0; display: none; top: 0px; z-index: 900;">
									            <div class="summary">
										             <h3>
										              	<span class="feature">${list.productName}</span>
										             </h3>
											            <div class="s-text" style="margin-top: 0px; position: relative; top: -33px;">
											            <p>${list.productInfo}</p>
										             </div>
									            </div>
									            <span class="post-format video_project_format"></span>
								             </header>
								          </a>
							         </article>
			                    </c:forEach>
						  	   
							</div>
						</div>
			    
			    </div><!-- /#content -->
  
    </div><!-- /#wrap -->
</div>


	<script type="text/javascript">
	
	// 수정 완료 클릭시...
	$("#btnModifyAction").bind('click', function() {
	
	var fdata = new FormData($("#modifyAction_form")[0]);
	
	console.log(fdata);
	
	$.ajax({
		url:"modifyAction",
		type:"POST",
		data:fdata,
		cache: false,
	    contentType: false,
	    processData: false,		
		
		success: function() {
	    	alert("상품 수정이 완료되었습니다.");
	    	var productIdx = $("#productIdx").val();
	    	location.href = "view?productIdx=" + productIdx;
	    }
	});
	
	});
	
	
	
	// 판매유형 		
	$("#productPackage").val("${pVo.productPackage}");
	// 판매 방식
	$("#productEvent").val("${pVo.productEvent}");
	
	// 카테고리
	var tagIdx = "${pVo.tagIdx}";			
	$("#tagIdx").val(tagIdx);

	// 취소 클릭시...
	$("#btnCancel").on('click', function(){		
		
		var productIdx = $("#productIdx").val();
		location.href = "view?productIdx=" + productIdx;		
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 이프 엘스로 나누어 줘야 됨...
	var inhtml = '';
	var memLev = '${sessionScope.memberLev}';	
	//console.log(memLev);	
	//if(memLev == 2){
	//	inhtml = '<a href="/cpr/product/list/'+${msVo.selIdx}+'">상점가기(셀러)</a>';
	//}else{
	//	inhtml = '<a href="/cpr/product/list/'+${msVo.selIdx}+'">상점가기(커스터머)</a>';
	//}
	inhtml = '<a href="/cpr/product/list/'+${msVo.selIdx}+'">상점가기</a>';
	$('#menu-item-5').html(inhtml);
	
	$('#menu-item-5').attr('class', 'change btn btn-primary');
	</script>
</body></html>