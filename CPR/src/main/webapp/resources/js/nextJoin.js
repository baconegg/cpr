



// step #1 약관동의

$('#chkBox').on('click', function(){
	
	if($('#chkBox').is(':checked')){	
//		console.log('checked');
		$('#btn_customer').attr('style','display:block');
		$('#btn_customer').attr('style','max-width: 150px');
		$('#btn_seller').attr('style','display:block');
		$('#btn_seller').attr('style','max-width: 150px');
		
	}else{
//		console.log('!checked');
		$('#btn_customer').attr('style','display:none');
		$('#btn_seller').attr('style','display:none');
	};

});

	



// 소비자 페이지로
$('#btn_customer').on('click', function() {

	var $join01 = $('#join01');
	var $join02 = $('#join_customer');

	// 이미지 제어용..
	var $st01 = $('#st01');
	var $st02 = $('#st02');

	$join01.css("display", "none");
	$st01.attr("class", "");
	$join02.css("display", "");
	$st02.attr("class", "on");
});

// 판매자 페이지로
$('#btn_seller').on('click', function() {

	var $join01 = $('#join01');
	var $join02 = $('#join_seller');

	// 이미지 제어용..
	var $st01 = $('#st01');
	var $st02 = $('#st02');

	$join01.css("display", "none");
	$st01.attr("class", "");
	$join02.css("display", "");
	$st02.attr("class", "on");
});

// step #2 상세 기입
// 소비자
$('#agreeBtn_cu').on('click',function() {
			console.log('테스트');
			
			//디스플레이 제인지			
			var $join02 = $('#join_customer');
			var $join03 = $('#join03');
			//이미지 체인지
			var $st02 = $('#st02');
			var $st03 = $('#st03');

			// 비밀번호 1,2 값입니다...
			console.log($('#Member_PW').val());
			console.log($('#Member_PW_chk').val());
			var chk1 = $('#Member_PW').val();
			var chk2 = $('#Member_PW_chk').val();

			// 비밀번호 비교를 합니다 이푸...
			if (chk1.trim() == '') {
				alert("비번 null...");
			} else if (chk2.trim() == '') {
				alert("비번확인 null...");
			} else {
				if (chk1 == chk2) {
					//console.log("오예 같다~!!");
					var jsonObj = JSON.parse(JSON.stringify($('#join_customer_form').serializeObject()));
					
					/*console.log(jsonObj);*/
//					console.log($("#join_customer_form").html());
					// controller로 데이터를 보냅니다...										

					$.post('/cpr/member/join/customer', jsonObj).done(
							function(data) {
								console.log(data);
								console.log(data.length)
								//for(var i = 0; i < data.length; i++){

								var $message_id = $('#messege_id');
								var $message_pw = $('#message_pw');
								var $message_col = $('#message_col');

								/*var temp = $("#Member_ID").html();
								var replace = '<p id="messege_' + i + '">' + data[i].defaultMessage + '</p><br/>' + '<input id="Member_ID" type="text" name="Member_ID" />';
								
								$('<p>' + html[i].defaultMessage + '</p><br/>').insertAfter($("#Member_ID"));
								$("#Member_ID").replaceWith(replace);*/

//								console.log($message_id.val());

								$message_id.attr('value', function() {
									for ( var i = 0; i < data.length; i++) {
//										console.log('error message : ' + data[i].defaultMessage);
										alert('error message : ' + data[i].defaultMessage);
//										if (data[i].defaultMessage == '아이디') {
//											console.log(data[i].defaultMessage);
//											alert(data[i].defaultMessage);
//										}

										return data[i].defaultMessage;
									}
								});

								//}

								if (data.length == 0) {
									//error 에 따라서 얘네를 넘어가고 말게 처리해줘야됨...
									$join02.css("display", "none");
									$st02.attr("class", "");
									$join03.css("display", "");
									$st03.attr("class", "on");
									
									// 지도 닫기를 위한거???
									$('#map').attr('style', 'display:none');
								}
							});// end $.post...
				} else {
					alert("비번과 비번확인 두개 다름");
				}
			}
		});

// step #2 상세 기입
// 판매자
//버튼을 눌렀을 떄_ 예외처리는 나중에...
$('#agreeBtn_se').on('click', function(){		
	//콜백
	function banana(data, state){
		 
		if (data=="error"){
		      alert("에러 발생!!");
		      return false;
		 }else{
		   
			alert(data + "가입 완료!!");
					
			var $join02 = $('#join_seller');
			var $join03 = $('#join03');
			var $st02 = $('#st02');
			var $st03 = $('#st03');
	
			$join02.css("display", "none");
			$st02.attr("class", "");
			$join03.css("display", "");
			$st03.attr("class", "on");
			
			
			// 지도 닫기를 위한거???
			$('#map').attr('style', 'display:none');
		 }
	};	
	$('#join_seller_form').ajaxForm(banana).submit();
	
});

// step #3 가입완료버튼
$('#agreeBtn03').on('click', function() {

	var $join03 = $('#join03');
	var $join01 = $('#join01');
	var $st03 = $('#st03');
	var $st01 = $('#st01');

	$join03.css("display", "none");
	$st03.attr("class", "");
	$join01.css("display", "");
	$st01.attr("class", "on");
	
	location.href = '/cpr/';
	
});
