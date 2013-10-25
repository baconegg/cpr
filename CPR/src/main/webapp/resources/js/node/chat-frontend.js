function webSocket() {
    "use strict";
    
    //메세지가 찍힐곳...
//    var content = $('#cbMsg');    

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    //메세지 붙이는 부분...
    function addMessage(message) {    	
    	var msg = JSON.parse(message.data.text);   
    	
    	var sel = $('#sel').val();
    	
    	console.log('msg : ' + msg);
    	console.log('selIdx : ' + sel);
    	console.log('msg.selIdx : ' + msg.selIdx);
    	    	
    	//세션값(selIdx)은 헤더부분에서 변수 설정해줌...	
    	if(sel == msg.selIdx){
    		//content.html('<p>' +  message + '</p>');	    		    		
    		var memberIdx = msg.memberIdx;
			var productIdx = msg.productIdx;
			var customerIdx = msg.customerIdx;
			var reserveQty = msg.reserveQty;
			var reserveReceiveTime = msg.reserveReceiveTime;
			var reserveMemo = msg.reserveMemo;
			var memberName = msg.memberName;
			var memberId = msg.memberId;
			//var selIdx = msg.selIdx;
			var memberLev = msg.memberLev;							
			var productName = msg.productName;
			var productInfo = msg.productInfo;			
			var productPrice = msg.productPrice;
			
			var totalPrice = productPrice*reserveQty;
			
    		var reserveData = '주문자 : ' + memberName + '\n'; 
    			  reserveData		+= '주문상품 : ' +  productName + '\n'; 
    			  reserveData		+= '주문수량 : ' + reserveQty + '\n'; 
    			  reserveData		+= '수취시간 : ' + reserveReceiveTime + '\n';
    			  reserveData		+= '요청사항 : ' + reserveMemo + '\n';  
    			  reserveData		+= '총 가격 : ' + totalPrice + '\n';
    			  reserveData		+= '상세내역 : ' + productInfo + '\n';
    			      			  
    			  alert(reserveData);
    			  
    	}
   }	 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  
	    window.WebSocket = window.WebSocket || window.MozWebSocket;
	
	    if (!window.WebSocket) {
	        //content.html($('<p>', { text: 'Sorry, but your browser doesn\'t ' + 'support WebSockets.'} ));
	        //input.hide();
	        //$('span').hide();
	        return;
	    }
	    	
	    // 커넥션을 열때 요쪽으로 여십셔... 실제 서비스할땐 12. 어쩌고 거기로 해주면 될꺼 가트다...
	    // open connection
//	    var connection = new WebSocket('ws://192.168.0.24:1337');
	    var connection = new WebSocket('ws://localhost:1337');
	
	//    connection.onopen = function () {
	//    };
	
	    connection.onerror = function (error) {
	        //content.html($('<p>', { text: 'Sorry, but there\'s some problem with your ' + 'connection or the server is down.' } ));
	    };
	    
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	    //메세지 받았을떄??? 자기한테도 찍을때???  view페이지에선 필요없을듯?? 상인이 확인할때 메세지를 받아야 하므로 그때 필요할듯..
	    connection.onmessage = function (message) {
	    	var json;
	    		try {
		            json = JSON.parse(message.data);
		        } catch (e) {
		            console.log('This doesn\'t look like a valid JSON: ' + message.data);
		            return;
		        }
	
		        if (json.type === 'message') { // it's a single message
//		        	var message = JSON.parse(json.data.text);
		        	if(json.chunk == 1){
		        		addMessage(json);
		        	}
		        } else {
		            console.log('Hmm..., I\'ve never seen JSON like this: ' + json);
		        }
	    };       
	    
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	    //3초 정도동안 서버와 소켓 통신이 되지 않으면 에러메세지를 뱉는다.. 페이지에... 
	//    setInterval(function() {
	//        if (connection.readyState !== 1) {
	//            //status.text('Error');
	//            //input.attr('disabled', 'disabled').val('Unable to comminucate ' + 'with the WebSocket server.');
	//        }
	//    }, 3000);
  
};


if(selIdx == ""){
//	console.log(selIdx);	
}else{
	webSocket();	
}