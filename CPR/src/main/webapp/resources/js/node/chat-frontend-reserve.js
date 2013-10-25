var btnReg = $('#btnRegist');
//open connection
//var connection = new WebSocket('ws://192.168.0.24:1337');
var connection = new WebSocket('ws://localhost:1337');
function htmlEntities(str) {
	return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g,'&gt;').replace(/"/g, '&quot;');
}

var lev = $('input[name=memberLev]').attr('value');
console.log('memberLev : ' + lev);

// 예약 버튼을 눌렀을때!!!
btnReg.click(function(){    	
	if(lev == null || htmlEntities(lev) == ''){
		alert('로그인 해 주세요');	
	}else if(lev !=null){
	 	// 예약 데이터	
//  	var jdata = JSON.parse(JSON.stringify($('#reserve').serializeObject()));
	  	var jdata = JSON.stringify($('#reserve').serializeObject());    	
		//console.log(jdata);
		connection.send(jdata);
	
	}    	
});

connection.onmessage = function (message) {
	var json;
	try {
        json = JSON.parse(message.data);
        console.log("onmessage json : " + json);
    } catch (e) {
        console.log('This doesn\'t look like a valid JSON: ', message.data);
        return;
    }

	 if (json.type === 'message') {
		 var msg = JSON.parse(json.data.text);
		 
		 //if문 걸것...예약한 사람 본인만 넘어가도록 해야됨...		 
		console.log('msg : ' + msg);
		console.log('msg chunk : ' + msg.chunk);
		if(msg.chunk == 1){
			var customerIdx = $('#customerIdx').val();
			if(customerIdx == msg.customerIdx){
				
				// -- gcm
//				var fdata = new FormData($("#reserve")[0]);
				var data = JSON.parse(jdata);
				$.post('/cpr/gcm/alert', data).done(function(data){
//					alert(data);
					if(data == "실패"){
						alert("예약실패");
					}else{
						alert("예약되셨습니다.");
						var selIdx = $('input[name=selIdx]').val();		
						location.href= '/cpr/product/list/' + selIdx;
					}
				});
				
				
//					alert("예약되셨습니다.");
//					var selIdx = $('input[name=selIdx]').val();		
//					location.href= '/cpr/product/list/' + selIdx;					
			}
		
		}		 
    } else {
        console.log('Hmm..., I\'ve never seen JSON like this: ' + json);
//        var msg2 = JSON.parse(json.data.text);
//        console.log('Hmm..., msg2: ' + msg2);
    }
};    

