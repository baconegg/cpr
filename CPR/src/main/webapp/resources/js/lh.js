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
		$.post('/cpr/member/sessionSet',{"path":path});
		
		// $("#menu-item-1").addClass("btn btn-primary");  
		// $("#menu-item-2").addClass("btn btn-primary");  
		// $("#menu-item-3").addClass("btn btn-primary");  
		// $("#menu-item-4").addClass("btn btn-primary");  
		// $("#menu-item-5").addClass("btn btn-primary"); 
		// $("#menu-item-6").addClass("btn btn-primary");  
		// $("#menu-item-7").addClass("btn btn-primary");  
		// $("#menu-item-8").addClass("btn btn-primary");  
		// $("#menu-item-9").addClass("btn btn-primary");  
};