<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body style="margin-left: 1px">
		<div id="wrap" class="wrap" role="document">
			<!--슬라이드용 이미지-->
			<div class="row-fluid">
				<!-- <div class="span12 wpb_top_slider wpb_gallery">
					<span id="portfolio_top_loader"></span>
					<div class="wpb_gallery_slides flexslider wpb_flexslider" data-interval="5" data-flex_fx="fade">
						<ul class="slides">
							
							<li>
								<iframe src="http://player.vimeo.com/video/52622122" width="100" height="56" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
							</li>
							"../resources/images/market-wallpaper-1024x576.jpg"
						  	<li>
						  	   <img  src="../resources/images/default/join/01.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="../resources/images/default/join/02.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="../resources/images/default/join/03.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="../resources/images/default/join/04.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="../resources/images/default/join/05.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="../resources/images/default/join/06.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
        				</ul>
					</div>
				</div> -->
				<!-- 등록화면 위에 슬라이드 더러워서 태구가 버렸음... -->
				<!-- 슬라이드 끝 -->
				<!-- END .wpb_top_slider -->
			</div>			
			<div id="top-title"></div>
			<div id="content" class="row-fluid">
				<div id="main" class="span12" role="main">
					<div class="wpb_content_wrapper">
						<article class="post-83 portfolio type-portfolio status-publish hentry" id="post-83">
							<header>
								<h1 class="entry-title">!!!</h1>
								<p class="portfolio_categories">
									<a href="http://hongikdmd.com/meme/portfolio/category/interaction/" title="???">???</a>
								</p>
								<span class="post-format video_project_format"></span>
								<style type="text/css">
									.s-text {
										display: none;
									}
									.post > header .post-format, .portfolio > header .post-format {
										background-size: 80%
									}
									.format-video > header .post-format, .portfolio > header .post-format.video_project_format {
										background-image: none;
									}
									.summary h3 {
										font-size: 12px;
									}
								</style>
							</header>
																					
								<div class="entry-content">
									<div class="row-fluid">
										<div class="wpb_content_element span3 left-side1 column_container">
											<div class="wpb_wrapper">
												<!-- 1 start -->
												<div class="row-fluid">
													<div class="wpb_content_element wpb_single_image span12	">
														<div class="wpb_wrapper">
															<!--<img src="qtest.jpg" width="400" height="130" />-->
															
															
															    	<div class=" wpb_wrapper" id="manual" name="manual">
															    		<!-- <h3>상품 등록 설명 </h3>
															    		<p class=" PIN_1373356420229_hazClick" >&lt판매 유형&gt<br/> 
															    		 단품 , 묶음 상품 선택 하시면 됩니다.<br/><br/>
															    		 &lt태그 카테고리&gt<br/> <br/>
															    		 태그에 상활별(시간,날씨등) 조건에 따라 사이트에서 노출 됩니다 (중복선택불가)<br/><br/>
															    		 &lt판매 방식&gt<br/> <br/>
															    		 일반, 특가, 떨이, 한정  상품 노출시 상품명 앞에 표시 됩니다 (기본 일반으로 설정되어있습니다.) <br/><br/>
															    		 &lt상품명&gt<br/> <br/>
															    		 단품시 상품명 , 패키지시 요리명을 입력해주세요<br/><br/>
															    		 &lt판매가&gt<br/> <br/>
															    		 상품 판매가를 합산하여 올려주시면 됩니다 .<br/><br/>
															    		 &lt상품설명&gt<br/> <br/>
															    		 상품 설명을 넣어주시면 됩니다 ( 패키지 상품시에는 상품 구성 내역을  이곳에 넣어주세요 ) <br/><br/>
															    		 </p> -->
															    	</div>
															
															 
															
														</div>
													</div>
												</div>											
											</div>
										</div>
						
									
							
									<div class="wpb_content_element span9 column_container">
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">

													<div class="wpb_wrapper" id="join_seller">
															<h3>상품등록</h3>
															
									<form id="reqeustForm" method="post" action="registAction" >
														
															<br/>
															<p>
																<br />제목</br>
																<input type="text" name="title" id="title" value="" />
						<!-- ======================================================세션에서 멤버 idx 받아라 그래야 게시글에 아이디 넣지요=============================================================================== -->
																<input type="hidden" name="customerIdx" id="customerIdx" value="5"/>
						<!-- ===================================================================================================================================================== -->
															</p><br />
														
															<p>
																
														
																  구: 
																  <input type="text" style="width: 200px" id="tags" name="guName" value="" />
																	시장: 
																  <input type="text" style="width: 200px" id="market" name="marketName" value="" />
															
 
															</p><br/>
														
														
														
															<p>
																<br />상품 구성</br>
																
																상품명 : <input style="width:110px" type="text" class="itemName" id="itemName1"	 name="itemName" value="" />&nbsp;&nbsp;
																수량 : <input style="width:110px" type="text" 	id="itemQty1" 	name="itemQty" value="" />&nbsp;&nbsp;
																가격 : <input style="width:110px" type="text" 	id="itemPrice1"	 name="itemPrice" value="" />&nbsp;&nbsp;
																<input type="button" id="itemAdd" name="itemAdd" value="상품추가" />
																<input type="button" value="상품삭제" id="removeBtn">
																<br/>
																
																<div id="itemAddDiv">
																</div>
																<input type="hidden" id="items" name="items" value="" />
															</p><br />
															<p>
															 수취시간 :
																 
																 <input type="text" id="receiveTime" name="receiveTime">
																</p><br/>			
															
															<p>
																<br />요청 사항</br>
																<input type="text" id="memo" name="memo" value="" />
																
																
															</p><br />
															<p>
																 <input id="registerBtn" name="registerBtn" type="button" value="역경매 상품등록">
																 	
															</p><br />
																										
														
															<p>
																
																	</p><br/>
															<p>
																	
															</p><br />
															
														
																						
															<p>
															</p><br />
															<p>
																											
															</p>
															<br />
														
														</form>		
															
																										
													</div>
												</div>
											</div>
										</div>
									</div>
									
					
									
								</div>															
																		
							
						</article>
					</div>
					<!-- end .wpb_content_wrapper -->
				</div><!-- /#main -->
			
			</div><!-- /#content -->
	</div>	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  
  	
  	
  	<link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
	
			
	<link rel="stylesheet" media="all" type="text/css" href="/cpr/resources/css/jquery-ui-timepicker-addon.css" />
	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-sliderAccess.js"></script>
  	 <script src="/cpr/resources/js/serialize.js" ></script>
  <script>
  
/*   console.log("aaaaaa");
   */
 /*  console.log(" ${marketname}");
 */
  $(function() {
   var marketname = '${marketname}'; 
   console.log("===========================================================");
	var marketname1 = marketname.split("[");
   	var marketname2 = marketname1.toString();	
	var marketname3 = marketname2.split("]");
   	var marketname4 = marketname3.toString();	
   var marketdata = marketname4.split(","); 
  
  

   
   var guname = '${guname}'; 
   console.log("===========================================================");
	var guname1 = guname.split("[");
   	var guname2 = guname1.toString();	
	var guname3 = guname2.split("]");
   	var guname4 = guname3.toString();	
   var gudata = guname4.split(","); 

   var itemList = '${requestItemList}';
   var itemData = itemList.split(",");
   
   console.log("========================================");
   
   
  	$( "#tags" ).autocomplete({
      source: gudata
    }); 
  	$( "#market" ).autocomplete({
      source: marketdata
    }); 
  	$( ".itemName" ).autocomplete({
      source: itemData
    }); 
  	
  }); 
 
 
 $("#receiveTime").on('click', function(){
	
		$('#receiveTime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			controlType: 'select',
			timeFormat: 'TT HH:mm'
		});
		
	});
 
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 window.onload = function(){
	 
		$('#receiveTime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			controlType: 'select',
			timeFormat: 'TT HH:mm'
		});
		
		
		var add = "2" 	;
		
		
		
		$('#itemAdd').on('click', function(){
			
			if(add > 10){
	            alert("10개 까지만 추가 할수있습니다 ");
	            return false;
			}   
			console.log("들어오냐?");
			var html = "";
				html += '<div id="item'+add+'">상품명 : <input style="width:110px" type="text" class="itemName"  id="itemName'+add+'" name="itemName'+add+'" value="" />&nbsp;&nbsp'
						+' 수량 : <input style="width:110px" type="text" id="itemQty'+add+'" name="itemQty'+add+'" value="" />&nbsp;&nbsp'
						+' 가격 : <input style="width:110px" type="text" id="itemPrice'+add+'" name="itemPrice'+add+'" value="" />&nbsp;&nbsp'
						+'</div>';
			add++;
			console.log(add);
			
			/*  $('#itemAddDiv').innerhtml(html);
			 */
			 $('#itemAddDiv').append(html); 
			 
			 
			 var itemList = '${requestItemList}';
			 var itemData = itemList.split(",");
				$( ".itemName" ).autocomplete({
				      source: itemData
				    }); 
			 
			 
		});
		
		 $("#removeBtn").on('click',function () {
				
			 if(add==2){
		          alert("상품이 1개 이상 존재 등록 하셔야 합니다.");
		          return false;
	         }   
			 	
			 add--;
			console.log(add);
			 
	        $("#item"+add).remove();
			 
	     });
		
		 
		 $('#registerBtn').on("click",function(){
				if(confirm("글을 등록 하시겠습니까?")){
						console.log("itemAdd 누름");
						var msg = '';
						for(var i = 1; i < add; i++){
					   	    var itemName = $('#itemName' + i).val();
					   	 	msg +=itemName.replace(/(^\s*)|(\s*$)/gi, "")+",";
					   	    var	itemQty = $('#itemQty' + i).val();
					   	 	msg +=itemQty.replace(/(^\s*)|(\s*$)/gi, "")+",";
					   		var itemPrice = $('#itemPrice' + i).val();
					   	 	msg +=itemPrice.replace(/(^\s*)|(\s*$)/gi, "")+"/";
						}
						
						console.log(msg);
						
		
				var tags = $('#tags').val();
				$('#tags').val(tags.replace(/(^\s*)|(\s*$)/gi, ""));		
				console.log(tags);
				
				var market = $('#market').val();
				$('#market').val(market.replace(/(^\s*)|(\s*$)/gi, ""));		
				console.log(market);
				
				$('#items').val(msg);
			
						var obj = $('#reqeustForm');
						var json = JSON.parse(JSON.stringify(obj.serializeObject()));
						console.log(json);
						 
						 
						$.post('registerAction',json).done(function(data){
							if(data=="성공"){
								alert("등록 성공");
								/* location.href="" */
							}else if(data == "실패"){
								alert("등록 실패");
							}
							
						}); 
				}else{
					return;
				}
		});
		 
 };
 
//역경매 메뉴 만들기..
	$('#menu-item-7').attr('style', 'display:block');
	$('#menu-item-7').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
  </script>
</body>
</html>