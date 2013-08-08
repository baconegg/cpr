$(function () {
    "use strict";

    // for better performance - to avoid searching in DOM   --  버튼 아이디(btnReg)를 예약하기 아이디로 체인지 해줄것...
    var btnReg = $('#btnReg');

    // if user is running mozilla then use it's built-in WebSocket
    window.WebSocket = window.WebSocket || window.MozWebSocket;

    // if browser doesn't support WebSocket, just show some notification and exit -- 작동하지 않을때???
    if (!window.WebSocket) {
        content.html($('<p>', { text: 'Sorry, but your browser doesn\'t ' + 'support WebSockets.'} ));
        input.hide();
        $('span').hide();
        return;
    }

    // open connection
    var connection = new WebSocket('ws://localhost:1337');

//    connection.onopen = function () {
//    	
//    };

    connection.onerror = function (error) {
        // just in there were some problems with conenction...
        content.html($('<p>', { text: 'Sorry, but there\'s some problem with your '
                                    + 'connection or the server is down.' } ));
    };

    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //메세지 받았을떄??? 자기한테도 찍을때???  view페이지에선 필요없을듯?? 상인이 확인할때 메세지를 받아야 하므로 그때 필요할듯..
    // most important part - incoming messages
   
    connection.onmessage = function (message) {
	        // try to parse JSON message. Because we know that the server always returns
	        // JSON this should work without any problem but we should make sure that
	        // the massage is not chunked or otherwise damaged.
	        try {
	            var json = JSON.parse(message.data);
	        } catch (e) {
	            console.log('This doesn\'t look like a valid JSON: ', message.data);
	            return;
	        }

	        // NOTE: if you're not sure about the JSON structure
	        // check the server source code above
        	if (json.type === 'history') { // entire message history
	            // insert every single message to the chat window
	            for (var i=0; i < json.data.length; i++) {
	                addMessage(json.data[i].text);
	            }
	        } else if (json.type === 'message') { // it's a single message
	            addMessage(json.data.text);
	        } else {
	            console.log('Hmm..., I\'ve never seen JSON like this: ', json);
	        }
    	};       
    

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // 예약 버튼을 눌렀을때!!!
    btnReg.click(function(){
    	// 예약 데이터	
//    	var jdata = JSON.parse(JSON.stringify($('#reserve').serializeObject()));
    	var jdata = JSON.stringify($('#reserve').serializeObject());    	
    	console.log(jdata);
    	connection.send(jdata);
    });

    //3초 정도동안 서버와 소켓 통신이 되지 않으면 에러메세지를 뱉는다.. 페이지에... (확실함??)
    setInterval(function() {
        if (connection.readyState !== 1) {
            //status.text('Error');
            //input.attr('disabled', 'disabled').val('Unable to comminucate ' + 'with the WebSocket server.');
        }
    }, 3000);

    //메세지 붙이는 부분...
//    function addMessage(message) {
//        content.prepend('<p>' +  message + '</p>');
//    }
});