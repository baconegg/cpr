<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
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
	   /*  $('body').append("<p>Your location is: " + latitude + "," + longitude+" </p><p>Accuracy="+position.coords.accuracy+"m"); */
	    
// 		현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
// 		$('#traceLat').val(37.4815787);
// 		$('#traceLng').val(126.9284316);
	    $('#traceLat').val(latitude);
	    $('#traceLng').val(longitude);
	    
	    showMap(latitude, longitude);
	}
// ---------------------- 기본 작업 종료 -------------------------

	function showMap(latitude, longitude){
		
		var browserWidth = document.body.clientWidth;
		var browserHeight = document.body.clientHeight;
		
		console.log('창 넓이 : ' + browserWidth);
		console.log('창 높이 : ' + browserHeight);
		
		// 현재위치 신원시장 입구로 강제설정 -- 나중에 값 받아와서 세팅...
// 		currentPoint = new nhn.api.map.LatLng(37.4815787, 126.9284316);
		currentPoint = new nhn.api.map.LatLng(latitude, longitude);
		
		//자기중심 반경 계산해 찍을 때 - 12
		//서울시 - 8~9
		//시장 내부 전경을 찍어줄땐??
				
		var defaultLevel = 9;
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
						size : new nhn.api.map.Size(browserWidth - 20, browserHeight + 800)		
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
/* 		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); */
		var oIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/person.png', oSize, oOffset);

		// ------------------- 마커 찍기 --------------------
		// 초기(현재 위치) 마커 찍기
		var startMarker = new nhn.api.map.Marker(oIcon, {title : '현재 위치'});
		startMarker.setPoint(currentPoint); 
		oMap.addOverlay(startMarker);
		
		var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
		oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
		oLabel.setVisible(true, startMarker); // 마커 라벨 보이기 	
		


		// 새로운 마커 찍기
// 		oMap.attach('click', function(oCustomEvent) {
// 			oMap.clearOverlay();	// 기존에 있던 마커 다 지우기
			
// 			var oPoint = oCustomEvent.point;
// 			console.log(oPoint.y);	// latitude
// 			console.log(oPoint.x);	// longitude
			
// 			var oNewMarker = new nhn.api.map.Marker(oIcon, { title : '현재위치 : ' + oPoint.y + " " + oPoint.x});
// 			oNewMarker.setPoint(oPoint);
// 			oMap.addOverlay(oNewMarker);

// 			$("#latInput").val(oPoint.y);
// 			$("#lngInput").val(oPoint.x);
// 		});
		
		//info Window
	  	var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성
		mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정.
		oMap.addOverlay(mapInfoTestWindow);	// - 지도에 추가.	 
			

// 			mapInfoTestWindow.attach('changeVisible', function(oCustomEvent) {
// 				if (oCustomEvent.visible) {
// 					oLabel.setVisible(false);
// 				}
// 		});



		  $.post('/cpr/popSuperstore', {curLat : currentPoint.y , curLng : currentPoint.x }).done(function(data){
			  for(var i = 0; i < data.length; i++){
					
//					alert(data[i].selStore + '\n\n' + data[i].targetLat + ', ' + data[i].targetLng);
					
				  	// 쇼핑카트 아이콘으로 변경 (사이즈도 변경)
					var oSize2 = new nhn.api.map.Size(30, 40);
					var oOffset2 = new nhn.api.map.Size(14, 37);
					var storePoint = new nhn.api.map.LatLng(data[i].targetLat, data[i].targetLng); 
					
					var storeIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/shopping_cart_30_40.png', oSize2, oOffset2);
					/*var storeIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/shopping.png', oSize2, oOffset2);*/
									
					console.log(data[i].mName);
					
					// 상점 위치 마커 찍기
					var storeMarker = new nhn.api.map.Marker(storeIcon, {title : data[i].mName}); 
					storeMarker.setPoint(storePoint);
					oMap.addOverlay(storeMarker);
					
					var storeLabel = new nhn.api.map.MarkerLabel();
					oMap.addOverlay(storeLabel);
					storeLabel.setVisible(true, storeMarker);
				}
			}); 		  
		  
		  
		
		oMap.attach('mouseenter', function(oCustomEvent) {
			var oTarget = oCustomEvent.target;
			// 마커위에 마우스 올라간거면
			if (oTarget instanceof nhn.api.map.Marker) {
//					var oMarker = oTarget;
//					storeL.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
				
				console.log(oTarget);

				var hoverLat = oTarget._oPoint.y ;
				var hoverLng = oTarget._oPoint.x ;
				console.log(hoverLat);
				console.log(hoverLng);
				
				// 현재 위치 아이콘 호버했을 때는 info창 안 뜨게
				if(oTarget._sTitle == '현재 위치'){
					
					console.log('startMarker enter');
					mapInfoTestWindow.setVisible(false);
				
				} else{
				
					console.log('shopMarker enter');
					$.post('/cpr/loadPriceData',{curLat:hoverLat, curLng:hoverLng}).done(function(data){
						var inhtml = '';
						inhtml += '<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
						'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 2px 2px 2px !important">';						

						for(var i =0; i < data.length; i++){							
							console.log(data[i].aName);
							console.log(data[i].aPrice);
							inhtml += data[i].aName + ':' + data[i].aPrice+'원<br/>';							
						}
						inhtml += '</span></div>';
						mapInfoTestWindow.setContent(inhtml);
					});
					mapInfoTestWindow.setPoint(oTarget.getPoint());
					mapInfoTestWindow.setVisible(true);
					mapInfoTestWindow.setPosition({right : 20, top : 40});
					mapInfoTestWindow.autoPosition();
				}
			}
		});

		oMap.attach('mouseleave', function(oCustomEvent) {
			var oTarget = oCustomEvent.target;
			// 마커위에서 마우스 나간거면
			if (oTarget instanceof nhn.api.map.Marker) {
//					storeL.setVisible(false);
				mapInfoTestWindow.setVisible(false);
			}
		});
		
		
		
// 		//클릭 이벤트 - 시장상세지도 가기
// 		oMap.attach('click', function(oCustomEvent) {		
// 			var oTarget = oCustomEvent.target;
// 			// 마커 클릭하면
// 			if (oTarget instanceof nhn.api.map.Marker) {
// 				// 겹침 마커 클릭한거면
// 				if (oCustomEvent.clickCoveredMarker) {
// 					return;
// 				}				
// 				location.href = '/cpr/spatial';				
// 				return;
// 			}
// 		});

		//클릭 이벤트 - 시장상세지도 가기
// 		oMap.attach('click', function(oCustomEvent) {		
			
// 			var oTarget = oCustomEvent.target;
// 			// 마커 클릭했을 때
// 			if (oTarget instanceof nhn.api.map.Marker) {
// 				// 겹침 마커 클릭했을 때
// 				if (oCustomEvent.clickCoveredMarker) {
// 					return;
// 				}
// 				// 현재 위치 아이콘 클릭했을 때는 상점으로 이동 안 되게
// 				if(oTarget._sTitle == '현재 위치'){
						
// 						console.log('startMarker click');
// 						mapInfoTestWindow.setVisible(false);
				
// 				} else{
				
// 					var clickLat = oCustomEvent.point.y;
// 					var clickLng = oCustomEvent.point.x;
// // 					console.log(clickLat);
// // 					console.log(clickLng);

// 					//alert(clickLat);
					
// 					//console.log(oCustomEvent);
// 					//console.log($(this));
					
// 					$.post('/cpr/loadMarketData',{curLat:clickLat,curLng:clickLng}).done(function(data){

// 						console.log("marIdx : " + data.marIdx);
// 						console.log("targetLat : " + data.targetLat);
// 						console.log("targetLng : " + data.targetLng);
						
//  						location.href = "/cpr/shopInfo?marIdx="+data.marIdx+"&targetLat="+data.targetLat+"&targetLng="+data.targetLng;
						
// // 						$.post('/cpr/spatial', data).done(function(data){
 							
// //  						});
// 					});
// 				}
// 				return;
// 			}
// 		});	
		
		
	
		// ------------------- 원 그리기 --------------------
		var circle = new nhn.api.map.Circle({
						strokeColor : "pink",
						strokeOpacity : 0.2,
						strokeWidth : 5,
						fillColor : "pink",
						fillOpacity : 0.2
		});
		
		var radius = 2000; 							// - radius의 단위는 meter
		circle.setCenterPoint(currentPoint); 		// - circle 의 중심점을 지정.
		circle.setRadius(radius); 					// - circle 의 반지름을 지정 (단위 meter).
// 		circle.setStyle("strokeOpacity", 0.2); 		// - setStyle 함수로 선의 투명도를 다시 지정.
		
		oMap.addOverlay(circle);			
		

	}
	

	
	// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
// 	$('#menu-item-7').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	$('#menu-item-7').attr('class', 'change btn btn-primary');
</script>	
</body>
</html>