// 로그인시... 에이쟉스 처리가 취소 됫으므로 ... ㅌ
$('#loginBtn').on('click',function(){
	console.log('로그인 버튼을 눌렀습니다...');
	//var jsonObj = JSON.parse(JSON.stringify($('#viewer').serializeObject()));
	var log = JSON.parse(JSON.stringify($('#loginform').serializeObject()));
	$.post('/cpr/member/login',log).done(function(data){				
		console.log(data);		
		// 아까 있던 세션값 받아와서 찍는 중이므로 의미가 없슴미다...
		//var memIdx = '${sessionScope.memberIdx }';		
		changeIn(data);
	});
});

function changeIn(data){
	console.log(data);
	$('.logHide').attr('style','display: none');
	//벨류 부분은 값을 받아와서 넣어쥬쟈...	
	$('.logType').attr('readonly','readonly');
	$('.logType').attr('style','background-color: transparent;');
	$('.logShow').removeAttr('style');	
	$('#getuserId').html(data.memberName+"님 환영합니다 :)");
}
function changeOut(){
	$('.logShow').attr('style','display: none');	
	$('.logType').val('');
	$('.logType').removeAttr('readonly');
	$('.logType').removeAttr('style');
	$('.logHide').removeAttr('style');
}

// 로그아웃시...
$('#logoutBtn').on('click',function(){
	$.post('/cpr/member/logout').done(function(){		
		changeOut();
	});
});