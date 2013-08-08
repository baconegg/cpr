<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						  	   <img  src="/cpr/resources/images/default/join/01.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="/cpr/resources/images/default/join/02.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="/cpr/resources/images/default/join/03.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="/cpr/resources/images/default/join/04.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="/cpr/resources/images/default/join/05.jpg"
								class="attachment-large" alt="upnup_Slide_1" />
							</li>
							<li>
						  	   <img  src="/cpr/resources/images/default/join/06.jpg"
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
								<!-- <span class="post-format video_project_format"></span> -->
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
															    		<h3>상품 등록 설명 </h3>
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
															    		
															    		  </p>
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

													<div class="wpb_wrapper">
															
															<h3>상품등록</h3>		
																												
															<form id="product" method="post" enctype="multipart/form-data">
																<input type="hidden" id="hrefPath" name="hpath"/>														
																<br/>
																<p><br/>
																		판매유형<br/>
																		<select name="productPackage">
																		<option value="0" >단품</option>
																		<option value="1" >묶음 상품</option>
																		</select>
																</p><br/>
																<p>	<br/>
																	카테고리<br/>
																	<select name="tagIdx">
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
																<p><br/>
																	판매방식<br/>
																	<select name="productEvent">
																		<option value="0" >일반</option>
																		<option value="1" >특가</option>
																		<option value="2" >떨이</option>
																		<option value="3" >한정</option>
																		</select>
																</p><br />
																<p>
																	 	상품명 <br/> 
																	 	<input type="text" name="productName" />
																</p><br/>
																<p>
																		원산지<br/>
																		<input type="text" name="productOrigin" />
																</p><br/>
																<p>
																		상품가격<br/>												
																		<input type="text" name="productPrice" value="0" />
																</p><br/>
																<p>
																		상품설명<br/> 
																		<input type="text" name="productInfo" value="" />																	
																</p><br/>		
																<p>
																	 상품이미지 등록<br/> 
																	 <input type="file" name="files" /> 
																</p><br/>
																<input type="hidden" name="selIdx" value="${sessionScope.selIdx}" />																
																<input id="registerBtn" type="button" value="상품등록" />														
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
			console.log(fdata);					
			
			$.ajax({
				url:'registerAction',
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
			    		alert("상품 등록 성공했다 ... ");
			    		location.href = "/cpr/product/list/" + ${sessionScope.selIdx };
			    	}else{
			    		alert("상품 등록 실패");
			    	}
			    }
			});			
		});

	// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
	$('#menu-item-5').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	 
	</script>
</body>
</html>