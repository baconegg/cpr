<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	session.setAttribute("aa", "bb");
%>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=1.0">

<meta http-equiv="Page-Enter" content="revealTrans(Duration=2.0,Transition=10)">
<meta http-equiv="Page-Exit" content="revealTrans(Duration=2.0,Transition=10)">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="/cpr/resources/js/jquery.form.js"></script>

<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
<link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
		
				
		<link rel="stylesheet" media="all" type="text/css" href="/cpr/resources/css/jquery-ui-timepicker-addon.css" />
		<script type="text/javascript" src="/cpr/resources/js/jquery-ui-timepicker-addon.js"></script>
		<script type="text/javascript" src="/cpr/resources/js/jquery-ui-sliderAccess.js"></script>
<!-- --------------------------------------------------------------------------------------------------------------------------------- -->


<!-- json serialize -->
<script src="/cpr/resources/js/serialize.js"></script>

<script type="text/javascript">
	var block_rc = false;
	var animate_thumbs = true;
</script>


<title>상품 상세페이지</title>

<link rel="canonical" href="http://hongikdmd.com/meme/portfolio/item/ferrofluid-fractal/">


<script src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/wpbakery/js/libs/modernizr-2.5.3.min.js"></script>
<script type="text/javascript" src="http://hongikdmd.com/meme/wp-includes/js/jquery/jquery.js?ver=1.8.3"></script>

<link rel="stylesheet" type="text/css" href="/cpr/resources/css/default/responsive.css">
<link rel="stylesheet" id="bootstrap-css" href="/cpr/resources/css/default/bootstrap.css" type="text/css" media="screen">
<link rel="stylesheet" id="js_composer_front-css" href="/cpr/resources/css/default/js_composer_front.css" type="text/css" media="screen">
<link rel="stylesheet" id="theme-css" href="/cpr/resources/css/default/style.css" type="text/css" media="screen">
<link rel="stylesheet" id="wpb_theme_custom_style-css" href="/cpr/resources/css/default/custom.css" type="text/css" media="screen">
<link rel="stylesheet" id="wpb-responsive-css" href="/cpr/resources/css/default/responsive1.css" type="text/css" media="screen">
<script type="text/javascript" src="/cpr/resources/js/default/comment-reply.min.js"></script>

<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://hongikdmd.com/meme/xmlrpc.php?rsd">
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://hongikdmd.com/meme/wp-includes/wlwmanifest.xml">

<link rel="stylesheet" id="wpb-responsive-css" href="/cpr/resources/css/nexon_clone.css" type="text/css" media="screen">

<!--<meta name="generator" content="WordPress 3.5" />-->
<style type="text/css">
.recentcomments a {
	display: inline !important;
	padding: 0 !important;
	margin: 0 !important;
}
</style>

<!--덮어 씌우는 부분-->
<link rel="stylesheet" type="text/css" href="/cpr/resources/css/default/override.css">
<link rel="stylesheet" type="text/css" href="/cpr/resources/css/default/designer.css">

<!--[if lt IE 7]><p class="chromeframe">Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
</head>

<body class="single single-portfolio postid-83 chrome wpb-js-composer js-comp-ver-3.3.2" style="" data-twttr-rendered="true">


	<div id="content_wrap">
		<!-- 왼쪽 사이드 메뉴	-->
		<header id="banner" class="site_nav navbarR navbar-fixed-topP" role="banner">
			<div class="wpb_navbar-inner">
				<div class="wrap">
					<a class="brand" href="http://hongikdmd.com/meme/"> 
						<img src="/cpr/resources/images/default/qtest.jpg">
					</a> <a id="mobile_nav_toggle" href="#">Site Navigation</a>
					<nav id="nav-main" class="nav-collapseE clearfix" role="navigation">
						<div class="menu-first-container">
							<ul id="menu-first" class="main-nav">
								<li id="menu-item-66" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-66">
									<a href="http://hongikdmd.com/meme/">메인시장</a>
								</li>
								<li id="menu-item-26" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-26">
									<a href="../list/customer/${MSvo.selIdx}">상점가기</a>
								</li>
								<li id="menu-item-25" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-25">
									<a href="http://hongikdmd.com/meme/interaction/">menu3</a>
								</li>
								<li id="menu-item-24" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-24">
									<a href="http://hongikdmd.com/meme/visual/">menu4</a>
								</li>
							</ul>
						</div>
					</nav>

					<nav id="nav-second" class="nav-collapseE clearfix" role="navigation">
						<div class="menu-second-container">
							<ul id="menu-second" class="second-nav">
								<li id="menu-item-155" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-155">
									<a href="http://hongikdmd.com/meme/about-exhibition/">menu5</a>
								</li>
								<li id="menu-item-150" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-150">
									<a href="http://hongikdmd.com/meme/introduction-of-dmd/">menu6</a>
								</li>
								<li id="menu-item-904" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-904">
									<a href="http://hongikdmd.com/meme/designers/">menu7</a>
								</li>
							</ul>
						</div>
					</nav>

				</div>
			</div>
		</header>
		<!-- 왼쪽 사이드 끝-->

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
<div id="content_wrap">
        
    <div id="wrap" class="wrap" role="document">
        
			<!-- 제일 위부분의 파란색 바 -->
        	<div id="top-title"></div>
        	
			    <div id="content" class="row-fluid">
				     <div id="main" class="span12" role="main">
				        <div class="wpb_content_wrapper">
					       <article class="post-68 portfolio type-portfolio status-publish hentry" id="post-68">
					          <header>
					        	<h1 class="entry-title">[${Pvo.tagName}]&nbsp;${Pvo.productName}</h1>
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
											<div class="wpb_content_element span6 identity column_container">
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_left designers">
														 <div>
														 	상품사진
														 </div>
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 wpb_text_column">
															<div class="wpb_wrapper">															
																
																<img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${Pvo.productImgUUID}">
															</div> 
														</div> 
													  </div>
													  
												</div> 
											</div>  
											<div class="wpb_content_element span6 note infor column_container">
												<div class="wpb_wrapper">
													 <div class="vc_text_separator wpb_content_element separator_align_right designers">
														 <div>
														 	여기 magin주고 글자 지워야함.
														 	
														 </div>
													 </div>
												 <div class="row-fluid">
													<div class="wpb_content_element span12 wpb_text_column">
														<div class="wpb_wrapper">
															
															<h3>상품설명</h3>
															<p>
																<br/>	
																<form id="reserve" method="post">
																<input type="hidden" value="${Pvo.productIdx}" name="productIdx">																
																<%-- <input type="hidden" value="세션에서 userIdx 받아와야 함.">	 --%>	
																<input type="hidden" value="3" id="userIdx" name="userIdx">														
																<h1>${Pvo.productInfo}</h1><br/>	
																<h1>원산지&nbsp;&nbsp;:&nbsp;&nbsp;${Pvo.productOrigin}</h1><br/>	
																<h1>가격&nbsp;&nbsp; : &nbsp;&nbsp;${Pvo.productPrice}</h1>
																<input type="hidden" value="${Pvo.productPrice}" id="productPrice"><br/>	
																<h1>
																	수량&nbsp;&nbsp; : &nbsp;&nbsp;
																	<button id="btnMinus" type="button">-</button>																	
																	<input type="text" id="orderQty" name="orderQty" value="1" readonly="readonly">
																	<button id="btnPlus" type="button">+</button>
																</h1><br/>
																<h1>
																 수취시간&nbsp;&nbsp; : &nbsp;&nbsp;
																 
																 <input type="text" id="slider_example_4" name="orderReceiveTime">
																 
																
																</h1><br/>														
																<h1>
																요청 사항<br/>
																<input type="text" id="orderMemo" name="orderMemo" maxlength="100" placeholder="추가하거나 빼고 싶은 물품, 하고싶은 말 등을 써주세요. ">	
																</h1><br/>
																
																<div id="totalPrice">	
																
																</div><br/>
																														
																<h1>
																<input type="button" value="예약하기" id="btnRegist">
																</h1><br/>	
																</form>																
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
																<img width="225" height="225" src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${MSvo.selImgUUID}" class="attachment-medium" alt="">
															</div> 
														</div> 
													 </div>
													 <div class="row-fluid">
														<div class="wpb_content_element span12 name-box wpb_text_column">
															<div class="wpb_wrapper">												
																<p>${MSvo.memberName}</p>			
																<p>${MSvo.selStore}</p>
																<p>${MSvo.memberTel}</p>									
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
																	<input type="hidden" id="selIdx" value="${MSvo.selIdx}"/>
																	상인고유번호 : ${MSvo.selIdx}<br/>
																	시장명 : ${MSvo.guNameMarId}<br/> 
																	업종번호 : ${MSvo.selType}<br/>
						 											업종명 : ${MSvo.workType}<br/>
																	상점 상세주소 : ${MSvo.selAddress}<br/>
																	상점번호 : ${MSvo.selStoreNo}<br/>
																	상점정보 : ${MSvo.selInfo}<br/>
																	상점평가 : ${MSvo.selLike}<br/>
																	
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
								      
						      <article id="post-72" class="post-72 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
						            <a href="http://hongikdmd.com/meme/portfolio/item/%ea%bf%88%ea%be%b8%eb%8a%94-%eb%a1%9c%eb%b4%87/" title="Permalink to 꿈꾸는 로봇">
						        		
						              <div class="post-thumb" style="top: 0px; z-index: 0;">
						              		<div class="cover"></div>
						                    <img width="400" height="300" src="http://hongikdmd.com/meme/wp-content/uploads/2012/11/dream_thumb.jpg" class="attachment-portfolio-thumb wp-post-image" alt="dream_thumb" style="opacity: 1;">   
						              </div>
						              
						              <header style="opacity: 0; display: none; top: 0px; z-index: 900;">
						                    <div class="summary">
						                        <h3>꿈꾸는 로봇</h3>
						                        <div class="s-text" style="margin-top: 0px; position: relative; top: -33px;"><p>꿈을 통해 물질욕, 지식욕, 식욕 3가지 욕망을 실현하는 로봇의 이야기를 담은 3d애니메이션 영상.</p>
						</div>
						                    </div>
						                             <span class="post-format video_project_format"></span>
						      
						              </header>
						                       </a>
						    </article>
						        
						      <article id="post-81" class="post-81 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
						            <a href="http://hongikdmd.com/meme/portfolio/item/dance-monster/" title="Permalink to Dance monster">
						        		
						              <div class="post-thumb" style="top: 0px; z-index: 0;">
						              		<div class="cover"></div>
						                    <img width="400" height="300" src="http://hongikdmd.com/meme/wp-content/uploads/2012/11/DanceMonster_thumb.jpg" class="attachment-portfolio-thumb wp-post-image" alt="DanceMonster_thumb" style="opacity: 1;">   
						              </div>
						              
						              <header style="opacity: 0; display: none; top: 0px; z-index: 900;">
						                    <div class="summary">
						                        <h3>Dance monster</h3>
						                        <div class="s-text" style="margin-top: 0px; position: relative; top: -87px;"><p>비뉴튼물질 이라는 흔히 볼수 있는 반죽같은 물질을 우퍼스피커 유닛의 진동을 통해서 다양하게 살아있는 듯한 움직임을 표현한 작품이다. 돌리는 것을 인터페이스로써 빠르게 돌릴수록 더욱 심한 진동으로 반응한다.</p>
						</div>
						                    </div>
						                             <span class="post-format"></span>
						      
						              </header>
						                       </a>
						    </article>
						        
						      <article id="post-122" class="post-122 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
						            <a href="http://hongikdmd.com/meme/portfolio/item/if-you-were/" title="Permalink to If you were">
						        		
						              <div class="post-thumb" style="top: 0px; z-index: 0;">
						              		<div class="cover"></div>
						                    <img width="400" height="300" src="http://hongikdmd.com/meme/wp-content/uploads/2012/11/ifyouwere_thumb.jpg" class="attachment-portfolio-thumb wp-post-image" alt="ifyouwere_thumb" style="opacity: 1;">   
						              </div>
						              
						              <header style="opacity: 0; display: none; top: 0px; z-index: 900;">
						                    <div class="summary">
						                        <h3>If you were</h3>
						                        <div class="s-text" style="margin-top: 0px; position: relative; top: -105px;"><p>이 작품은 우울증 환자의 어두운 내면을 상징하는 암실이라는 공간을 통하여 그의 내면 이야기를 전달하고 있다. 우울증으로 극단적인 선택을 해야 했던 사람의 이야기를 보여줌으로써 우울증 환자에 대한 당신의 시선도 왜곡되지 않았는가에 대한 물음을 던지고자 한다. </p>
						</div>
						                    </div>
						                             <span class="post-format"></span>
						      
						              </header>
						                       </a>
						    </article>
						        
						      <article id="post-114" class="post-114 portfolio type-portfolio status-publish hentry portfolio_thumb span2">
						            <a href="http://hongikdmd.com/meme/portfolio/item/%eb%91%90%eb%b6%80-%ed%95%9c-%eb%aa%a8/" title="Permalink to 두부 한 모">
						        		
							              <div class="post-thumb">
							              		<div class="cover"></div>
							                    <img width="400" height="300" src="http://hongikdmd.com/meme/wp-content/uploads/2012/11/dubuhanmo_thumb.jpg" class="attachment-portfolio-thumb wp-post-image" alt="dubuhanmo_thumb" style="opacity: 1;">   
							              </div>
						              
							              <header>
							                    <div class="summary">
							                        <h3>두부 한 모</h3>
							                        <div class="s-text">
							                        	<p>
							                        		‘두부 한 모’는 20, 30대를 대상으로 두부를 건강하고 즐겁게 이용할 수 있는 분위기를 만들어가고자 두부에 대한 다양한 정보를 제공하는 어플리케이션입니다. ‘두부 한 모’를 통해 두부가 건강하고 트랜디하게 먹을 수 있는 음식이 되었으면 좋겠습니다.
							                        	</p>
													</div>
							                    </div>
							                    <span class="post-format"></span>
							      
							              </header>
						             </a>
						       </article>
						  
							</div>
						</div>
			    
			    </div><!-- /#content -->
  
    </div><!-- /#wrap -->
</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
		
	</div>
	<!-- end .wpb_content_wrapper -->

	<footer id="content-info" class="wrap" role="contentinfo">
		<div class="wpb_copyright_message">
			<p>
				CPR Project [IT를 이용한 전통시장 활성화 프로젝트] <br> Copyright © shinyul Corporation. all
				Rights Reserved.
			</p>
		</div>
	</footer>

	<!--	-->
	<link rel="stylesheet" id="flexslider-css" href="/cpr/resources/css/default/flexslider.css" type="text/css" media="screen">
	<script type="text/javascript" src="/cpr/resources/js/default/js_composer_front.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/default/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/default/js.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/default/jquery.flexslider.js" media="screen"></script>
	<script rel="stylesheet" id="flexslider-css" src="/cpr/resources/js/default/masory_isotope_js.js"></script>

	<!-- shinyul... -->
	<script type="text/javascript" src="/cpr/resources/js/nextJoin.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/getTeminal.js"></script>
	<script type="text/javascript" src="/cpr/resources/js/view.js"></script>

<script type="text/javascript">
	window.onload = function(){
		
		 var aa = "${sessionScope.aa}";
		 var bb = "${sessionScope.memberIdx}";
		 console.log(bb); 
		console.log(aa); 
	};
	
</script>


</body></html>