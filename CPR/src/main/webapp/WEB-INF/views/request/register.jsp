<%@page import="org.shinyul.util.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<body style="margin-left: 1px">
		<div id="wrap" class="wrap" role="document">
			<div class="row-fluid">
			</div>			
			<div id="top-title"></div>
			<div id="content" class="row-fluid">
				<div id="main" class="span12" role="main">
					<div class="wpb_content_wrapper">
						<article class="post-83 portfolio type-portfolio status-publish hentry" id="post-83">
							<header>
								<h1 class="entry-title">패키지 매칭</h1>
								<p class="portfolio_categories">
								</p>
<!-- 								<span class="post-format video_project_format"></span> -->
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
							
									<div class="wpb_content_element span8 column_container">
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">

													<div class="wpb_wrapper" id="join_seller">
<!-- 															<h3>상품등록</h3> -->
										<form id="reqeustForm" method="post" action="registAction" >
														
															<p>
																<br/><h2>제목</h2><br/>
																<input placeholder="제목을 입력해 주세요." type="text" name="title" id="title" value="" />
						<!-- ======================================================세션에서 멤버 idx 받아라 그래야 게시글에 아이디 넣지요=============================================================================== -->
																<input type="hidden" name=<%=Constant.Session.CUSTOMER_IDX %> id="customerIdx" value="${sessionScope.customerIdx}"/>
																<input type="hidden" name=<%=Constant.Session.MEMBER_ID %> id="memberId" value="${sessionScope.memberId}"/>
						<!-- ===================================================================================================================================================== -->
															</p><br/><br/>
															<p>
																	<br/><h2>시장검색</h2><br/>
																  <input type="text" placeholder="지역구를 입력해 주세요." style="width: 200px" id="tags" name="guName" value="" />
																   <input type="text" placeholder="시장을 입력해 주세요." style="width: 200px" id="market" name="marketName" value="" />
															</p><br/><br/>
														
															<p>
																<br /><h2>상품 구성</h2><br/>
																	<input placeholder="상품명" title="상품명" style="width:100px" type="text" class="itemName" id="itemName1"	 name="itemName" value="" />&nbsp;&nbsp;
																	<input placeholder="수량" title="수량" style="width:40px" type="text" 	id="itemQty1" 	name="itemQty" value="" />&nbsp;&nbsp;
																	<input placeholder="가격" title="가격" style="width:70px" type="text" 	id="itemPrice1"	 name="itemPrice" value="" />&nbsp;&nbsp;
															
																	<input type="button" id="itemAdd" name="itemAdd" value="상품추가" class="btn btn-block" />
																	<input type="button" value="상품삭제" id="removeBtn" class="btn btn-block" />
																	
																<div id="itemAddDiv">
																</div>
																<input type="hidden" id="items" name="items" value="" />
															</p><br/><br/>
															<p>
															<h2> 수취시간</h2><br/>
<!-- 																 <input placeholder="수취시간을 선택해 주세요." type="text" id="receiveTime" name="receiveTime"> -->
																 <input placeholder="수취시간을 선택해 주세요." type="text" id="reserveReceiveTime" name="reserveReceiveTime">
															</p><br/><br/>			
															<p>
																<h2>요청 사항</h2><br/>
<!-- 																<input type="text" id="memo" name="memo" value="" /> -->
																<textarea placeholder="요청사항이 있으시면 기재해 주세요."  rows="5" type="text" id="memo" name="memo" >
																</textarea>
															</p><br />
															<p>
																<div class="span3" align="right">
																	 <input id="registerBtn" name="registerBtn" type="button" value="패키지 상품 등록" class="btn btn-large btn-block btn-success" />
																</div>
															</p><br />
																										
														
<!-- 															<p> -->
																
<!-- 																	</p><br/> -->
<!-- 															<p> -->
																	
<!-- 															</p><br /> -->
															
														
																						
<!-- 															<p> -->
<!-- 															</p><br /> -->
<!-- 															<p> -->
																											
<!-- 															</p> -->
<!-- 															<br /> -->
														
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
<!--   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
<!--   <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->
<!--   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
<!--   <link rel="stylesheet" href="/cpr/resources/demos/style.css" /> -->
  
  	
  	
<!--   	<link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
<!-- 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- 	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script> -->
	
			
	<link rel="stylesheet" media="all" type="text/css" href="/cpr/resources/css/jquery-ui-timepicker-addon.css" />
<!-- 	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-timepicker-addon.js"></script> -->
	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-sliderAccess.js"></script>
  	 <script src="/cpr/resources/js/serialize.js" ></script>
  <script>
  
/*   console.log("aaaaaa");
   */
 /*  console.log(" ${marketname}");
 */
  $(function() {
   var marketname = '${marketname}'; 
//    console.log("===========================================================");
	var marketname1 = marketname.split("[");
   	var marketname2 = marketname1.toString();	
	var marketname3 = marketname2.split("]");
   	var marketname4 = marketname3.toString();	
   var marketdata = marketname4.split(","); 
   
   var guname = '${guname}'; 
//    console.log("===========================================================");
	var guname1 = guname.split("[");
   	var guname2 = guname1.toString();	
	var guname3 = guname2.split("]");
   	var guname4 = guname3.toString();	
   var gudata = guname4.split(","); 

   var itemList = '${requestItemList}';
   var itemData1 = itemList.split("[");
   var itemData2 = itemData1.toString();	
   var itemData3 = itemData2.split("]");
   var itemData4 = itemData3.toString();	
   var itemData = itemData4.split(",");
   
//    console.log("========================================");
   
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
 
 
//  $("#receiveTime").on('click', function(){
	
// 		$('#receiveTime').datetimepicker({
// 			dateFormat: 'yy-mm-dd',
// 			controlType: 'select',
// 			timeFormat: 'TT HH:mm'
// 		});
		
// 	});
 
 $("#reserveReceiveTime").on('click', function(){
	
		$('#reserveReceiveTime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			controlType: 'select',
			timeFormat: 'TT HH:mm'
		});
		
	});
 
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 window.onload = function(){
	 
// 		$('#receiveTime').datetimepicker({
// 			dateFormat: 'yy-mm-dd',
// 			controlType: 'select',
// 			timeFormat: 'TT HH:mm'
// 		});
		
		$('#reserveReceiveTime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			controlType: 'select',
			timeFormat: 'TT HH:mm'
		});
		
		
		var add = "2";
		
		
		
		$('#itemAdd').on('click', function(){
			
			if(add > 10){
	            alert("10개 까지만 추가 할수있습니다 ");
	            return false;
			}   
// 			console.log("들어오냐?");
			var html = "";
				html += '<div id="item'+add+'"> <input placeholder="상품명" title="상품명"  style="width:100px" type="text" class="itemName"  id="itemName'+add+'" name="itemName'+add+'" value="" />&nbsp;&nbsp'
						+' <input placeholder="수량" title="수량"  style="width:40px" type="text" id="itemQty'+add+'" name="itemQty'+add+'" value="" />&nbsp;&nbsp'
						+' <input placeholder="가격"  title="가격"  style="width:70px" type="text" id="itemPrice'+add+'" name="itemPrice'+add+'" value="" />&nbsp;&nbsp'
						+'</div>';
			add++;
// 			console.log(add);
			
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
// 						console.log("itemAdd 누름");
						var msg = '';
						for(var i = 1; i < add; i++){
					   	    var itemName = $('#itemName' + i).val();
					   	 	msg +=itemName.replace(/(^\s*)|(\s*$)/gi, "")+",";
					   	    var	itemQty = $('#itemQty' + i).val();
					   	 	msg +=itemQty.replace(/(^\s*)|(\s*$)/gi, "")+",";
					   		var itemPrice = $('#itemPrice' + i).val();
					   	 	msg +=itemPrice.replace(/(^\s*)|(\s*$)/gi, "")+"/";
						}
						
// 						console.log(msg);
						
		
				var tags = $('#tags').val();
				$('#tags').val(tags.replace(/(^\s*)|(\s*$)/gi, ""));		
// 				console.log(tags);
				
				var market = $('#market').val();
				$('#market').val(market.replace(/(^\s*)|(\s*$)/gi, ""));		
// 				console.log(market);
				
				$('#items').val(msg);
			
						var obj = $('#reqeustForm');
						var json = JSON.parse(JSON.stringify(obj.serializeObject()));
// 						console.log(json);
						 
						$.post('/cpr/request/registerAction',json).done(function(data){
							if(data == 1){
								alert("등록 성공");
								location.href="/cpr/request/list?page=1"; 
							}else if(data == 0){
								alert("등록 실패");
							}
							
						}); 
				}else{
					return;
				}
		});
		 
 };
 
//역경매 메뉴 만들기..
//	$('#menu-item-8').attr('style', 'display:inline-block');
// 	$('#menu-item-7').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	$('#menu-item-8').attr('class', 'change btn btn-primary');
  </script>
</body>
</html>