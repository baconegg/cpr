<%@page import="org.shinyul.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<body style="margin-left: 1px">

	<div id="wrap" class="wrap" role="document">
		
		
		<div id="top-title"></div>
		<div id="content" class="row-fluid">
			<div id="main" class="span12" role="main">
				<div class="wpb_content_wrapper">
					<article class="post-83 portfolio type-portfolio status-publish hentry" id="post-83">
						<header>
							<h1 class="entry-title">회 원 &nbsp;&nbsp;&nbsp;정 보</h1>
							<!-- <p class="portfolio_categories">
								<a href="http://hongikdmd.com/meme/portfolio/category/interaction/" title="???">???</a>
							</p> -->
							<!-- <span class="post-format video_project_format"></span> -->
							<style type="text/css">
.s-text {
	display: none;
}

.post>header .post-format,.portfolio>header .post-format {
	background-size: 80%
}

.format-video>header .post-format,.portfolio>header .post-format.video_project_format
	{
	background-image: none;
}

.summary h3 {
	font-size: 12px;
}
</style>
						</header>

						<!--  -->
						<div class="row-fluid">
							<div class="wpb_content_element span6 identity column_container">
								<div class="wpb_wrapper">
									
									<div class="row-fluid">
										<div class="wpb_content_element span12 wpb_text_column">
											<div class="wpb_wrapper"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="wpb_content_element span9 column_container">
								<div class="wpb_wrapper">
									<div class="row-fluid">
										<div class="wpb_content_element span12 wpb_text_column">
											<div class="wpb_wrapper" id="join_seller" align="left">
												
												<form id="info" method="post" enctype="multipart/form-data">
													<br />
													<p>
														<br />회원 아이디(수정불가)</br>
														<input type="text" id="member_ID" name=<%=Constant.Session.MEMBER_ID %> class="" value="${vo.memberId}" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<p>
														<br />회원 비밀번호</br>
														<input type="password" id="member_PW" name=<%=Constant.Session.MEMBER_PW %> class="change" value="${vo.memberPw }" readonly="readonly">
													</p>
													<br />
													<p>
														</br>회원 이름(수정불가)</br>
														<input type="text" id="member_NAME" name=<%=Constant.Session.MEMBER_NAME %> class="" value="${vo.memberName }" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<p>
														<br />회원 연락처</br>
														<input type="text" id="member_TEL" name="memberTel" class="change" value="${vo.memberTel }" readonly="readonly">
													</p>
													<br />
													<p>
														</br> 가입일(수정불가)</br>
														<input type="text" id="member_REG" name="memberReg" class="" value="${vo.memberReg }" readonly="readonly" style="background-color: transparent;">
													</p>																									
													<br />
													<input type="hidden" id="member_IDX" name=<%=Constant.Session.MEMBER_IDX %> value="${vo.memberIdx }">
												
													<p>
														</br>업종(셀렉트로 처리 해야됨...)</br> <input type="text" id="work_TYPE" name="workType" class="hides" value="${vo.workType }" readonly="readonly">
														<select id="sel_TYPE" name="selType" class="shows" hidden="hidden">
															<option id="" value="1">야채/채소</option>
															<option id="" value="2">수산/건어</option>
															<option id="" value="3">식료/반찬</option>
															<option id="" value="4">정육/족발</option>
															<option id="" value="5">닭/치킨</option>
															<option id="" value="6">과일/견과</option>
															<option id="" value="7">떡집/빵집</option>
															<option id="" value="8">스낵/음식</option>
															<option id="" value="9">의류/패션</option>
															<option id="" value="10">이불/신발</option>
															<option id="" value="11">생활/편의</option>
															<option id="" value="12">미용/건강</option>
														</select>
													</p>
													<br />
													<p>
														</br>상점명</br>
														<input type="text" id="sel_STORE" name="selStore" class="change" value="${vo.selStore }" readonly="readonly">
													</p>
													<br />
													<p>
														</br>상점 상세주소(구/시장으로 나눠서 셀렉트 처리...)</br>
														<input type="text" id="sel_Address" name="selAddress" class="hides" value="${vo.selAddress }" readonly="readonly">
														<select select id="m_CODE" name="mCode" class="shows" hidden="hidden">
															<option id="m_CODE_opt_1" value="1">강남구</option>
															<option id="m_CODE_opt_2" value="2">강동구</option>
															<option id="m_CODE_opt_3" value="3">강북구</option>
															<option id="m_CODE_opt_4" value="4">강서구</option>
															<option id="m_CODE_opt_5" value="5">관악구</option>
															<option id="m_CODE_opt_6" value="6">광진구</option>
															<option id="m_CODE_opt_7" value="7">구로구</option>
															<option id="m_CODE_opt_8" value="8">금천구</option>
															<option id="m_CODE_opt_9" value="9">노원구</option>
															<option id="m_CODE_opt_10" value="10">도봉구</option>
															<option id="m_CODE_opt_11" value="11">동대문구</option>
															<option id="m_CODE_opt_12" value="12">동작구</option>
															<option id="m_CODE_opt_13" value="13">마포구</option>
															<option id="m_CODE_opt_14" value="14">서대문구</option>
															<option id="m_CODE_opt_15" value="15">서초구</option>
															<option id="m_CODE_opt_16" value="16">성동구</option>
															<option id="m_CODE_opt_17" value="17">성북구</option>
															<option id="m_CODE_opt_18" value="18">송파구</option>
															<option id="m_CODE_opt_19" value="19">양천구</option>
															<option id="m_CODE_opt_20" value="20">영등포구</option>
															<option id="m_CODE_opt_21" value="21">용산구</option>
															<option id="m_CODE_opt_22" value="22">은평구</option>
															<option id="m_CODE_opt_23" value="23">종로구</option>
															<option id="m_CODE_opt_24" value="24">중구</option>
															<option id="m_CODE_opt_25" value="25">중랑구</option>
														</select> <select id="mar_IDX" name=<%=Constant.Session.MAR_IDX %> class="shows"
															hidden="hidden">
														</select>
													</p>
													<br />
													<p>
														</br>상점 번호</br>
														<input type="text" id="sel_Store_NO" name="selStoreNo" class="change" value="${vo.selStoreNo }" readonly="readonly">
													</p>
													<br />
													<p>
														</br>상점 소개</br>
														<%-- <input type="text" id="sel_INFO" name="selInfo" class="change" value="${vo.selInfo }" readonly="readonly"> --%>
														<textarea rows="10" cols="30" id="sel_INFO" name="selInfo" class="change" readonly="readonly">${vo.selInfo }</textarea>
													</p>
													<br />
													<p>
														</br>평가(수정불가)</br>
														<input type="text" id="sel_LIKE" name="selLike" class="" value="${vo.selLike }" readonly="readonly" style="background-color: transparent;">
													</p>
													<br />
													<p>
														</br>상점 이미지</br>
													<div id="preview">
														<img alt="상점 이미지" src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/${vo.selImgUUID}" id="productImg">
													</div>
													<input type="file" id="file" name=<%=Constant.Session.FILE %> onchange="previewImage(this, 'preview')" style="display: none">
													</p>
													<br />
													<input type="hidden" id="member_IDX" name=<%=Constant.Session.MEMBER_IDX %> value="${vo.memberIdx }">
													<input type="hidden" id="guName_MarId" name="guNameMarId" value="${vo.guNameMarId }">
													<input type="hidden" id="sel_Img_ORI" name="selImgOri" value="${vo.selImgOri }">
													<input type="hidden" id="sel_Img_UUID" name="selImgUUID" value="${vo.selImgUUID }">
													<!-- 버튼 -->
													<input type="hidden" id="sel_IDX" name=<%=Constant.Session.SEL_IDX %> value="${vo.selIdx}">
													<input type="button" id="sellerBtn" class="hides" value="수정하기">
													<input type="hidden" id="modifySeller" class="shows" value="수정 제출">
													<input type="button" id="removeSeller" class="remove" value="탈퇴!!!">
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
			</div>
		</div>
		<!-- /#content -->
	</div>
	
	<script type="text/javascript">
		// (판매자)수정하기를 눌렀을때 리드온리 풀어주는 부분...
		$('#sellerBtn').on('click', function() {
			console.log('셀러버튼을 눌럿스미다');
			change();
			$('#file').attr('style', 'display:block')

			//셀타입 셀렉트 나타나면서 맞는거 선택해놓는거...
			$('#sel_TYPE').val('${vo.selType}');
			$('#m_CODE').val('${vo.mCode }');

			//option을 먼저 만들고 option value를 서버서 받은 값으로 셋팅...
			var mCode = '${vo.mCode }';
			setmarket(mCode);
		});
		// (판매자)수정 완료 이벤트!!!
		$('#modifySeller').on('click', function() {
			var fdata = new FormData($('#info')[0]);
			var selIdx = $('#sel_IDX').val();
			$.ajax({
				url : '/cpr/member/modify/seller',
				type : "POST",
				data : fdata,
				cache : false,
				contentType : false,
				processData : false,
				success : function() {
					alert("정보 수정이 완료되었습니다.");
// 					location.href = "/cpr/member/viewSeller/" + selIdx;
					location.href = "/cpr/member/viewInfo/" + memberIdx;
				}
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
		// 세팅해 주는 애...
		function setmarket(mCode) {
			$.post('/cpr/member/join/market', {'mCode' : mCode}).done(function(data) {
				marketOpt(data);
				$('#mar_IDX').val('${vo.marIdx }');
			});
		};		
		function marketOpt(data) {
			var inhtml = "";
			for ( var i = 0; i < data.length; i++) {
				inhtml += '<option id="opt_'+i+'" class="'+data[i].mAddr+'" name="'+data[i].guNameMarId+'" value="'+data[i].marIdx+'">' + data[i].marId + '</option>'; //guNameMarId
				$('#mar_IDX').html(inhtml);
			};
		};
		// 구 바뀔때 처리 해주는 애
		$('#m_CODE').on('change', function() {
			var mCode = $(this).val();
			$.post('/cpr/member/join/market', {'mCode' : mCode}).done(function(data) {
// 				console.log(data);
				marketOpt(data);				
				//구 바뀌면서 시장 바뀔때 덩달아 다른 값들도 바꿔서 세팅해줘야 되므로 ...;;;
				var gnmid = $('#opt_0').attr('name');
				var mAddr = $('#opt_0').attr('class');
				console.log(mAddr);
				$('#guName_MarId').val(gnmid);
				$('#sel_Address').val(mAddr);
				console.log($('#sel_Address').val())
				
			});
		});
		// 시장 바뀔때 처리 해주는 애
		$('#mar_IDX').on('change', function() {
			var idx = $(this).context.options.selectedIndex;
			var gnmid = $('#opt_' + idx).attr('name');
			var mAddr = $('#opt_' + idx).attr('class');
			console.log(mAddr);
			$('#guName_MarId').val(gnmid);
			$('#sel_Address').val(mAddr);
			console.log($('#sel_Address').val())
		});
		
		

		// 에이쟉스 처리를 위해 보험용으로...(안쓰고 있음...)
		function submiss() {
			$('.change').attr('readonly', 'readonly');
			$('.hides').attr('type', 'button');
			$('.shows').attr('type', 'hidden');
			$('#member_ID').focus();
		}

		// 탈퇴 처리!!!//////////////////////////////////////////////////////////////////////////////////////
		$('.remove').on('click',function() {
			if (confirm('탈퇴하시겠습니까?') == true) {
				var jsonObj = JSON.parse(JSON.stringify($('#info').serializeObject()));
				$.post('/cpr/member/remove/seller', jsonObj).done(function(data) {
					alert("탈퇴되셨습니다.");
					location.href = "/cpr/member/join";
				});
			} else {
// 				alert('탈퇴 취소');
			}
		});
		
		// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
// 		$('#menu-item-4').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
		$('#menu-item-4').attr('class', 'change btn btn-primary');
	</script>

</body>
</html>