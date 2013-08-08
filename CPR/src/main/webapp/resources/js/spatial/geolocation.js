/**
 * HTML5 GEOLOCATION
 * and
 * load function showMap()
 */

navigator.geolocation.getCurrentPosition(
    successCallback,
    errorCallback_highAccuracy,
    {maximumAge:600000, timeout:2000, enableHighAccuracy: true}

); 

function errorCallback_highAccuracy(position) {
    if (error.code == error.TIMEOUT)
    {
        // Attempt to get GPS loc timed out after 5 seconds, 
        // try low accuracy location
        $('body').append("attempting to get low accuracy location");
        navigator.geolocation.getCurrentPosition(
               successCallback, 
               errorCallback_lowAccuracy,
               {maximumAge:600000, timeout:10000, enableHighAccuracy: false});
        return;
    }
    
    var msg = "<p>Can't get your location (high accuracy attempt). Error = ";
    if (error.code == 1)
        msg += "PERMISSION_DENIED";
    else if (error.code == 2)
        msg += "POSITION_UNAVAILABLE";
    msg += ", msg = "+error.message;
    
//    $('body').append(msg);
    console.log(msg);
}

function errorCallback_lowAccuracy(position) {
    var msg = "<p>Can't get your location (low accuracy attempt). Error = ";
    if (error.code == 1)
        msg += "PERMISSION_DENIED";
    else if (error.code == 2)
        msg += "POSITION_UNAVAILABLE";
    else if (error.code == 3)
        msg += "TIMEOUT";
    msg += ", msg = "+error.message;
    
//  $('body').append(msg);
    console.log(msg);
   
// 실패했을 때 서울시청 위치를 지도 중앙으로
   showMap(37.5675451, 126.9773356);
 }

function successCallback(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
//     $('body').append("<p>Your location is: " + latitude + "," + longitude+" </p><p>Accuracy="+position.coords.accuracy+"m"); 
// 	    $('#traceLat').val(latitude);
// 	    $('#traceLng').val(longitude);

    // 		현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
	$('#traceLat').val(latitude);
	$('#traceLng').val(longitude);
    
//    showMap(latitude, longitude);
    console.log("hey?");
    console.log(latitude);
    console.log(longitude);
    
    
    showMap(latitude, longitude);
    
}