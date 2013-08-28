<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.shinyul.domain.Criteria"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
// 	console.log("${sessionScope.cri}");
// 	console.log("----------------------------");
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
					        	<h1 class="entry-title" align="center" style="font-weight:bold" >주 문 &nbsp;&nbsp;&nbsp;현 황</h1>
					        	<span class="post-format"></span>
					            <style type="text/css">
							        .s-text {display:none;}
									.post > header .post-format, .portfolio > header .post-format {background-size:80%}
									.format-video > header .post-format, .portfolio > header .post-format.video_project_format {background-image:none;}
									.summary h3 { font-size:12px; 	}
					        	</style>
					      	  </header>
					   
						<div class="row-fluid"  align="center">	
								 
					 		<table id="listTable">
					 			<colgroup>
									<col style=" text-align:center;">
									<col style=" text-align:center;">
									<col style="text-align:left;">									
									<col style=" text-align:center;">
									<col style=" text-align:center;">
									<col style=" text-align:center;">
								</colgroup>
					 			<thead>
					 				<tr>
						 				<th>주문번호</th>
						 				<th>신청시간</th>
						 				<th>제목</th>
						 				<th>수량</th>
						 				<th>가격</th>
						 				<th>수취시간</th>
						 				<c:choose>
						 					<c:when test="${sessionScope.memberLev == 1}"><th>시장명</th><th>상점명</th></c:when>
						 					<c:otherwise><th>주문자 아이디</th><th>주문자 이름</th></c:otherwise>
						 				</c:choose>
						 				<th>주문 상태</th>
					 				</tr>
					 			</thead>
					 			<tbody id="tbodyList">
					 				<tr><td colspan="9" class="line1"></td></tr>
					 				<c:forEach items="${list}" var="list" >
					 				<tr>
					 					<td>${list.reserveIdx }</td>
						 				<td>${list.reserveTime }</td>
						 				<td id="titleList">
						 				<a id="reserveViews"  href="view?reserveIdx=${list.reserveIdx }" >${list.productName }</a>
						 				</td>
						 				<td>${list.reserveQty }</td>
						 				<td>${list.productPrice }</td>
						 				<td>${list.reserveReceiveTime}</td>
						 				<c:choose>
						 					<c:when test="${sessionScope.memberLev == 1}"><td>${list.marId}</td><td>${list.selStore}</td></c:when>
						 					<c:otherwise><td>${list.memberId}</td><td>${list.memberName}</td></c:otherwise>
						 				</c:choose>
						 				<td>
						 				<c:choose>
						 					<c:when test="${list.reserveFlag == 0}" >상품 준비중</c:when>
						 					<c:when test="${list.reserveFlag == 1}">준비 완료</c:when>
						 					<c:otherwise>취소</c:otherwise>
						 				</c:choose>
						 				</td>		 								 			
					 				</tr>
				 					<input type="hidden" id="total" value="${list.total}"/>
					 				</c:forEach>					 				  
					 			</tbody>					 			
					 		</table>
					 		 
					    </div> 
					    <div id="paging" align="center">					    	
					    </div><br/>
					    <div id="search_list" align="center" >
					    	<form action="/cpr/reserve/list" id="formSearch" method="get"  >
						    	
						    	<select name="type" id="type">
						    		<option value="">선택 해주세요</option>
						    		<option value="title">제목 + 내용</option>
						    		<option value="reserveDate">신청일</option>
						    		<option value="reserveReceiveTime">수령시간</option>
						    		<c:choose>
							    		<c:when test="${sessionScope.memberLev == 1}">
							    			<option value="market">시장명</option>
							    			<option value="store">상점명</option>
							    		</c:when>
							    		<c:otherwise>
							    			<option value="id">아이디</option>
							    			<option value="name">이름</option>
							    		</c:otherwise>
						    		</c:choose>
						    	</select>
						    	<input type="hidden" id="page" name="page" value="1">
						    	<input type="text" id="keyword" name="keyword" value="${sessionScope.cri.keyword}">
								<a href="" class="btn btn-large btn-block btn-success" style="font-weight:bold" id="btnSearch">검 색</a>
								
					    	</form>
					    </div>    
					    
					     </article>
		        </div> <!-- end .wpb_content_wrapper -->
		       </div><!-- /#main -->
            </div>
  
    </div><!-- /#wrap -->
</div>

<script type="text/javascript">
	
	
	var total = $("#total").val();
	console.log('total : ' + total);

	var startPage =(Math.floor(total / 100) - 1) * 10 + 1;
	var endPage = total / 10;
	if(total % 100 != 1){
		startPage = startPage + 10;
		endPage = endPage + 1;
	}
	if(startPage <= 1){
		startPage = 1;
	}

	console.log('startPage : ' + startPage);
	console.log('endPage : ' + endPage);
	
	var innerHTML = "";
	
	function paging(){
		
		if(startPage > 1){
			innerHTML += "["+"<a id='page' style='font-weight:bold;'> "+"이전"+" </a>"+"]";
			
		};
		
		for(var i= startPage; i <= endPage; i++){
			innerHTML += "["+"<a id='page' style='font-weight:bold'> "+i+" </strong></a>"+"]";
		}
		
		if(total % 100 == 1 && endPage > 10){
			innerHTML += "["+"<a id='page' style='font-weight:bold;'> "+"다음"+" </strong></a>"+" ]";
		}

		return innerHTML;
	};
	
	function movePage(page){
		location.href="list?page="+page+"&type=${sessionScope.cri.type}&keyword=${sessionScope.cri.keyword}";
	}
	
	$("#paging").html(paging()).delegate('a', 'click', function(){
		
		if($(this).html() == "이전"){
			
			movePage(startPage - 1);
		} else if($(this).html() == "다음"){
			movePage(Math.floor(endPage) + 1);
		} else{
			movePage($(this).html());
		}		
	});	

	// 검색시 이전 값 가져오기
	$("#type").val("${sessionScope.cri.type }");
		
	
	//역경매 메뉴 만들기..
//	$('#menu-item-8').attr('style', 'display: inline-block');
	$('#menu-item-9').attr('class', 'change btn btn-primary');
	
</script>
</body>
</html>