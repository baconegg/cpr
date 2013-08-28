<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js gt-ie8" lang="en-US" prefix="og: http://ogp.me/ns#"> <![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=1.0" />

	<meta http-equiv="Page-Enter" content="revealTrans(Duration=2.0,Transition=10)">
	<meta http-equiv="Page-Exit" content="revealTrans(Duration=2.0,Transition=10)">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script type='text/javascript' src="/cpr/resources/js/geoCode.js"></script>	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- naver map -->
	<!-- port : 8089 -->
<!-- 	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=2d8c0da7fa2d27f43da0e50713877942"></script> -->
	<!-- port : 8080  -->
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b618902412b59c49a0b58308b7109296"></script>
		
	<title>Map</title>	

	<!--[if lt IE 7]><p class="chromeframe">Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
</head>

<body class="single single-portfolio postid-83 chrome wpb-js-composer js-comp-ver-3.3.2">

<!-- naver map -->	<!-- 나중에 지도 없애기 버튼을 위한 디스플레이 속성 -->
<div id="map" style="border:1px solid #000;"></div>
<input type="button" id="shop" value="shop" />

<input type="button" value="move" id="trace" />
<input type="hidden" value="" id="traceLat" />
<input type="hidden" value="" id="traceLng" />

<form name="selectLocation" >
	<input name="latInput" type="hidden" id="latInput" value="" />
	<input name="lngInput" type="hidden" id="lngInput" value="" />		
	<!-- <input type="submit" value="sendAddress" /> -->
</form>

<script>
	var oMap;
	var currentPoint;
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
	    $('body').append("<p>Your location is: " + latitude + "," + longitude+" </p><p>Accuracy="+position.coords.accuracy+"m");
	    
// 	    $('#traceLat').val(latitude);
// 	    $('#traceLng').val(longitude);
// 		현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
		$('#traceLat').val(37.4815787);
		$('#traceLng').val(126.9284316);
	    
	    showMap(latitude, longitude);
	}


	
	function showMap(latitude, longitude){
		
		var browserWidth = document.body.clientWidth;
		var browserHeight = document.body.clientHeight;
		
		// var currentPoint = new nhn.api.map.LatLng(latitude, longitude);
		// 현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
		currentPoint = new nhn.api.map.LatLng(37.4815787, 126.9284316);
		
		//자기중심 반경 계산해 찍을 때 - 12
		//서울시 - 8~9
		//시장 내부 전경을 찍어줄땐??
				
		var defaultLevel = 12;
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
						size : new nhn.api.map.Size(browserWidth - 30, browserHeight - 120)		
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

		// 아이콘 설정
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

		// ------------------- 마커 찍기 --------------------
		// 초기(현재 위치) 마커 찍기
		var startMarker = new nhn.api.map.Marker(oIcon, {title : '현재 위치'});
		startMarker.setPoint(currentPoint); 
		oMap.addOverlay(startMarker);
		
		var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
		oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
		oLabel.setVisible(true, startMarker); // 마커 라벨 보이기 	

		// 새로운 마커 찍기
		oMap.attach('click', function(oCustomEvent) {
			oMap.clearOverlay();	// 기존에 있던 마커 다 지우기
			
			var oPoint = oCustomEvent.point;
			console.log(oPoint.y);	// latitude
			console.log(oPoint.x);	// longitude
			
			var oNewMarker = new nhn.api.map.Marker(oIcon, { title : '현재위치 : ' + oPoint.y + " " + oPoint.x });
			oNewMarker.setPoint(oPoint);
			oMap.addOverlay(oNewMarker);

			$("#latInput").val(oPoint.y);
			$("#lngInput").val(oPoint.x);
		});
	
		// ------------------- 원 그리기 --------------------
		var circle = new nhn.api.map.Circle({
						strokeColor : "pink",
						strokeOpacity : 0.2,
						strokeWidth : 5,
						fillColor : "pink",
						fillOpacity : 0.2
		});
		
		var radius = 500; 							// - radius의 단위는 meter
		circle.setCenterPoint(currentPoint); 		// - circle 의 중심점을 지정.
		circle.setRadius(radius); 					// - circle 의 반지름을 지정 (단위 meter).
// 		circle.setStyle("strokeOpacity", 0.2); 		// - setStyle 함수로 선의 투명도를 다시 지정.
		
		oMap.addOverlay(circle);			
		
		// 주소 -> 좌표로 변환 (geoCode 함수 안에 주소 넣으면 됨)
		geoCode('서울 용산구 한강로2가 15-19');
	}
	
	// --------------------- 이동 경로 추적 -----------------------
	
	function showTrace(){		
		
		latitude = $('#traceLat').val() - Math.random() * (-0.0002);
		longitude = $('#traceLng').val() - Math.random() * 0.0002;
		console.log('trace : ' + latitude + ', ' + longitude);
		console.log('----------------------------');
				
		var newLocation = new nhn.api.map.LatLng(latitude, longitude);
		
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var traceIcon = new nhn.api.map.Icon('../resources/images/icon/person.png', oSize, oOffset);
		
		var traceMarker = new nhn.api.map.Marker(traceIcon);		
		traceMarker.setPoint(newLocation);
		
		console.log('traceMarker : ' + traceMarker);
		oMap.addOverlay(traceMarker);

	    $('#traceLat').val(latitude);
	    $('#traceLng').val(longitude);
	}
	
	$('#trace').on('click', showTrace);
</script>	
</body>
</html>