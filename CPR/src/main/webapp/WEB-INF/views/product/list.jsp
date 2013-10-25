<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html> 
<link rel="stylesheet" type="text/css" href="/cpr/resources/css/attach/component.css" />
<body style="margin-left: 1px">
	<div id="wrap" class="wrap" role="document">
			<div id="content" class="row-fluid">
				<div id="main" class="span12" role="main">
					<span id="portfolio_top_loader"></span>
					
					<!-- list.min.js...ê²ì -->
					<div id="example-list" style="size: auto;">								
					    <input class="search" placeholder="    검색어를  입력해주세요" />
					    					    
					    <!-- <ul class=""> -->
					    	<li class="list" style="list-style-type: none;" >

								<c:forEach var="list" items="${list}">
									<article id="post-132" class="post-132 portfolio type-portfolio status-publish hentry portfolio_thumb span4">
										<!-- ${list.productOrigin} 타이틀에 넣을려다가 지저분해 지길래 빼버림... -->
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${sessionScope.memberLev == 2}"> --%>
<%-- 												<a href="/cpr/product/view/seller?productIdx=${list.productIdx }" title=""> --%>
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												<a href="/cpr/product/view/customer?productIdx=${list.productIdx }" title=""> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
											<a href="/cpr/product/view?productIdx=${list.productIdx }" title="">
											<div class="post-thumb">
												<div class="cover"></div>
												<img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${list.productImgUUID}" class="attachment-portfolio-thumb wp-post-image" alt="scents_thumb" />
											</div>
											
										
												<header>
													<div class="summary">
														<h3>
															<span>${list.productIdx}</span> <span class="feature">${list.productName}</span>
														</h3>
														<div class="s-text">
															<p>${list.productInfo}</p>
														</div>
													</div>
													<span class="post-format"></span>
												</header>
										
										</a>
									</article>
									
<%-- 									<c:if test="${list.productEvent == 1}"> --%>
<!-- 										<div id="popup" style="z-index: 10000; position: absolute; width: 230px; left: 90px; top: 210px; display: block;"> -->
<!-- 											<form name="form" style="padding:0pt;margin:0pt"> -->
<!-- 												<table width="100%" height="100%" cellspacing="0" border="5" bgcolor="#f2f2f2"> -->
<!-- 													<tbody> -->
<!-- 														<tr> -->
<!-- 															<td valign="top" style="padding:20px;padding-bottom:5px" align="center" > -->
<%-- <%-- 																<c:choose> --%> --%>
<%-- <%-- 																	<c:when test="${sessionScope.memberLev == 2}"> --%> --%>
<%-- <%-- 																		<a href="/cpr/product/view/seller?productIdx=${list.productIdx }" title=""> --%> --%>
<%-- <%-- 																	</c:when> --%> --%>
<%-- <%-- 																	<c:otherwise> --%> --%>
<%-- <%-- 																		<a href="/cpr/product/view/customer?productIdx=${list.productIdx }" title=""> --%> --%>
<%-- <%-- 																	</c:otherwise> --%> --%>
<%-- <%-- 																</c:choose> --%> --%>
<%-- 																	<a href="/cpr/product/view?productIdx=${list.productIdx }" title=""> --%>
																
<%-- 																	<img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/${list.productImgUUID}" class="attachment-portfolio-thumb wp-post-image" alt="scents_thumb" /> --%>
<!-- 																	</a> -->
<!-- 																<br> -->
<%-- 																 [ 특가 상품 ]&nbsp;&nbsp;${list.productName}				 --%>
<!-- 															</td> -->
<!-- 														</tr> -->
<!-- 														<tr> -->
<!-- 															<td height="30" bgcolor="#717171" align="right" width="100%" style="padding-right:10px;"> -->
<!-- 															<input name="special" type="checkbox" id="special" value="checkbox" align="absmiddle">&nbsp;<font color="#ffffff">오늘 하루동안 이 창을 열지 않음</font> -->
<!-- 															<a href="#" onclick="special_closeWin()" class="font4">[닫기]</a> -->
<!-- 															</td> -->
<!-- 														</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
<!-- 											</form> -->
<!-- 										</div> -->
<%-- 									</c:if> --%>
									
								</c:forEach>
							</li>
						<!-- </ul> -->
					</div>
					<!-- /#example-list -->

				</div>
				<!-- /#main -->
			</div>
			<!-- /#content -->
		</div>
		<!-- /#wrap -->
		
		<script type="text/javascript">
		//팝업 작업 ~!
		if ( special_getCookie( "special" ) != "done" ){
// 				document.getElementById('popup').style.display = "inline-block";
				$('#popup').attr('style', 'display:inline-block');
			}

		
		function special_setCookie( name, value, expiredays ){
		        var todayDate = new Date();
		        todayDate.setDate( todayDate.getDate() + expiredays );
		        document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
		 return;
		}
	
		function special_getCookie( name ){
		  var nameOfCookie = name + "=";
		  var x = 0;
		  while ( x <= document.cookie.length )
		  {
		   var y = (x+nameOfCookie.length);
		   if ( document.cookie.substring( x, y ) == nameOfCookie ) {
		    if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
		      endOfCookie = document.cookie.length;
		    return unescape( document.cookie.substring( y, endOfCookie ) );
		   }
		   x = document.cookie.indexOf( " ", x ) + 1;
		   if ( x == 0 ) break;
		  }
		  return "";
		}

		function special_closeWin() {
// 			console.log("닫기 누름");
		 
			var formName = eval("document.form");
// 			console.log(formName);
// 			console.log(formName.special.checked);
			 
			if ( formName.special.checked ) {
				special_setCookie( "special", "done" , 1); // 1=하룻동안 공지창 열지 않음
			}
			closeDiv(); 
		}

		function closeDiv(){
			$('#popup').css('display','none');
		}

		
		// 리스트 검색용(list.min.js...)
		var options = {
		    valueNames: [ 'feature', 'description' ]
		};
	
		var featureList = new List('example-list', options);

		$('#menu-item-5').attr('class', 'change btn btn-primary');
			
/////////////////////////////////////////////////header에 있으니 밑에부분 필요없을듯...///////////////////////////////////////////////////////////			
// 			// a 태그 링크 갈곳 메뉴명 정해줘야 됨...
// 			var inhtml = '';
// 			var memberLev = '${sessionScope.memberLev}';
// 			console.log(memberLev);
			
// 			if(memberLev == 2){
// 				inhtml = '<a href="/cpr/product/register">상품등록</a>';
// 				$('#menu-item-5').html(inhtml);			
// // 				$('#menu-item-5').attr('class', 'change btn btn-primary');
// 			}else{
// // 				inhtml = '<a href="">(커스터머용 메뉴)</a>';
// 			}
		
			//메뉴 만들기..
// 			$('#menu-item-5').attr('style', 'display:inline-block');
//			$('#menu-item-7').attr('style', 'display:inline-block');
//			$('#menu-item-9').attr('style', 'display:inline-block');
			
		</script>		
</body>
</html>