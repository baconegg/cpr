window.onload = function lh(){
		var href = location.href;		
		href = href.split("/");		
		//href = href[3].substr(0,href[3].length);	
		var path = "";
		for (var i=3 ; i<href.length ; i++){			
			path += "/"+href[i];
		}		
//		console.log("loc :");
//		console.log(path);
		$('#hrefPath').val(path);
//		alert(path);
		
		var lhPath = $('#lhPath').val();
//		console.log('lhPath : ' + lhPath);
		$.post(lhPath,{"path":path});
		
};