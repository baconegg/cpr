<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<h1 class="entry-title" >상 품 &nbsp;&nbsp;&nbsp;등 록</h1>
								<p class="portfolio_categories">
								</p>
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
																					
									<div class="wpb_content_element span9 column_container" id="size1">
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">

													<div class="wpb_wrapper">
																												
															<form id="product" method="post" enctype="multipart/form-data">
																<br/>
																<p><br/>
																		판매유형<br/>
																		<select name="productPackage" title="단품 , 묶음 상품  선택">
																		<option value="0" >단품</option>
																		<option value="1" >묶음 상품</option>
																		</select>
																</p><br/>
																<p>	
																	카테고리<br/>
																	<select name="tagIdx" title="상품 태그 (아침 ,점심,저녁 , 기본 등등)">
																		<option value="0">기본</option>
																		<option value="1">아침</option>
																		<option value="2">점심</option>
																		<option value="3">저녁</option>
																		<option value="4">봄</option>
																		<option value="5">여름</option>
																		<option value="6">가을</option>
																		<option value="7">겨울</option>
																		<option value="8">후식</option>
																		<option value="9">특가</option>
																		<option value="10">선물</option>
																		<option value="11">제사</option>
																		<option value="12">건강</option>
																		<option value="13">야식</option>
																		<option value="14">간식</option>																		
																	</select>
																</p><br/>
																<p>
																	판매방식<br/>
																	<select name="productEvent" title="판매 방식 특가, 일반, 떨이, 한정 중 선택">
																		<option value="0" >일반</option>
																		<option value="1" >특가</option>
																		<option value="2" >떨이</option>
																		<option value="3" >한정</option>
																		</select>
																</p><br />
																<p>
																	 	상품명 <br/> 
																	 	<input type="text" name="productName" title="상품명" placeholder="상품명 입력해주세요" />
																</p><br/>
																<p>
																		원산지<br/>
																		<input type="text" name="productOrigin" title="원산지" placeholder="원사지 입력해주세요" />
																</p><br/>
																<p>
																		상품가격<br/>												
																		<input type="text" name="productPrice" title="상품가격" placeholder="상품가격 입력해주세요 (숫자로 입력해주세요)" value="0" />
																</p><br/>
																<p>
																		상품설명<br/> 
<!-- 																		<input name="productInfo" title="상품설명" placeholder="상품 설명 입력해주세요 (패키지 상품시 상품 구성 입력 해주세요)" /> -->
																		<textarea rows="5" name="productInfo" title="상품설명" placeholder="상품 설명 입력해주세요 (패키지 상품시 상품 구성 입력 해주세요)" >
																		</textarea>																	
																</p><br/>
																
																		
																<p>
																	상품이미지 등록<br/> 
																	 <input type="file" name="files" /> 
																</p><br/>
																<input type="hidden" name="selIdx" value="${sessionScope.selIdx}" />
																<input type="hidden" id="hrefPath" name="hpath"/>
																
<!-- 																<div class="span3" align="center"> -->
<!-- 														          <a href="" class="btn btn-large btn-block btn-success" id="registerBtn"><strong>상품 등록</strong></a> -->
<!-- 														        </div>			<br/>	<br/>	<br/>-->			
										 
																<div class="span3" align="center">
																	<input id="registerBtn" class="btn btn-large btn-block btn-success"  type="button" value="상품등록" />			
																 </div><br/><br/><br/>							
																 				
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
	
	<script type="text/javascript">
	 $('#registerBtn').on('click',function(){			
			var fdata = new FormData($('#product')[0]);			
			//console.log(fdata);					
			
			$.ajax({
				url:'/cpr/product/registerAction',
				type:'POST',
				data: fdata,
				cache: false,
		        contentType: false,
		        processData: false,		      
		        error: function(e,x){
		        	if(x.status==0){
		                	console.log('You are offline!!n Please Check Your Network.');
		                }else if(x.status==404){
		                	console.log('Requested URL not found.');
		                }else if(x.status==500){
		                	console.log('Internel Server Error.');
		                }else if(e=='parsererror'){
		                	console.log('Error.nParsing JSON Request failed.');
		                }else if(e=='timeout'){
		                	console.log('Request Time out.');
		                }else {
		                	console.log('Unknow Error.n'+x.responseText);
		                }
		        	alert("상품 등록 오류 - 다시 시도해 주세요");
		        },
				success: function(data) {
			    	if(data == 1){
			    		alert("상품 등록 성공");
			    		location.href = "/cpr/product/list/" + ${sessionScope.selIdx };
			    	}else{
			    		alert("상품 등록 실패");
			    	}
			    }
			});	
			
		});

	// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////
	$('#menu-item-10').attr('class', 'change btn btn-primary');

	 
	window.onload = function(){
		
		$('#size').width('80px');
		
		$('#size1').css('float','left');

		
		/* $("#manual").css("width", "200px"); */
	};
	
	
	
	</script>
</body>
</html>