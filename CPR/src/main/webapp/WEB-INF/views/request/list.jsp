<%@page import="org.shinyul.util.Constant"%>
<%@page import="org.shinyul.domain.Criteria"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
<script type="text/javascript">
// 	console.log("${sessionScope.cri}");
</script>
<body style="margin-left: 1px">

<div id="content_wrap" >
        
    <div id="wrap" class="wrap" role="document">
        
			<!-- 제일 위부분의 파란색 바 -->
        	<div id="top-title"></div>
        	
			<div id="content" class="row-fluid">
		       <div id="main" class="span12" role="main">
		        <div class="wpb_content_wrapper">
    	               <div class="page-header">
				      	 <h1>패키지 매칭 리스트</h1>
				       </div>
					   
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
						 				<th>번호</th>
						 				<th>신청인</th>
						 				<th>제목</th>
						 				<th>신청시간</th>
						 				<th>업체수</th>
						 				<th>진행상황</th>
					 				</tr>
					 			</thead>
					 			<tbody id="tbodyList">
					 			<tr><td colspan="6" class="line1"></td></tr>
					 				<c:forEach items="${list}" var="list" >
					 				<tr>
					 					<td>${list.idx }</td>
						 				<td>${list.memberId }</td>
						 				<td id="titleList" >
						 				
						 				<a id="reserveViews" href="view?idx=${list.idx }&gunamemarid=${list.gunameMarid }">${list.title }</a>
						 				</td>
						 				<td>${list.time }</td>
						 				<td>${list.replyCnt }</td>
						 				<td>
						 					
						 					<c:choose>
						 						<c:when test="${list.flag  == 0}">
						 							입찰 취소
						 						</c:when>
						 						<c:when test="${list.flag == 1}">
						 							입찰 진행
						 						</c:when>
						 						<c:when test="${list.flag == 2}">
						 							거래 성사
						 						</c:when>
						 					</c:choose>
						 					<input type="hidden" id="total" value="${list.total}"/>
						 				</td>						 								 			
					 				</tr>	
					 				</c:forEach>					 				  
					 			</tbody>					 			
					 		</table>
					 		 
					    </div> 
					    <div id="paging"  align="center" >					    	
					    </div><br/>
					    <div id="search_list"  align="center">
					    	<form action="/cpr/request/list" id="formSearch" method="get" >
						    	<select name="type" id="type">
						    		<option value="">선택해 주세요</option>
						    		<option value="title">제목</option>
						    		<option value="writer">아이디</option>
						    		<option value="content">내용</option>
						    		<option value="guNameMarId">시장명</option>
						    	</select>
						    	<input type="hidden" id="page" name=<%=Constant.Session.PAGE %> value="${sessionScope.cri.page }">
						    	<input type="text" id="keyword" name=<%=Constant.Session.KEYWORD %> value="${sessionScope.cri.keyword}">
						    	<a href="" class="btn btn-large btn-block btn-success" style="font-weight:bold" id="btnSearch">검 색</a>
								
						    	 <!-- 글쓰기 버튼 -->
						    	 <a href="/cpr/request/register" class="btn btn-large btn-block btn-success" style="font-weight:bold" id="register">경매 등록</a>
								
<!-- 					    		<input type="button" id="register" value="경매등록" > -->
					    	</form>
					    </div>    
		        </div> <!-- end .wpb_content_wrapper -->
		       </div><!-- /#main -->
            </div>
  
    </div><!-- /#wrap -->
</div>
<script type="text/javascript">
	// 이프 엘스로 나누어 줘야 됨... -> 태구형
/* 	var inhtml = '';
	var testing = ${sessionScope.memberLev }	
	console.log(testing);	
	if(testing == 2){
		inhtml = '<a href="/cpr/product/list/'+${msVo.selIdx}+'">상점가기(셀러)</a>';
	}else{
		inhtml = '<a href="/cpr/product/list/'+${msVo.selIdx}+'">상점가기(커스터머)</a>';
	}
	$('#menu-item-5').html(inhtml); */
	
	//글 등록
// 	$('#register').on('click', function(){
// 		location.href = '/cpr/request/register';
// 	});
	
	// 페이징 처리
	var total = $("#total").val();
// 	console.log(total);
	var pageSize = 10;
	var end = (Math.ceil(total/pageSize));
// 	console.log(end);
	
	if(end <=11){	
		var start = 1;
	}else{		
		var start = parseInt(end/pageSize)*10 +1;
	}
	
	var innerHTML = "";
	
	function paging(){
		
		if(start > 1){
			innerHTML += "["+"<a id='page' style='font-weight:bold;' > "+"이전"+" </a>"+"]";
			
		};
		
		for(var i= start; i <=end; i++){
			
			if(i == end){
				
				if(total%100 == 2){
					innerHTML += "["+"<a id='page' style='font-weight:bold;'> "+"다음"+" </a>"+"]";
				}else{
					innerHTML += "["+"<a  id='page' style='font-weight:bold;' > "+i+" </a>"+"]";		
				};
				
			}else{
				innerHTML += "["+"<a  id='page' style='font-weight:bold;' > "+i+" </a>"+"]";		
			};
			
		};
		
		return innerHTML;
	};
	
	function movePage(page){
		location.href="list?page="+page+"&keyword=${sessionScope.cri.keyword}&type=${sessionScope.cri.type}";
	}
	
	$("#paging").html(paging()).delegate('a', 'click', function(){
		
		if($(this).html() == "이전"){
			
			movePage(start-1);
		}else if($(this).html() == "다음"){
			movePage(end);
		}else{
			movePage($(this).html());
		}		
	});	

	// 검색시 이전 값 가져오기
	$("#type").val("${sessionScope.cri.type }");
	
	//역경매 메뉴 만들기..
//	$('#menu-item-8').attr('style', 'display:block');
// 	$('#menu-item-7').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	$('#menu-item-8').attr('class', 'change btn btn-primary');
</script>

</body></html>