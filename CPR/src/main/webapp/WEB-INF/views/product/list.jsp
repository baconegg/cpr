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
					    <input class="search" />
					    					    
					    <!-- <ul class=""> -->
					    	<li class="list" style="list-style-type: none;" >

								<c:forEach var="list" items="${list}">
									<article id="post-132" class="post-132 portfolio type-portfolio status-publish hentry portfolio_thumb span4">
										<!-- ${list.productOrigin} 타이틀에 넣을려다가 지저분해 지길래 빼버림... -->
										<c:choose>
											<c:when test="${sessionScope.memberLev == 2}">
												<a href="/cpr/product/view/seller?productIdx=${list.productIdx }" title="">
											</c:when>
											<c:otherwise>
												<a href="/cpr/product/view/customer?productIdx=${list.productIdx }" title="">
											</c:otherwise>
										</c:choose>
											
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
			// 리스트 검색용(list.min.js...)
			var options = {
			    valueNames: [ 'feature', 'description' ]
			};
	
			var featureList = new List('example-list', options);
			
			
			// a 태그 링크 갈곳 메뉴명 정해줘야 됨...
			var inhtml = '';
			var memberLev = '${sessionScope.memberLev}';
			console.log(memberLev);
			
			if(memberLev == 2){
				inhtml = '<a href="/cpr/product/register">상품등록</a>';
			}else{
				inhtml = '<a href="">(커스터머용 메뉴)</a>';
			}
					
			$('#menu-item-5').html(inhtml);			
			$('#menu-item-5').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
			//역경매 메뉴 만들기..
			$('#menu-item-7').attr('style', 'display:block');
			
		</script>		
</body>
</html>