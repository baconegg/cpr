<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%-- <% --%>
<!--  	session.setAttribute("customer", 5); -->
<%-- %> --%>

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
					        	<h1 class="entry-title">역 경매 수정페이지</h1>
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
											
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_left designers">
														 
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 wpb_text_column">
															<div class="wpb_wrapper">															
																
																 
																				
												<div class="wpb_wrapper">
													
												 <div class="row-fluid">
													<div class="wpb_content_element span12 wpb_text_column">
														<div class="wpb_wrapper">
															
															<h3>역 경매 글</h3>
															<form id="modifyForm" method="post" action="registAction" >
									
															<p>
																<br />제목
																<input type="text" name="title" id="title" value="${RequestVO.title }" />
																<input type="hidden" name="idx" id="idx" value="${RequestVO.idx }" />
															
															</p><br />
															<p>
																
														
																  구: 
																  <input type="text" style="width: 200px" id="tags" name="guName" value="" />
																  시장: 
																  <input type="text" style="width: 200px" id="market" name="marketName" value="" />
																  <input type="hidden" style="width: 200px" id="customerIdx" name="customerIdx" value="${RequestVO.customerIdx }" />
															
 
															</p><br/>
															상품 내역<br/>
															<div id="itemDiv">
															</div>						
															<input type="hidden" style="width: 200px" id="items" name="items" value="" />
															<p>
															 수취시간 
																 <input type="text" id="receiveTime" name="receiveTime" value="${RequestVO.receiveTime }" >
																</p>
																<p>
																<br />요청 사항</br>
																<input type="text" id="memo" name="memo" value="${RequestVO.memo }" />
																<p>
																 <!-- =============================================세션에서 받아와라 ~! 위에 세션선언함 ========================================================= -->					
																<c:choose >																	
<%-- 																	<c:when test="${sessionScope.customer == RequestVO.customerIdx}"> --%>
																	<c:when test="${sessionScope.customer == '5'}">
																		<input type="button" value="수정완료" id="modifyBtn">&nbsp;&nbsp;&nbsp;
																		<input type="button" value="수정취소" id="backBtn">&nbsp;&nbsp;&nbsp;
																		<input type="button" value="목록" id="listBtn">
																	</c:when>
																	<c:otherwise>
																		<input type="button" value="목록" id="listBtn">
																	</c:otherwise>
																</c:choose>
										<!-- ====================================================================================================== -->				
																 	
																</p><br />
																
															</p><br />	
															</form>	
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
														</div> 
													  </div>
													  
												</div> 
											 
							
										</div>
						
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
				      
				        <div class="footer-h3"><br/>
						    <h2>지랄지랄 시장 대표상품</h2><br/>
							<div class="row-fluid other_projects_footer">
							<br/>
								 <c:forEach var="list" items="${list}">
									 <article id="post-72" class="post-72 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
										<a href="../../view/customer?productIdx=${list.productIdx }">
											  <div class="post-thumb" style="top: 0px; z-index: 0;" >
												<div class="cover"></div>
												
												<img width="400" height="300"  src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${list.productImgUUID}" class="attachment-portfolio-thumb wp-post-image" alt="DanceMonster_thumb" style="opacity: 1;">
											</div>
											
											<header style="opacity: 0; display: none; top: 0px; z-index: 900;">
												<div class="summary">
													<h3>
														<span>${list.productIdx}</span> <span class="feature">${list.productName}</span>
													</h3>
													<input type="hidden" id="productIdx" name="productIdx"  value="${list.productIdx}"/>
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

</body></html>
<link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
	
			
	<link rel="stylesheet" media="all" type="text/css" href="/cpr/resources/css/jquery-ui-timepicker-addon.css" />
	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/jquery-ui-sliderAccess.js"></script>
  	 <script src="/cpr/resources/js/serialize.js" ></script>
<script>



$(function() {
	
	
	
	   var marketname = '${marketname}'; 
	
		var marketname1 = marketname.split("[");
	   	var marketname2 = marketname1.toString();	
		var marketname3 = marketname2.split("]");
	   	var marketname4 = marketname3.toString();	
	   var marketdata = marketname4.split(","); 
	  
	  

	   
	   var guname = '${guname}'; 
		var guname1 = guname.split("[");
	   	var guname2 = guname1.toString();	
		var guname3 = guname2.split("]");
	   	var guname4 = guname3.toString();	
	   var gudata = guname4.split(","); 

	   var itemList = '${requestItemList}';
	   var itemData = itemList.split(",");
	   
	 
	   
	   
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
	 
/* ==============================================상품 내역 파씽 씨발...====================================================== */

window.onload = function(){
	
	if('${sessionScope.customer}' == '${RequestVO.customerIdx}' ) {
		

  	$('#receiveTime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		controlType: 'select',
		timeFormat: 'TT HH:mm'
	});
  	
  	var gunamemarid = '${RequestVO.gunameMarid }';
	var gumar = gunamemarid.split(",");
	
	$('#tags').val(gumar[0]);
	$('#market').val(gumar[1]);
	

	
	var item = '${RequestVO.items}';
	var items = item.split("/");
	console.log(item.length);
	var itemAdd = (","+items.toString()).split(",");	
	
	
	
	var add =0;
	
	
	var html = "";
	for ( var i = 1; i <= parseInt(itemAdd.length / 3)*3 ; i++) {
		
		if( ( i % 3 ) == 1 ){
			add++;
			html += '<div id="item'+add+'">';
			html += '상품명 : <input style="width:110px" type="text" id="itemName'+add+'" name ="itemName'+add+'" value="'+itemAdd[i]+'"/>&nbsp;&nbsp';
		
		}else if( ( i % 3 ) == 2 ){
			html += '수량 : <input style="width:110px" type="text" id="itemQty'+add+'" name ="itemQty'+add+'" value="'+itemAdd[i]+'"/>&nbsp;&nbsp';
		
		}else if( ( i % 3 ) == 0 ){
			html += '가격 : <input style="width:110px" type="text" id="itemPrice'+add+'" name ="itemPrice'+add+'" value="'+itemAdd[i]+'"/>&nbsp;&nbsp';
		
			if(i==3){
				html += '<input type="button" id="itemAdd" name="itemAdd" value="상품추가" />&nbsp;&nbsp;<input type="button" value="상품삭제" id="removeBtn1">';
			}
			html += '</div>';
		}
	} 

	
	$('#itemDiv').html(html);

$('#itemAdd').on('click', function(){
	
	if(add > 9){
        alert("10개 까지만 추가 할수있습니다 ");
        return false;
	}   
	console.log("itemAdd들어오냐?");
	add++;
	var html = "";
		html += '<div id="item'+add+'">상품명 : <input style="width:110px" type="text" class="itemName"  id="itemName'+add+'" name="itemName'+add+'" value="" />&nbsp;&nbsp'
				+'수량 : <input style="width:110px" type="text" id="itemQty'+add+'" name="itemQty'+add+'" value="" />&nbsp'
				+' 가격 : <input style="width:110px" type="text" id="itemPrice'+add+'" name="itemPrice'+add+'" value="" />&nbsp'
				+'</div>';
	console.log(add);
	
	/*  $('#itemAddDiv').innerhtml(html);
	 */
	 $('#itemDiv').append(html); 
	 
	 
	 var itemList = '${requestItemList}';
	 var itemData = itemList.split(",");
		$( ".itemName" ).autocomplete({
		      source: itemData
		    }); 
	 
	 
});

 $("#removeBtn1").on('click',function () {
	console.log("removeBtn 들어옴");
	console.log(add);
		
	 if(add==1){
          alert("상품은 1개 이상 등록 하셔야 합니다.");
          return false;
     }   
	 	
	
	 
    $("#item"+add).remove();
	add--;
    
});



 $('#modifyBtn').on("click",function(){
 	if(confirm("글을 수정 하시겠습니까?")){
 			console.log("modifyBtn 누름");
 			console.log(add);
 			var msg = '';
 			console.log(add);
 			for(var i = 1; i <= add; i++){
 			console.log(i);
 		   	    var itemName = $('#itemName' + i).val();
 		   	 	console.log(itemName);
 		   	 	msg +=itemName.replace(/(^\s*)|(\s*$)/gi, "")+",";
 		   	 	
 		   	    var	itemQty = $('#itemQty' + i).val();
 		   	 	console.log(itemQty);
 		   	 	msg +=itemQty.replace(/(^\s*)|(\s*$)/gi, "")+",";
 		   	 	
 		   		
 		   	 	var itemPrice = $('#itemPrice' + i).val();
 		   		console.log(itemPrice);
 		   	 	msg +=itemPrice.replace(/(^\s*)|(\s*$)/gi, "")+"/";
 			}
 			console.log(msg);
 			$('#items').val(msg);
 		
 			

 			var tags = $('#tags').val();
 			$('#tags').val((tags.replace(/(^\s*)|(\s*$)/gi, ""))+",");		
 		
 			var market = $('#market').val();
 			$('#market').val(market.replace(/(^\s*)|(\s*$)/gi, ""));		
 		
 		
 			var obj = $('#modifyForm');
 			var json = JSON.parse(JSON.stringify(obj.serializeObject()));
 			
 			 
 			 
 			$.post('modifyAction',json).done(function(data){
 				if(data=="1"){
 					alert("수정 성공");
 					/* location.href="" */
 				}else if(data == "2"){
 					alert("수정 실패 ");
 				}
 				
 			}); 
 	}else{
 		return;
 	}
 });
	}else{
		location.href="view?idx="+${RequestVO.idx}; 
	}
};//윈도우 온 로드 ~ 






$('#backBtn').on('click',function(){
	if('${sessionScope.customer}'=='${RequestVO.customerIdx}' ){
		if(confirm("글을 수정 취소 하시겠습니까?")){
			location.href="view?idx=${RequestVO.idx}&gunamemarid=${RequestVO.gunameMarid}";
		}else{
			return;
		}
	}else{
		alret('작성하신 글이 아니니다.');
		location.href="view?idx=${RequestVO.idx}&gunamemarid=${RequestVO.gunameMarid}"
	}
});


$('#listBtn').on('click',function(){
			location.href="list";
});

//역경매 메뉴 만들기..
$('#menu-item-7').attr('style', 'display:block');
$('#menu-item-7').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');

</script>