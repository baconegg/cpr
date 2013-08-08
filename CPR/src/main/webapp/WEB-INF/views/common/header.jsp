<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<body>	
		<!-- 왼쪽 사이드 메뉴	-->
		<header id="banner" class="site_nav navbarR navbar-fixed-topP" role="banner">
			<div class="wpb_navbar-inner">
				<div class="wrap">
					<a class="brand" href="/cpr/">
<!-- 						<img src="https://si0.twimg.com/images/themes/theme1/bg.png" />												 -->
					</a>
					
					<input type="hidden" id='sel' value=''>
					
					<!-- 세션값 찍어보는곳... -->
					<%-- <div>					
					지금의 세션값...<br/>
					name : ${sessionScope.memberName}<br/>
					loginchk : ${sessionScope.loginchk}<br/>
					idchk : ${sessionScope.idchk}
					</div><br/><br/> --%>					
					
					<!-- 이 밑으로는 로그인... -->					
					<c:choose>
						<c:when test="${sessionScope.memberName == null }">
							<div id="logindiv" class="logHide" style="width: 175px">
								<form id="loginform" class="logHide" action="/cpr/member/login" method="post">
									<input type="hidden" id="hrefPath" name="hpath" />
									<input id="uid" class="logType" type="text" name="userId" placeholder="id" style="max-width:165px" />
									<input id="upw" class="logType" type="password" name="userPw" placeholder="pw" style="max-width:165px"/><br /><br />																
									<div align="right">
										<input id="loginBtn" class="logHide" type="submit" value="로그인 야호"  />
									</div>									
								</form>
							</div>							
						</c:when>
						<c:otherwise>							
							<div id="logoutdiv" class="logShow">
									<!-- <input id="getuserId" type="text" class="logShow" style="background-color: transparent" readonly="readonly"/> -->
									<p id="getuserId" style="color: white">${sessionScope.memberName } 님 환영합니다 :)<p><br/><br/>
									<form id="logoutform" class="logShow" action="/cpr/member/logout" method="post">
										<input type="hidden" id="hrefPath" name="hpath"/>									
										<div align="right">
											<input id="logoutBtn" class="logShow" type="submit" value="로그아웃 야호"  />
										</div>
									</form>									
							</div>
						</c:otherwise>
					</c:choose>					
					<!-- 여기까지 로그인 텟스트중... -->
					<div style="margin-top: 30px; margin-bottom: 30px"></div>
					
				<div id="headerBg">
<!-- 					<nav id="nav-main" class="nav-collapseE clearfix" role="navigation"> -->
<!-- 						<div class="menu-first-container"> -->
							<ul id="menu-first" class="main-nav">
								<li id="menu-item-1" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
									<a href="/cpr/">Home</a>
								</li>
								<li id="menu-item-2" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
									<a href="/cpr/mapByDistance">Map</a>
								</li>
								<li id="menu-item-3" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
									<a href="/cpr/member/join">Join</a>
								</li>
								<li id="menu-item-4" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
									<c:choose>
										<c:when test="${sessionScope.memberIdx == null}">
											<a href="/cpr/member/viewInfo/0">개인정보보기</a>
										</c:when>
										<c:otherwise>
											<a href="/cpr/member/viewInfo/${sessionScope.memberIdx}">개인정보보기</a>
										</c:otherwise>
									</c:choose>
								</li>
								<li id="menu-item-10" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1" style="display:none">
								
								</li>									
								<!-- 세션의 멤버 레벨에 따라 틀려져야 됭디... 참 골때린다... -->
								<c:choose>										
										<c:when test="${sessionScope.selIdx != null}">
											<li id="menu-item-5" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
												<a href="/cpr/product/register">상품 등록</a>
											</li>
									</c:when>										
								</c:choose>
<!-- 								<li id="menu-item-6" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">									 -->
<!-- 								</li> -->
								<li id="menu-item-7" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1">
									<a href="/cpr/price">가격비교</a>
								</li>
								<li id="menu-item-9" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1" style="display:none">
									<a href="/cpr/reserve/list?page=1">예약 확인 게시판</a>									
								</li>
								<li id="menu-item-8" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1" style="display:none">
									<a href="/cpr/request/list?page=1">역경매 게시판</a>									
								</li>								
							</ul>
<!-- 					<nav id="nav-footer"> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 								<a href="http://hongikdmd.com/meme/teaser"><img src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/images/teaser.png" alt=""> -->
<!-- 									<p>teaser	</p> -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<a href="http://www.facebook.com/pages/2012-Hongik-Univ-DMD-Graduation-Exhibition-meme/458860957490472"><img src="http://hongikdmd.com/meme/wp-content/themes/theme_meme2/images/face.png" alt=""> -->
<!-- 									<p>facebook</p> -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
					</div>
				</div>
			</div>
		</header>
		<!-- 왼쪽 사이드 끝-->	
	<script type="text/javascript">
	
	// 로그인 예외 처리...
	function chk(){
		//lh.js에선 세션값을 못 찍길래 여기로 가져옴...
		var loginchk = '${sessionScope.loginchk}';
		var idchk = "${sessionScope.idchk}";		
		
		if(idchk){
			alert('아이디가 틀렸습니다');			
			$.post('/cpr/member/check');			
		}else if(loginchk){
			if(loginchk==0){
				//alert('신율 게시판 Beta.ver 0.1 로그인 포인트는 없습니다!!!');
				
				$('#menu-item-9').attr('style', 'display:block');
				$('#menu-item-8').attr('style', 'display:block');				
				
				return;
			}else if(loginchk==1){
				alert('비밀번호가 틀렸습니다');
			}else if(loginchk==2){
				alert('err1:알수 없는 오류(1)입니다');
			}else{
				alert('err2:알수 없는 오류(2)입니다');
			}
			$.post('/cpr/member/check');
		}
	};

	chk();		
	
	var selIdx = '${sessionScope.selIdx}';	
	$('#sel').val(selIdx);
// 	console.log('selIdx : ' + selIdx);
	</script>
	
	<script type='text/javascript' src="/cpr/resources/js/lh.js"></script>
		
</body>
</html>