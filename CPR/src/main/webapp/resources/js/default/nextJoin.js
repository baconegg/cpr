/**
 * @author BIT
 */
  $('#btn_customer').on('click', function(){
  	
 	var $join01 = $('#join01');
 	var $join02 = $('#join_customer');
 
 	//이미지 제어용.. 	
 	var $st01 = $('#st01');
 	var $st02 = $('#st02');
 			 	
 	$join01.css("display", "none");
 	$st01.attr("class","");
 	$join02.css("display", "");
 	$st02.attr("class", "on");	  
   });		
  
  $('#btn_seller').on('click', function(){
	  	
	 	var $join01 = $('#join01');
	 	var $join02 = $('#join_seller');
	 
	 	//이미지 제어용.. 	
	 	var $st01 = $('#st01');
	 	var $st02 = $('#st02');
	 			 	
	 	$join01.css("display", "none");
	 	$st01.attr("class","");
	 	$join02.css("display", "");
	 	$st02.attr("class", "on");	  
	   });		
  
  
  $('#agreeBtn_cu').on('click', function(){
	  	
	 	var $join02 = $('#join_customer');
	 	var $join03 = $('#join03');
	 	var $st02 = $('#st02');
	 	var $st03 = $('#st03');
	 			 	
	 	$join02.css("display", "none");
	 	$st02.attr("class","");
	 	$join03.css("display", "");
	 	$st03.attr("class", "on");	  
	});		
  
  $('#agreeBtn_se').on('click', function(){
	  	
	 	var $join02 = $('#join_seller');
	 	var $join03 = $('#join03');
	 	var $st02 = $('#st02');
	 	var $st03 = $('#st03');
	 			 	
	 	$join02.css("display", "none");
	 	$st02.attr("class","");
	 	$join03.css("display", "");
	 	$st03.attr("class", "on");	  
	});
 
  $('#agreeBtn03').on('click', function(){
	  	
	 	var $join03 = $('#join03');
	 	var $join01 = $('#join01');
	 	var $st03 = $('#st03');
	 	var $st01 = $('#st01');
	 			 	
	 	$join03.css("display", "none");
	 	$st03.attr("class","");
	 	$join01.css("display", "");
	 	$st01.attr("class", "on");	  
	});		
		 






