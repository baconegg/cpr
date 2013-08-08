var btnReg = $('#btnRegist');

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
	 	
		var jdata = JSON.stringify($('#reserve').serializeObject());    
//		var fdata = new FormData($("#reserve")[0]);
		var data = JSON.parse(jdata);
			
		// -- gcm
		$.post('/cpr/gcm/alert', data).done(function(data){
//			alert(data);
			var selIdx = $('input[name=selIdx]').val();		
			location.href= '/cpr/product/list/' + selIdx;
		});

		// 예약 데이터 -- node	
		connection.send(jdata);
	}    	
});

connection.onmessage = function (message) {
    try {
        var json = JSON.parse(message.data);
    } catch (e) {
        console.log('This doesn\'t look like a valid JSON: ', message.data);
        return;
    }

	 if (json.type === 'message') {
		 var msg = JSON.parse(json.data);
		 
		 //if문 걸것...예약한 사람 본인만 넘어가도록 해야됨...		 
		console.log('msg : ' + msg.chunk);
		if(msg.chunk == 1){
			var customerIdx = $('#customerIdx').val();
			if(customerIdx == msg.customerIdx){
				
//					var selIdx = $('input[name=selIdx]').val();		
//					location.href= '/cpr/product/list/' + selIdx;					
			}
		
		}		 
    } else {
        console.log('Hmm..., I\'ve never seen JSON like this: ', json);
    }
};    

