/**
 * HTML5 GEOLOCATION
 * and
 * load function showMap()
 */

navigator.geolocation.getCurrentPosition(
    successCallback,
    errorCallback_highAccuracy,
    {maximumAge:600000, timeout:5000, enableHighAccuracy: true}

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
    
    $('body').append(msg);
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
    
   $('body').append(msg);
   
// 실패했을 때 서울시청 위치를 지도 중앙으로
   showMap(37.5675451, 126.9773356);
 }

function successCallback(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
//     $('body').append("<p>Your location is: " + latitude + "," + longitude+" </p><p>Accuracy="+position.coords.accuracy+"m"); 

    // 		현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
//	$('#traceLat').val(37.4815787);
//	$('#traceLng').val(126.9284316);

    $('#traceLat').val(latitude);
 	$('#traceLng').val(longitude);
    
    showMap(latitude, longitude);
}


///////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  Map Initial Setting
 */

var oMap;
var startMarker;
var zoomLevel;
var circle;
var radius;

function mapInitialSetting(zoomLevel){
	
	var browserWidth = document.body.clientWidth;
	var browserHeight = document.body.clientHeight;
	
	console.log('browser size : ' + browserWidth + ' * ' + browserHeight);
	
	// 자기중심 반경 계산해 찍을 때 - 12
	// 서울시 - 8~9
	// 시장 내부 전경을 찍어줄땐??
	var defaultLevel = zoomLevel;
	oMap = new nhn.api.map.Map(document.getElementById('map'), { 
					point : currentPoint,
					zoom : defaultLevel,
					enableWheelZoom : true,
					enableDragPan : true,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					minMaxLevel : [ 1, 14 ],
					size : new nhn.api.map.Size(480, 400)		
	});
	
	// 줌 컨트롤 버튼
	var mapZoom = new nhn.api.map.ZoomControl();
	oMap.addControl(mapZoom);
	mapZoom.setPosition({
		top : 60,
		right : 10
	});

	// 일반, 위성 버튼
	var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
	oMap.addControl(oMapTypeBtn);
	oMapTypeBtn.setPosition({
		top : 10,
		right : 80
	});
	
	// 주제별 지도 버튼
	var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
	oThemeMapBtn.setPosition({
		top : 10,
		right : 10
	});
	oMap.addControl(oThemeMapBtn);

}	// end mapInitialSetting


/////////////////////////////////////////////////////////////////////////

function showMap(latitude, longitude){
		
//	  	currentPoint = new nhn.api.map.LatLng(latitude, longitude);
		currentPoint = new nhn.api.map.LatLng(37.4823, 126.9271); // 테스트를 위해 현재 위치 신원시장 입구로 강제설정
		
		// 맵 초기 환경 설정 (줌 레벨 10)
		mapInitialSetting(9);
		
		// 클릭한 시장의 상세 상점 지도 로드
		oMap.attach('click', function(oCustomEvent) {		
			oMap.clearOverlay();
			
			var oPoint = oCustomEvent.point;
			console.log(oPoint.y); // latitude
			console.log(oPoint.x); // longitude

			var oMarker = new nhn.api.map.Marker(oIcon, {title : '마커 : '+ oPoint.y + " " + oPoint.x	});
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);

			/////////////////////////////////////////////////////////////////////////////////////////////
			$("#latInput").val(oPoint.y);
			$("#lngInput").val(oPoint.x);

			$('#customerLAT').attr('value', oPoint.y);
			$('#customerLNG').attr('value', oPoint.x);
		
			$('#selLAT').attr('value', oPoint.y);
			$('#selLNG').attr('value', oPoint.x);
			
			var arr = {
				"LNG" : oPoint.x,
				"LAT" : oPoint.y
			};

			$.post('/cpr/member/getAddress', arr).done(function(data) {
						/*console.log(data);*/
						$("#userAddress").val(data);
						$("#sel_Address").val(data);
			});			
		});	// end click event
		
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
//		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 
		var oIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/person.png', oSize, oOffset);
		// 현재 위치 마커 찍기
		var oMarker1 = new nhn.api.map.Marker(oIcon, {title : '현재 위치'}); //마커 생성 
		
		oMarker1.setPoint(currentPoint); //마커 표시할 좌표 선택
		oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
		var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
		oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
		oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기 				
		
} // end showMap 



//map 버튼 제어
$('#userAddress').on('click', function(){
	$('#map').attr("style", "display:inline-block");	
});

$('#sel_Address').on('click', function(){
	$('#map').attr("style", "display:inline-block");
});
