<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Naver Geolocation Test</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<!-- port : 8089 -->
<!-- <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=2d8c0da7fa2d27f43da0e50713877942"></script> -->
<!-- port : 8080  -->
<!-- <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b618902412b59c49a0b58308b7109296"></script> -->
<!-- <script src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=0f8a70ead0f54c7ac62838bd8047037c"></script> -->
<script src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b618902412b59c49a0b58308b7109296"></script>

<div id="map" style="border:1px solid #000;"></div>
<form name="selectLocation" method="post" action="joinCustomer">
	<input name="latInput" type="hidden" id="latInput" value="" />
	<input name="lngInput" type="hidden" id="lngInput" value="" />
	<input type="submit" value="sendAddress" />
</form>
<p>Attempting to get location, high accuracy first...</p>
<script>
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
	    
	    // 실패했을 때 서울시청 위치
	    showMap(37.5675451, 126.9773356);
	}

	function successCallback(position) {
	    var latitude = position.coords.latitude;
	    var longitude = position.coords.longitude;
	    $('body').append("<p>Your location is: " + latitude + "," + longitude+" </p><p>Accuracy="+position.coords.accuracy+"m");
	    
	    showMap(latitude, longitude);
	}

// 	if(navigator.geolocation){
// 		navigator.geolocation.getCurrentPosition(
// 			function(position){
// 				var latitude = position.coords.latitude;
// 				var longitude = position.coords.longitude;
// 				LoadMap(latitude, longitude);
// 			},
// 			function(e){
// 				LoadMap(37.5675451, 126.9773356);
// 			},
// 			{enableHighAccuracy: true}
// 		);
// 	}
// 	else{
// 		showMap(37.5675451, 126.9773356);
// 	}
	
	function showMap(latitude, longitude){
		var currentPoint = new nhn.api.map.LatLng(latitude, longitude);
		var defaultLevel = 11;
		var oMap = new nhn.api.map.Map(document.getElementById('map'), { 
						point : currentPoint,
						zoom : defaultLevel,
						enableWheelZoom : true,
						enableDragPan : true,
						enableDblClickZoom : false,
						mapMode : 0,
						activateTrafficMap : false,
						activateBicycleMap : false,
						minMaxLevel : [ 1, 14 ],
						size : new nhn.api.map.Size(800, 480)		});
		
		// 줌 컨트롤
		var mapZoom = new nhn.api.map.ZoomControl();
		oMap.addControl(mapZoom);
		mapZoom.setPosition({
			top : 10,
			left : 10
		});

		var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
		oMap.addControl(oMapTypeBtn);
		oMapTypeBtn.setPosition({
			bottom : 10,
			right : 80
		});
		
		var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
		oThemeMapBtn.setPosition({
			bottom : 10,
			right : 10
		});
		oMap.addControl(oThemeMapBtn);

// 		var oBicycleGuide = new nhn.api.map.BicycleGuide(); // - 자전거 범례 선언
// 		oBicycleGuide.setPosition({
// 			top : 10,
// 			right : 10
// 		}); // - 자전거 범례 위치 지정
// 		oMap.addControl(oBicycleGuide);// - 자전거 범례를 지도에 추가.

// 		var oTrafficGuide = new nhn.api.map.TrafficGuide(); // - 교통 범례 선언
// 		oTrafficGuide.setPosition({
// 			bottom : 30,
// 			left : 10
// 		});  // - 교통 범례 위치 지정.
// 		oMap.addControl(oTrafficGuide); // - 교통 범례를 지도에 추가.

// 		var trafficButton = new nhn.api.map.TrafficMapBtn(); // - 실시간 교통지도 버튼 선언
// 		trafficButton.setPosition({
// 			bottom:10, 
// 			right:150
// 		}); // - 실시간 교통지도 버튼 위치 지정
// 		oMap.addControl(trafficButton);

		// 아이콘 설정
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

		// info window
		var oInfoWnd = new nhn.api.map.InfoWindow();
		oInfoWnd.setVisible(false);
		oMap.addOverlay(oInfoWnd);

		oInfoWnd.setPosition({
			top : 20,
			left :20
		});

		var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
		oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.

		oInfoWnd.attach('changeVisible', function(oCustomEvent) {
			if (oCustomEvent.visible) {
				oLabel.setVisible(false);
			}
		});
		
// 		var oPolyline = new nhn.api.map.Polyline([], {
// 			strokeColor : '#f00', // - 선의 색깔
// 			strokeWidth : 5, // - 선의 두께
// 			strokeOpacity : 0.5 // - 선의 투명도
// 		}); // - polyline 선언, 첫번째 인자는 선이 그려질 점의 위치. 현재는 없음.
// 		oMap.addOverlay(oPolyline); // - 지도에 선을 추가함.

// 		oMap.attach('mouseenter', function(oCustomEvent) {

// 			var oTarget = oCustomEvent.target;
// 			// 마커위에 마우스 올라간거면
// 			if (oTarget instanceof nhn.api.map.Marker) {
// 				var oMarker = oTarget;
// 				oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
// 			}
// 		});

// 		oMap.attach('mouseleave', function(oCustomEvent) {

// 			var oTarget = oCustomEvent.target;
// 			// 마커위에서 마우스 나간거면
// 			if (oTarget instanceof nhn.api.map.Marker) {
// 				oLabel.setVisible(false);
// 			}
// 		});

		oMap.attach('click', function(oCustomEvent) {
			oMap.clearOverlay();
			
			var oPoint = oCustomEvent.point;
			console.log(oPoint.y);	// latitude
			console.log(oPoint.x);	// longitude
			
			var oTarget = oCustomEvent.target;
			oInfoWnd.setVisible(false);
			// 마커 클릭하면
			if (oTarget instanceof nhn.api.map.Marker) {
				// 겹침 마커 클릭한거면
				
				if (oCustomEvent.clickCoveredMarker) {
					return;
				}
				// - InfoWindow 에 들어갈 내용은 setContent 로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며, 
				// - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
				// - 단, DIV 의 position style 은 absolute 가 되면 안되며, 
				// - absolute 의 경우 autoPosition 이 동작하지 않습니다. 
				oInfoWnd.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
					'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
					'Hello World <br /> ' + oTarget.getPoint()
					+'<span></div>');
				oInfoWnd.setPoint(oTarget.getPoint());
				oInfoWnd.setPosition({right : 15, top : 30});
				oInfoWnd.setVisible(true);
				oInfoWnd.autoPosition();
				return;
			}
			var oMarker = new nhn.api.map.Marker(oIcon, { title : '마커 : ' + oPoint.y + " " + oPoint.x });
			oMarker.setPoint(oPoint);
			oMap.addOverlay(oMarker);

// 			var aPoints = oPolyline.getPoints(); // - 현재 폴리라인을 이루는 점을 가져와서 배열에 저장.
// 			aPoints.push(oPoint); // - 추가하고자 하는 점을 추가하여 배열로 저장함.
// 			oPolyline.setPoints(aPoints); // - 해당 폴리라인에 배열에 저장된 점을 추가함

			$("#latInput").val(oPoint.y);
			$("#lngInput").val(oPoint.x);
		});
		
		// 현재 위치 마커 찍기
		var oMarker1 = new nhn.api.map.Marker(oIcon, { title : '현재 위치' });  //마커 생성 
		oMarker1.setPoint(currentPoint); //마커 표시할 좌표 선택
		oMap.addOverlay(oMarker1); //마커를 지도위에 표현 
		var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
		oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
		oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기 
	}
</script>
</body>
</html>
