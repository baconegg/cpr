<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="margin-left: 1px">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="/cpr/resources/js/jquery.form.js"></script>

		<div id="top-title"></div>
			<div id="content" class="row-fluid">
				<div id="main" class="span12" role="main">
					<div class="wpb_content_wrapper">
						<article class="post-83 portfolio type-portfolio status-publish hentry" id="post-83">
							<header>
								<h1 class="entry-title">회원 가입</h1>
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
															
															<div class="middle">
															     <div class="sideSec" id="joinImage" >
															         <ul>
															            <li class="step1"><span id="st01" class="on"><span class="step">step1. 약관동의</span></span></li>
														                <li class="step2"><span id="st02" class=""><span class="step">step2. 기본정보입력</span></span></li>
														                <li class="step3"><span id="st03" class=""><span class="step">step3. 가입완료</span></span></li>
														             </ul>
															      </div>
															 </div>															
														</div>
													</div>
												</div>											
											</div>
										</div>
										
									
									<div class="wpb_content_element span9 column_container" >
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">
													<div class="wpb_wrapper" id="join01">

														<h3>회원가입...</h3>
														<p>
															<br/><h2>약관동의</h2><br/>
															베타테스트 중입니다...<br/>
															가입하시려면 체크박스를 체크해 주세요.<br/>															
														</p>
														<p><br/>
															동의함:<input type="checkbox" id="chkBox">
														</p>
														
														<p>															
															<input id="btn_customer"  type="button" value="구매 회원 가입" style="display:none;" > 
															<input id="btn_seller" type="button" value="판매 회원 가입" style="display:none;">															
														</p>
														
													</div>
												</div>
											</div>																						
										</div>
									</div>
									
									
									<!-- 소비자 -->
									<div class="wpb_content_element span9 column_container" >
										 <div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">
													
													<div class="wpb_wrapper" id="join_customer" style="display:none">														
														<form id="join_customer_form" method="post" modelAttribute="valichk" action="join/customer">														
															<h3>회원가입... 소비자</h3>
																<br/>
<!-- 																<p>상세정보입력..</p> -->
																<br/>
																<p>
																	아이디   <p id="messege_id"/>  </br> 
																	<input id="Member_ID" type="text" name="memberId" />
																</p>
																<p>
																	비밀번호 <p id="messege_pw"></p> </br>
																	<input id="Member_PW" type="password" name="memberPw" />
																	</p>
																<p>
																	비밀번호 확인</br>
																	<input type="password" id="Member_PW_chk"></p>
																<p>
																	이름을 입력해주세요</br>
																	<input type="text" id="Member_NAME" name="memberName">
																</p>
																<p>																	
															  		전화번호  <p id="messege_col" /></br>
																	<input id="Member_TEL" type="text" name="memberTel" />																																		
																</p>
																<p>
																	<!-- 주소 입력(지도에서 집 위치를 선택해 주세요)</br> -->
																	주소<input type="text" id="userAddress" name="customerAddress" readonly="readonly" value="" >
																</p><br/>
																<!--  -->
																<p>		
																<!-- 위도 --> <input type="hidden" id="curstomerLAT" name="memberLAT" value="" >
																<!-- 경도 --> <input type="hidden" id="customerLNG" name="memberLNG" value="" >									
																	<input id="agreeBtn_cu" type="button" value="다음">
																</p>
															</fieldset>
														</form>
													</div>
													
												</div>
											</div>																						
										</div>
									</div>
									
									
									<!-- 상인 -->
									<div class="wpb_content_element span9 column_container">
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">

													<div class="wpb_wrapper" id="join_seller"
														style="display: none">
														<form id="join_seller_form" method="post" action="join/seller" enctype="multipart/form-data">
															<h3>회원가입... 판매자</h3>
															<!-- TBL_MEMBER -->
															<br/>
<!-- 															<p>상세정보입력..</p> -->
															<br/>
															<p>
																아이디<br /> <input id="member_ID" type="text" name="memberId" />
															</p><br />
															<p>
																비밀번호<br /> <input id="member_PW" type="password" name="memberPw" />
															</p><br />
															<p>
																비밀번호 확인<br /> <input id="Sel_Member_PW_chk" type="password" />
															</p><br />
															<p>
																	이름을 입력해주세요</br>
																	<input type="text" id="member_NAME" name="memberName"></p><br/>															
															
															<!-- SELECT ... TBL_MARKET -->
															<p>
																시장선택 (필수 입력)</br> 																
																<select id="m_CODE" name="mCode">
																	<option>필수 선택 입니다</option>
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
															    </select>															    
															 <br/>
															    <select id="mar_ID" name="marId"></select>															
															</p><br />
															<br />
															
															<!-- TBL_SELLER -->
															<p>
																상점명<br /> <input id="sel_Store" type="text" name="selStore" />
															</p><br />
															<p>
																업종번호<br />
																 <select id="sel_TYPE" name="selType">
																  	<option value=1>야채/채소</option>
																 	<option value=2>수산/건어</option>
																 	<option value=3>식료/반찬</option>
																 	<option value=4>정육/족발</option>
																 	<option value=5>닭/치킨</option>
																 	<option value=6>과일/견과</option>
																 	<option value=7>떡집/빵집</option>
																 	<option value=8>스낵/음식</option>
																 	<option value=9>의류/패션</option>
																 	<option value=10>이불/신발</option>
																 	<option value=11>생활/편의</option>
																 	<option value=12>미용/건강</option>
															 
																 </select>
															</p><br />
															<p>
																상세주소<br /> <input id="sel_Address" type="text"	name="selAddress" readonly="readonly"/>
															</p><br />
															<p>
																상점번호<br /> <input id="sel_Store_NO" type="text" name="selStoreNo" />
															</p><br />
															<p>
																연락처<br /> <input  type="text" name="memberTel" />
															</p><br />
															<p>
																상점소개(필수입력은 아님미다)</br> <input id="sel_INFO" type="textArea" name="selInfo" value=" "/>
															</p><br />
															<!-- TBL_SELLER_IMG -->
															<p>
																이미지</br> <input id="sel_Img" type="file" name="selImg" />
															</p><br />	
																														
															<!-- button!!! -->
															<p>
																<input type="hidden" id="mar_IDX" name="marIdx">																															
																<input type="hidden" id="guname_MARID" name="guNameMarId">
												<!-- 위도 --> <input type="hidden" id="selLAT" name="memberLAT" value="" >
												<!-- 경도 --> <input type="hidden" id="selLNG" name="memberLNG" value="" >
																<input id="agreeBtn_se" type="button" value="다음">																
															</p>
															<br />
														</form>														
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="wpb_content_element span9 column_container" >
										<div class="wpb_wrapper">
											<div class="row-fluid">
												<div class="wpb_content_element span12 wpb_text_column">
													<div class="wpb_wrapper" id="join03" style="display:none">
														<h3>회원가입...</h3>
														<p>
															가입완료
														</p>
														<p>
															<h1>가입을 축하드립니다!!!</h1></br>															
														</p>
														<p>																														
															<input id="agreeBtn03"  type="button" value="메인페이지로">															
														</p>
													</div>
												</div>
											</div>																						
										</div>
									</div>
									
								</div>	
								
							<!-- footer in body	-->
							<div class="wpb_separator wpb_content_element "></div>								
							
						</div>
						
						<footer></footer>

					</article>
				</div>
				<!-- end .wpb_content_wrapper -->
			</div><!-- /#main -->
			
			<div class="footer-h3">
			
			<!-- naver map -->	<!-- 나중에 지도 없애기 버튼을 위한 디스플레이 속성 -->
			<div id="map" style="border:1px solid #000; display:none;" align="center"></div>
				<form name="selectLocation" >
					<input name="latInput" type="hidden" id="latInput" value="" />
					<input name="lngInput" type="hidden" id="lngInput" value="" />
				</form>		
			
		</div><!-- /#content -->
		</div><!-- /#wrap -->
		
		
		
		<script type="text/javascript">
						
			// 구 선택 이벤트 제어
			$('#m_CODE').on('change',function(){				
				$.post('join/market',$(this)).done(function(data){					
					marketOpt(data);		
				});
			});
			
			function marketOpt(data){				
				var inhtml = "<option>필수 선택 입니다</option>";				
				for(var i=0;i<data.length;i++){
					inhtml += '<option id="opt_'+ i +'" name="'+data[i].guNameMarId+'" value="'+data[i].marIdx+'">'+data[i].marId+'</option>';  //guNameMarId
					$('#mar_ID').html(inhtml);
				};								
			};
			
			// 시장 선택 이벤트 제어
			$('#mar_ID').on('change',function(){
				
				var $mar_ID = $(this);				
				var optVal = $mar_ID.val();
				$('#mar_IDX').val(optVal); // = $('#mar_IDX').attr('value',optVal);				
				
				//select.options[select.selectedIndex].text;
				//[document.getElementByName("selBox").selelctedIndex].text				
				//console.log($mar_ID.context.options); //2
				//console.log($mar_ID.context.options.selectedIndex); //3				
				
				var selIdx = $mar_ID.context.options.selectedIndex;
				var marid = $('#opt_'+(selIdx-1)).attr('name');				
				$('#guname_MARID').val(marid);
			});
			
			// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
			$('#menu-item-3').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
			
		</script>						

		<script src="/cpr/resources/js/serialize.js" ></script>
		<script src="/cpr/resources/js/join.js"></script>
		<script type='text/javascript' src="/cpr/resources/js/nextJoin.js"></script>

</body>
</html>