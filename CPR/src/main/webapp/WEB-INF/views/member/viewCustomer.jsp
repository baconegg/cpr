<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body style="margin-left: 1px">

	<div id="wrap" class="wrap" role="document">
		<!--슬라이드용 이미지-->
<!-- 		<div class="row-fluid"> -->
<!-- 			<div class="span12 wpb_top_slider wpb_gallery"> -->
<!-- 				<span id="portfolio_top_loader"></span> -->
<!-- 				<div class="wpb_gallery_slides flexslider wpb_flexslider" data-interval="5" data-flex_fx="fade"> -->
<!-- 					<ul class="slides"> -->
<!-- 						
<!-- 							<li> -->
<!-- 								<iframe src="http://player.vimeo.com/video/52622122" width="100" height="56" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> -->
<!-- 							</li>-->
<!-- 						"../resources/images/market-wallpaper-1024x576.jpg" -->
<!-- 						<li><img src="/cpr/resources/images/default/join/01.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 						<li><img src="/cpr/resources/images/default/join/02.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 						<li><img src="/cpr/resources/images/default/join/03.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 						<li><img src="/cpr/resources/images/default/join/04.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 						<li><img src="/cpr/resources/images/default/join/05.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 						<li><img src="/cpr/resources/images/default/join/06.jpg" class="attachment-large" alt="upnup_Slide_1" /></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- 슬라이드 끝 -->
			<!-- END .wpb_top_slider -->
<!-- 		</div> -->
		<div id="top-title"></div>
		<div id="content" class="row-fluid">
			<div id="main" class="span12" role="main">
				<div class="wpb_content_wrapper">
					<article class="post-83 portfolio type-portfolio status-publish hentry" id="post-83">
						<header>
							<h1 class="entry-title">회원정보수정</h1>
<!-- 							<p class="portfolio_categories"> -->
<!-- 								<a href="http://hongikdmd.com/meme/portfolio/category/interaction/" title="???">???</a> -->
<!-- 							</p> -->
							<!-- <span class="post-format video_project_format"></span> -->
<style type="text/css">

.s-text {
	display: none;
}
.post>header .post-format,.portfolio>header .post-format {
	background-size: 80%
}
.format-video>header .post-format,.portfolio>header .post-format.video_project_format {
	background-image: none;
}
.summary h3 {
	font-size: 12px;
}

</style>
						</header>

						<!--  -->
						<div class="row-fluid">

							<!--  -->
							<div class="wpb_content_element span6 identity column_container">
								<div class="wpb_wrapper">
									<div class="vc_text_separator wpb_content_element separator_align_left designers">
										<div>회원정보수정</div>
									</div>
									<div class="row-fluid">
										<div class="wpb_content_element span12 wpb_text_column">
											<div class="wpb_wrapper"></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 상세주소  수정하기 누르기 전에 누르면 맵 뜨는 거 예외처리 해야 됨 -->
							<div class="wpb_content_element span9 column_container">
								<div class="wpb_wrapper">
									<div class="row-fluid">
										<div class="wpb_content_element span12 wpb_text_column">
											<div class="wpb_wrapper" id="join_seller">
												<h3>회원 정보</h3>
												<form id="info" method="post" enctype="multipart/form-data">
													<br />
													<p>
														<br />회원 아이디(수정불가)</br> <input type="text" id="member_ID" name="memberId" class="" value="${vo.memberId}" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<p>
														<br />회원 비밀번호</br> <input type="password" id="member_PW" name="memberPw" class="change" value="${vo.memberPw }" readonly="readonly">
													</p>
													<br />
													<p>
														</br>회원 이름(수정불가)</br> <input type="text" id="member_NAME" name="memberName" class="" value="${vo.memberName }" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<p>
														<br />회원 연락처</br> <input type="text" id="member_TEL" name="memberTel" class="change" value="${vo.memberTel }" readonly="readonly">
													</p>
													<br />
													<p>
														</br> 가입일(수정불가)</br> <input type="text" id="member_REG" name="memberReg" class="" value="${vo.memberReg }" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<!-- 상세주소  수정하기 누르기 전에 누르면 맵 뜨는 거 예외처리 해야 됨 -->
													<p>
														</br>상세 주소(지도에서 선택해 주세요)</br> <input type="text" id="userAddress" name="customerAddress" class="" value="${vo.customerAddress }" readonly="readonly">
													</p>
													<br />
													<!-- 버튼 -->
													<input type="hidden" id="member_IDX" name="memberIdx" value="${vo.memberIdx }">
													<input type="button" id="customerBtn" class="hides" value="수정하기">
													<input type="hidden" id="modifyCustomer" class="shows" value="수정 제출">
													<input type="button" id="removeCustomer" class="remove" value="탈퇴!!!">
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
			</div>
			<!-- /#main -->

			<div class="footer-h3">

				<!-- naver map -->
				<!-- 나중에 지도 없애기 버튼을 위한 디스플레이 속성 -->
				<div id="map" style="border: 1px solid #000; display: none"></div>
				<form name="selectLocation">
					<input name="latInput" type="hidden" id="latInput" value="" /> <input
						name="lngInput" type="hidden" id="lngInput" value="" />
					<!-- <input type="submit" value="sendAddress" /> -->
				</form>

				<!-- 테스트중... -->
				<!-- 요까지 테스트중... -->

			</div>

		</div>
		<!-- /#content -->
	</div>
	
	<script type="text/javascript">
		// (소비자)수정하기를 눌렀을때 리드온리 풀어주는 부분...
		$('#customerBtn').on('click', function() {
			console.log('커스터머버튼을 눌럿스미다');
			change();
		});
		// (소비자)수정 완료 이벤트!!!
		$('#modifyCustomer').on('click',function() {
			var jsonObj = JSON.parse(JSON.stringify($('#info').serializeObject()));
			var memberIdx = $('#member_IDX').val();
			console.log(jsonObj);
			$.post('/cpr/member/modify/customer', jsonObj).done(function(data) {
				alert("정보 수정이 완료되었습니다.");
				location.href = "/cpr/member/viewInfo/"+ memberIdx;
			});
		});

		// 리드 온리니 뭐니 풀어주는 애들...
		function change() {
			$('.change').removeAttr('readonly');
			$('.hides').attr('type', 'hidden');
			$('.shows').attr('type', 'button');
			$('.shows').removeAttr('hidden');
			$('#member_ID').focus();
		}
		
		// 에이쟉스 처리를 위해 보험용으로...(안쓰고 있음...)
		function submiss() {
			$('.change').attr('readonly', 'readonly');
			$('.hides').attr('type', 'button');
			$('.shows').attr('type', 'hidden');
			$('#member_ID').focus();
		}

		// 탈퇴 처리!!!//////////////////////////////////////////////////////////////////////////////////////
		$('.remove').on('click',function() {
			if (confirm('셀러가 탈퇴하겟다고???') == true) {
				var jsonObj = JSON.parse(JSON.stringify($('#info').serializeObject()));
				$.post('/cpr/member/remove/customer', jsonObj).done(function(data) {
					alert("넌 이미 죽어있따!!!");
					location.href = "/cpr/member/join";
				});
			} else {
				alert('탈퇴 취소');
			}
		});
		
		// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
		$('#menu-item-4').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	</script>

</body>
</html>