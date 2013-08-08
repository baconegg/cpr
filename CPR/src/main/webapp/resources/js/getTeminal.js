/**
 * @author BIT
 */
//단말 기종에 따른 알림
var ua = navigator.userAgent;
var $joinImage = $('#joinImage');

var cliWidth = document.body.clientWidth;
var cliHeight = document.body.clientHeight;

if(cliWidth < 500){
	/*alert("width = 500");*/
	$joinImage.attr("style","display:none");
}else if(ua.indexOf("Chrome") > 0) {
	$joinImage.css("display", "");	
}
else if(ua.indexOf("Mozilla") > 0) {
	$joinImage.css("display", "");	
}
else if(ua.indexOf("Safari") > 0) {
	$joinImage.css("display", "");	
}
//iPad ?
else if(ua.indexOf("iPad") > 0) {
	//alert("iPad �낅땲��");
	$joinImage.css("display", "");
}
//iPhone 3.x?
else if(ua.indexOf("iPhone OS 3") > 0) {
	//alert("iPhone 3.x �낅땲��");
	$joinImage.css("display", "none");
}
//iPhone 4.x?
else if(ua.indexOf("iPhone OS 4") > 0) {
	//alert("iPhone 4.x �낅땲��");
	$joinImage.css("display", "none");
}
//iPhone 5.x?
else if(ua.indexOf("iPhone OS 5") > 0) {
	//alert("iPhone 4.x �낅땲��");
	$joinImage.css("display", "none");
}
//Android 1.6 ?
else if(ua.indexOf("Android 1.6") > 0) {
	//alert("Android 1.6  �낅땲��");
	$joinImage.css("display", "none");
}
//Android 2.1 ?
else if(ua.indexOf("Android 2.1") > 0) {
	//alert("Android 2.1  �낅땲��");
	$joinImage.css("display", "none");
}
//Android 2.2 ?
else if(ua.indexOf("Android 2.2") > 0) {
	//alert("Android 2.2  �낅땲��");
	$joinImage.css("display", "none");
}
//Android 2.3 ?
else if(ua.indexOf("Android 2.3") > 0) {
	//alert("Android 2.3  �낅땲��");
	$joinImage.css("display", "none");
}
//Android 2.2 ?
else {
	//alert("踰꾩쟾���뺤씤�섏� �딆뒿�덈떎.");
	$joinImage.css("display", "none");
}