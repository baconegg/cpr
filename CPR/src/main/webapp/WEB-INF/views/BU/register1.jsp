<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 --%>


<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js gt-ie8" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=1.0" />

	<meta http-equiv="Page-Enter" content="revealTrans(Duration=2.0,Transition=10)">
	<meta http-equiv="Page-Exit" content="revealTrans(Duration=2.0,Transition=10)">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="../resources/js/jquery.form.js"></script>
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


	<!-- json serialize -->
	<script src="../resources/js/serialize.js" ></script>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	
	
	<script type="text/javascript">
		var block_rc = false;
		var animate_thumbs = true;
	</script>

	<!-- This site is optimized with the Yoast WordPress SEO plugin v1.3.4.1 - http://yoast.com/wordpress/seo/ -->
	<title>상품 등록</title>
	
	<link rel="canonical" href="http://hongikdmd.com/meme/portfolio/item/ferrofluid-fractal/" />
		
	<!-- / Yoast WordPress SEO plugin. -->
	<!-- 에러떠서 웹에서 접속중... -->
	<script src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/wpbakery/js/libs/modernizr-2.5.3.min.js"></script>
	<script type='text/javascript' src='http://hongikdmd.com/meme/wp-includes/js/jquery/jquery.js?ver=1.8.3'></script>

	<link rel="stylesheet" type="text/css" href="../resources/css/default/responsive.css" />
	<link rel='stylesheet' id='bootstrap-css'  href='../resources/css/default/bootstrap.css' type='text/css' media='screen' />
	<link rel='stylesheet' id='js_composer_front-css'  href='../resources/css/default/js_composer_front.css' type='text/css' media='screen' />
	<link rel='stylesheet' id='theme-css'  href='../resources/css/default/style.css' type='text/css' media='screen' />
	<link rel='stylesheet' id='wpb_theme_custom_style-css'  href='../resources/css/default/custom.css' type='text/css' media='screen' />
	<link rel='stylesheet' id='wpb-responsive-css'  href='../resources/css/default/responsive1.css' type='text/css' media='screen' />
	<script type='text/javascript' src=''../resources/js/default/comment-reply.min.js'></script>
	
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://hongikdmd.com/meme/xmlrpc.php?rsd" />
	<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://hongikdmd.com/meme/wp-includes/wlwmanifest.xml" />
	
	<link rel='stylesheet' id='wpb-responsive-css'  href='../resources/css/nexon_clone.css' type='text/css' media='screen' />	
	
	<!--<meta name="generator" content="WordPress 3.5" />-->
	<style type="text/css">
		.recentcomments a {
			display: inline !important;
			padding: 0 !important;
			margin: 0 !important;
		}
	</style>
	<!--덮어 씌우는 부분-->
	<link rel="stylesheet" type="text/css" href="../resources/css/default/override.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/default/designer.css" />

	<!--[if lt IE 7]><p class="chromeframe">Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
</head>

<body class="single single-portfolio postid-83 chrome wpb-js-composer js-comp-ver-3.3.2">
	<div id="content_wrap">
		<!-- 왼쪽 사이드 메뉴	-->
		<header id="banner" class="site_nav navbarR navbar-fixed-topP" role="banner">
			<div class="wpb_navbar-inner">
				<div class="wrap">
					<a class="brand" href="http://hongikdmd.com/meme/"> <img src="../resources/images/default/qtest.jpg" /> </a>
					<a id="mobile_nav_toggle" href="#">Site Navigation</a>
					<nav id="nav-main" class="nav-collapseE clearfix" role="navigation">
						<div class="menu-first-container">
							<ul id="menu-first" class="main-nav">
								<li id="menu-item-66" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-66">
									<a href="http://hongikdmd.com/meme/">All</a>
								</li>
								<li id="menu-item-26" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-26">
									<a href="http://hongikdmd.com/meme/information/">Information</a>
								</li>
								<li id="menu-item-25" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-25">
									<a href="http://hongikdmd.com/meme/interaction/">Interaction</a>
								</li>
								<li id="menu-item-24" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-24">
									<a href="http://hongikdmd.com/meme/visual/">Digital Visual</a>
								</li>
							</ul>
						</div>
					</nav>

					<nav id="nav-second" class="nav-collapseE clearfix" role="navigation">
						<div class="menu-second-container">
							<ul id="menu-second" class="second-nav">
								<li id="menu-item-155" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-155">
									<a href="http://hongikdmd.com/meme/about-exhibition/">About Exhibition</a>
								</li>
								<li id="menu-item-150" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-150">
									<a href="http://hongikdmd.com/meme/introduction-of-dmd/">Introduction of DMD</a>
								</li>
								<li id="menu-item-904" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-904">
									<a href="http://hongikdmd.com/meme/designers/">Designers</a>
								</li>
							</ul>
						</div>
					</nav>
					<!--
					<nav id="nav-footer">
						<ul>
							<li>
								<a href="http://hongikdmd.com/meme/teaser"><img src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/images/teaser.png" alt="">
								<p>
									teaser
								</p></a>
							</li>
							<li>
								<a href="http://www.facebook.com/pages/2012-Hongik-Univ-DMD-Graduation-Exhibition-meme/458860957490472"><img src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/images/face.png" alt="">
								<p>
									facebook
								</p></a>
							</li>
						</ul>

					</nav>-->
				</div>
			</div>
		</header>
		<!-- 왼쪽 사이드 끝-->

		<div id="wrap" class="wrap" role="document">
			<!--슬라이드용 이미지-->
			<div class="row-fluid">
				<div class="span12 wpb_top_slider wpb_gallery">
					<span id="portfolio_top_loader"></span>
					<div class="wpb_gallery_slides flexslider wpb_flexslider" data-interval="5" data-flex_fx="fade">
						<ul class="slides">
							<!--
							<li>
								<iframe src="http://player.vimeo.com/video/52622122" width="100" height="56" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
							</li>-->
							<!-- "../resources/images/market-wallpaper-1024x576.jpg" -->
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
				</div>
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

													<div class="wpb_wrapper" id="join_seller">
															<h3>상품등록</h3>
															
									<form id="product" method="post" action="registAction" enctype="multipart/form-data">
														
															<br/>
															<p>
																<br />판매유형</br><select id="productPackage" name="productPackage">
																	<option value="0" >단품</option>
																	<option value="1" >묶음 상품</option>
																	</select>
															</p><br />
														
															<p>
																<br />카테고리</br><select id="tagIdx" name="tagIdx">
																	<option value="0">기본</option>
																	<option value="1">야식</option>
																	<option value="2">저녁</option>
																	<option value="3">반찬</option>
																	<option value="4">후식</option>
																	<option value="5">태구</option>
																</select>
															</p><br />
															<p>
																<br />판매방식</br><select id="productEvent" name="productEvent">
																	<option value="0" >일반</option>
																	<option value="1" >특가</option>
																	<option value="2" >떨이</option>
																	<option value="3" >한정</option>
																	</select>
															</p><br />
															<p>
																 	상품명 </br> 
																 	<input type="text"  id=" productName"  name=" productName" />
															</p><br />
															<p>
																	원산지</br>
																	<input type="text" id="productOrigin" name="productOrigin"></p><br/>															
														
															<p>
																	상품가격<br /> 
																	<input type="text" id="productPrice" name="productPrice"></p><br/>
															<p>
																	상품설명<br /> <input type="text"  name="productInfo" id="productInfo" />
															</p><br />
															
														
												<!-- =========================================================================================== -->															
															
																	<!-- 판매자 고유 번호 세션값에서 가져와 넣어 아님 넘겨 받던지 ~! 모르것다  -->
																	
																	<input type="hidden" id="selIdx" name="selIdx" value="11">
																		
																	<!-- <input type="hidden" id="" name=""> -->
												<!-- =========================================================================================== -->															
															<p>
																 상품이미지 등록</br> <input id="productImg" type="file" name="files" /> 
															</p><br />
															<p>
																<input id="registerBtn" name="registerBtn" type="button" value="상품등록">																
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

		</div><!-- /#wrap -->
	</div>
	<!--id :content_wrap-->	
	<footer id="content-info" class="wrap" role="contentinfo">
	<hr>
		<div class="wpb_copyright_message">
			<p>
				Digital Media Design Graduation Exhibition 2012
				<br />
				2012.11.09 - 11.15 |Opening 11.09 07:00 PM
			</p>
		</div>
	</footer>
	
	<!--	-->
	<!-- <link rel='stylesheet' id='flexslider-css'  href='../resources/css/default/flexslider.css' type='text/css' media='screen' /> -->
	<script type='text/javascript' src='../resources/js/default/js_composer_front.js'></script>
	<script type='text/javascript' src='../resources/js/default/jquery.isotope.min.js'></script>
	<script type='text/javascript' src='../resources/js/default/js.js'></script>
	<!-- <script type='text/javascript' src='../resources/js/default/jquery.flexslider.js' type='text/css' media='screen'></script> -->
	<!-- <script rel='stylesheet' id='flexslider-css' src="../resources/js/default/masory_isotope_js.js"></script> -->	
	
	<script type="text/javascript">
	 $('#registerBtn').on('click',function(){
			
			var fdata = new FormData($("#product")[0]);
			
			console.log(fdata);
			
			$.ajax({		
				url:"registerAction",
				type:"post",
				data:fdata,
				cache: false,
		        contentType: false,
		        processData: false,				
				success: function(data) {
			    	if(data == 1){
			    		alert("상품 등록 성공했다 ... ");
			    	}else{
			    		alert("상품 등록 실패 똑바로 입력해주지 그래 ");
			    	}
			    }
			});
			
		});
	</script>
</body>
</html>