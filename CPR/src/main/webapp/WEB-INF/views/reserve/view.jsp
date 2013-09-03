<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
<%-- 
// 	session.setAttribute("customer", 5);
// 	session.setAttribute("seller", 2);
// 	session.setAttribute("Lev", "seller");
--%>

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
					        	<h1 class="entry-title">주문내역 상세</h1>
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
											
								<!-- 			<div class="wpb_content_element span6 identity column_container"> -->
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_left designers">
														 
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 wpb_text_column">
															<div class="wpb_wrapper">															
																
																<h3>${ReserveVO.productName}</h3>
															<p>
																<br/>	
																<form id="reserve" method="post">
																<input type="hidden" value="${ReserveVO.reserveIdx}" name="reserveIdx" id="reserveIdx">																
																<input type="hidden" value="${ReserveVO.productIdx}" id="productIdx" name="productIdx">														
																<input type="hidden" value="${ReserveVO.customerIdx}" id="customerIdx" name="customerIdx">														
<!-- 																<h1>상품</h1><br/>	 -->
																 <div id="itemAdd">
																 <img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${ReserveVO.productImgUuid}" />
																 </div>
																 
																 <h1>
																	
																</h1><br/>
																<h1>
																 주문시간 : 
																</h1><br/>
																 ${ReserveVO.reserveTime}
																<br/><br/>
																<h1>
																가격
																</h1><br/>
																${ReserveVO.productPrice}
																<br/><br/>
																<h1>
																상품 상세내역
																</h1><br/>
																${ReserveVO.productInfo}
																<br/><br/>
																<h1>
																 주문 요청사항 : 
																</h1><br/>
																 ${ReserveVO.reserveMemo}
																<br/><br/>
																<h1>
																 수취시간 : 
																</h1><br/>
																 ${ReserveVO.reserveReceiveTime}
																<br/>
																
																
																<div id="totalPrice">	
																
																</div><br/>
																											
																<h1>
											<!-- ============================================= 수정,삭제,목록 ========================================================= -->					
																<c:choose >																	

																	<c:when test="${ ReserveVO.customerIdx == sessionScope.customerIdx }">
																		<br/>
																	
																		<!-- <input type="button" value="수정" id="modifyBtn">&nbsp;&nbsp;&nbsp; -->
																		<c:if test="${ReserveVO.reserveFlag == 0 }">	
																			<input class="btn btn-large btn-block btn-success" type="button" value="예약취소" id="cancelBtn">&nbsp;&nbsp;&nbsp;
																		</c:if>
																		<input class="btn btn-large btn-block btn-success" type="button" value="목록" id="listBtn">
																		
																	</c:when>
																	<c:otherwise>
																		<br/>
																		<input class="btn btn-large btn-block btn-success" type="button" value="목록" id="listBtn">
																		
																		<c:if test="${ReserveVO.selIdx == sessionScope.selIdx }">
																			<input class="btn btn-large btn-block btn-success" type="button" value="상품준비완료" id="orderBtn">
																		</c:if>
																	</c:otherwise>
																</c:choose>
										<!-- ====================================================================================================== -->				
																</h1><br/>	
																</form>	<br/>
									<%-- 	<!-- =========================================댓글은 필요없죠잉 ========================================================= -->					
																    <c:choose >																	
																		
																		<c:when test="${sessionScope.seller =! null}">
																		<c:if test="${sessionScope.selIdx != null}">
																			<br/>
																			<form id="replyRegister" method="post">
																			<input  type="hidden" id="selIdx"  name="selIdx" value="${sessionScope.selIdx }"  />
																			<input  type="hidden" id="requestIdx"  name="requestIdx" value="${RequestVO.idx}"  />
																			<input style="width:87%" type="text" id="replys"  name="replys"   />&nbsp;&nbsp;
																			<input type="button" value="경매 등록" id="replyBtn" />&nbsp;&nbsp;
																			</form>
																		</c:if>
																		
																		</c:when>
																		<c:otherwise>
																		<br/>?
																		
																		</c:otherwise>
																</c:choose> 
																	<br/>
																	<br/>
																		
												
															</div> 
																	<br/>
														</div> 
													  </div>
									 <!-- /////// -->
												</div>	  
												</div>	  
												</div>	   --%>
										<!-- ================================댓글 뿌리기는 곳~!===================================================================== -->				
																<%-- 	<div id="replyAdd" style="float:none;" >
																			<c:forEach var="replyList" items="${replyList}">
																	<div class="row-fluid">

																		<div class="entry-content">
																			<div class="row-fluid">
																				<div class="wpb_content_element span3 left-side1 column_container">
																					<div class="wpb_wrapper">
																						<div class="row-fluid">
																							<div class="wpb_content_element wpb_single_image span12">				
																								<div  id="buttonDIV">
																												<c:if test="${replyList.replyFlag == 2 }">
																													
																													<table class="tradeComplete" style="width:200;height:200;" background="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${replyList.selImgUUID }" class="attachment-medium" >
																														<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
																														<tr>
																														<td style="color:white;font-size:30px;background-color:black;opacity:0.8;" >
																														완료 
																														</td>
																														</tr>
																													</table>
																													<br>
																													<img style="width:225;height:225" src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${replyList.selImgUUID }"  class="attachment-medium" title="완료" >
																												</c:if>
																												<c:if test="${replyList.replyFlag < 2 }">
																													<br>
																													<img style="width:225;height:225" src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${replyList.selImgUUID }"  class="attachment-medium" >
																												</c:if>
																											
																												<c:if test="${sessionScope.seller == replyList.selIdx }">
																													<input type="button" id="replyModifyBtn" name="replyModifyBtn" data-replyIdx="${replyList.replyIdx }" data-reqestIdx="${replyList.requestIdx }"  value="경매 수정" />
																													<input type="button" id="replyRemoveBtn" name="replyRemoveBtn"  data-replyIdx="${replyList.replyIdx }" data-reqestIdx="${replyList.requestIdx }" value="경매 삭제" />
																												</c:if>
																										
																												<c:if test="${sessionScope.customer == RequestVO.customerIdx}">
																													<c:if test="${RequestVO.flag == 1 } ">
																													<input type="button" id="replyTenderBtn" name="replyTenderBtn" data-replyIdx="${replyList.replyIdx }" data-reqestIdx="${replyList.requestIdx }"  value="경매 입찰" />
																													</c:if>
																													<c:if test="${RequestVO.flag == 2 } ">
																													</c:if>
																												</c:if>
																												
																								
																								</div> 
																						 </div> 
																					</div>
																					</div>
																					</div>  
																						<div class="wpb_content_element span9 column_container">
																						<div class="wpb_wrapper">
																										<div class="row-fluid">
																											<div class="wpb_content_element span12 wpb_text_column"></div>
																										</div>
																										<div class="row-fluid">
																											<div class="wpb_content_element span6 wpb_text_column">
																													<div class="wpb_wrapper">
																												
																														<p>
																															<h2 style="background:silver;padding:4px">상점 소개</h2>
																															<input type="hidden" id="selIdx" value="${ replyList.selIdx}"/>
																															시장명 : ${replyList.guNameMarId }<br/>
																															상점명 : ${replyList.selStore }   <br/>
																				 											상점소개 : ${replyList.selInfo }<br/>
																															상점위치 : ${replyList.selAddress }<br/>
																															상점평가 :${replyList.selLike }   <br/>      
																														</p>
																													</div>
																											</div> 
																										
																												<div class="wpb_content_element span6 wpb_text_column">
																															<div class="wpb_wrapper">
																																
																																<p>
																																	<h2 style="background:silver;padding:4px">경매 등록 내역</h2>
																																	<input style="width:97%;height:130px;border:0px;background:none;" type="text" id="reply${replyList.replyIdx}"  name="reply${replyList.selIdx}" value=" ${replyList.replys }"  readonly="readonly"/>
																																	
																																</p>
																													
																															</div> 
																												</div>
																						         
																									</div> 
																						</div>
																						</div> 
																			</div>
																			</div>
																			</div>
																			  </c:forEach>
																	</div>	
																 --%>
										<!-- ====================================================================================================== -->																									
													  
												</div> 
									
								
							
							<!-- footer... -->
							<!-- =================================================================== -->
								
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
						              
									
						
						    
						      
						      <footer>
						      </footer>  
							
							</article>
				  	    </div> <!-- end .wpb_content_wrapper -->
				     </div><!-- /#main -->
				      
				       
			    </div><!-- /#content -->
  	
    </div><!-- /#wrap -->
</div>

</body></html>


<script>

/* =========================================삭제======================================================= */
$('#cancelBtn').on('click',function(){
	if('${sessionScope.customerIdx}'=='${ReserveVO.customerIdx}' ){
		if(confirm("상품 예약을 취소 하시겠습니까?")){
			 
			$.post('reserveCancel',{ "reserveIdx":$('#reserveIdx').val() }).done(function(data){
				if(data=="1"){
					alert("상품예약이 취소 되셨습니다.");
					location.href="list?page=${sessionScope.cri.page}";
				}else if(data == "2"){
					alert("오류가 발생되어 /n 주문이 취소 되지 않았습니다 /n 잠시후 다시 해주세요." );
				}
				
			}); 
		}else{
			return;
		}
	}else{
		alert('주문하신 상품이 아닙니다.');
	}
});

/* =========================================목록으로 가자======================================================= */
 $('#listBtn').on('click',function(){
		console.log('들어왔어요 listBtn');
		location.href="list?page=${sessionScope.cri.page}";
 });
/* =========================================상품 준비완료 ======================================================= */
 $('#orderBtn').on('click',function(){
		console.log('들어왔어요 orderBtn');
		if(confirm("상품 준비완료 처리 진행하시겠습니까?")){
			 
			$.post('reserveConfirm',{ "reserveIdx":$('#reserveIdx').val() }).done(function(data){
				if(data = 1){
					location.href="list?page=${sessionScope.cri.page}";	
				}else{
					alert("오류가 발생되어 /n 상품 준비완료 처리가 되지 않았습니다 /n 잠시후 다시 해주세요." );	
				}
			});
			
		}else{
			return;
		}
			
 });


		
 
 	//역경매 메뉴 만들기..
//	$('#menu-item-8').attr('style', 'display: inline-block');
	$('#menu-item-9').attr('class', 'change btn btn-primary');

</script>
