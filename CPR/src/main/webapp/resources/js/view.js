

//"-"버튼 클릭시
$("#btnMinus").on('click', function(){
		
	var reserveQty = $("#reserveQty").val();
	
	if(reserveQty == 1){
		
		autoCalc();
		return;
		
	}else{
	
		var num_reserveQty = Number(reserveQty);
	
		num_reserveQty = num_reserveQty - 1;
	
		$("#reserveQty").val(num_reserveQty);
	}
	
	autoCalc();
	
});


//"+"버튼 클릭시
$("#btnPlus").on('click', function(){
	
	var reserveQty = $("#reserveQty").val();
	if(reserveQty == 20){
		return;
	}else{
	var num_reserveQty = Number(reserveQty);
	num_reserveQty++;
	$("#reserveQty").val(num_reserveQty);
	}
	
	autoCalc();
		
});


// 수량태그 클릭시...
$("#reserveQty").on('click', function(){
		
	var qty = $("#reserveQty").val();
	var price = $("#productPrice").val();
		
	var totalPrice = qty * price;
		
	innerHTML = "<hr><h1>가격&nbsp;&nbsp; : &nbsp;&nbsp;"+totalPrice+"</h1><hr>";
	
	$("#totalPrice").replace(innerHTML);
	
});


// 총 결제금액 계산 함수
function autoCalc(){	
		
		var qty = $("#reserveQty").val();
		var price = $("#productPrice").val();
			
		var totalPrice = qty * price;
			
		innerHTML = "<hr><h1>가격&nbsp;&nbsp; : &nbsp;&nbsp;"+totalPrice+"</h1><hr>";
		
		$("#totalPrice").html(innerHTML);	
	
};


// "예약하기" 버튼 클릭시...
$("#btnRegist").on('click', function(){
	if('${sessionScope.memberLev}'!=null){
		var formData = $("#reserve");	
		var json_formData = JSON.parse(JSON.stringify(formData.serializeObject()));	
		$.post('/cpr/reserve/register', json_formData).done(function(data){
			// 0: 실패 1: 성공
			if(data == 0){
				alert('알수 없는 오류 입니다');
			}else if(data == 1){
//				var selIdx = $('#customerIdx').val();		
//				var selIdx = $('#selIdx').val();		
//				alert("예약이 완료되었습니다.");		
//				location.href="/cpr/product/list/" + selIdx;
			}else {			
				alert('로그인해 주세요');			
			}		
		});//end $.post...
	}else {
		alert('로그인 해 주세요');
	}
});


//달력 설정
$('#slider_example_4').datetimepicker({
	dateFormat: 'yy-mm-dd',
	controlType: 'select',
	timeFormat: 'TT HH:mm'
});


// 수정 버튼 클릭시...
$("#btnToModify").on('click', function(){

	var productIdx = $('#productIdx').val();

	location.href = "/cpr/product/modify?productIdx=" + productIdx;

});


// 삭제 버튼 클릭시...
$("#btnDelete").on('click', function(){	
	
	var productIdx = $('#productIdx').val();
//	console.log("productIdx : " + productIdx);
//	console.log("productIdx : " + typeof(productIdx));
	
	if(confirm("정말 삭제 하시겠습니까?")){
		$.post('/cpr/product/remove', {'productIdx' : productIdx}).done(function(){		
//			console.log("ajax갔다옴.");		
			alert("삭제 되었습니다.");
			location.href="/cpr/product/list/" + selIdx;
		});		
	} // end if~
	
});




