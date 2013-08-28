<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<link rel="stylesheet" href="/cpr/resources/css/nivo/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/cpr/resources/css/nivo/style.css" type="text/css" media="screen" />
<body>

<!-- naver map -->	<!-- 나중에 지도 없애기 버튼을 위한 디스플레이 속성 -->
<div id="map" style="border:1px solid #000;"></div>
<input type="button" id="shop" value="shop" />

<form name="selectLocation" >
	<input name="latInput" type="hidden" id="latInput" value="" />
	<input name="lngInput" type="hidden" id="lngInput" value="" />		
	<!-- <input type="submit" value="sendAddress" /> -->
</form>

<script src="/cpr/resources/js/spatial/geolocation.js"></script>
<script src="/cpr/resources/js/spatial/mapSetting.js"></script>
<script src="/cpr/resources/js/spatial/mouseEffect.js"></script>
<script src="/cpr/resources/js/spatial/jquery.nivo.slider.js"></script>

<script>

	var currentPoint;	

	function showMap(latitude, longitude){
		
		
      //currentPoint = new nhn.api.map.LatLng(latitude, longitude);
	   currentPoint = new nhn.api.map.LatLng(37.4823, 126.9271); // 현재 위치 신원시장 입구로 강제설정 
//currentPoint = new nhn.api.map.LatLng(37.4833, 126.9371); // 현재 위치 신원시장 입구로 강제설정 
	 	
		// 맵 초기 환경 설정 
		mapInitialSetting();
		  
		// 시장에서 가까운지 아닌지 확인 
		// a. 반경 100미터에 상점이 있으면 시장 내부 지도 
		// b. 없으면 근처 시장 지도
	  	$.post('isNearShop',{curLat:currentPoint.y, curLng:currentPoint.x}).done(function(data){
			  
// 			console.log("nearShopIdx : " + data.selIdx + ", " + data.selStore + ", marIdx : " + data.marIdx);
			 
			// a. 반경 100미터에 상점이 있으면 시장 내부 지도 
			if(data.selIdx){
				  
				// a.1. 상점 정보 불러와서 지도에 찍기 
				// ** 공통 X 
				fnShopInfo(data.marIdx, data.targetLat, data.targetLng);
				  
				// a.2. 상점에 마우스 호버시 상품이미지 슬라이드 
				fnNivo();
				  
				// a.3. 상점 클릭시 상품 리스트 페이지로 이동 
				moveToProductList();
				    
			} else { // b. 없으면 근처 시장 지도 
					  
				oMap.setLevel(11);
				drawCircle(1000);
				  
				$.post('/cpr/nearestMarket', {curLat:currentPoint.y, curLng:currentPoint.x}).done(function(data){
	
			  		for(var i = 0; i < data.length; i++){
					  		
				  		// console.log("nearestMarket : " + data[i].marId);
							
					  	// 쇼핑카트 아이콘으로 변경 (사이즈도 변경)
						var oSize2 = new nhn.api.map.Size(30, 40);
						var oOffset2 = new nhn.api.map.Size(14, 37);
						var marketPoint = new nhn.api.map.LatLng(data[i].targetLat, data[i].targetLng); 
						
						var marektIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/shopping_cart_30_40.png', oSize2, oOffset2);
										
						// 상점 위치 마커 찍기 
						var marketMarker = new nhn.api.map.Marker(marektIcon, {title : data[i].marId}); 
						marketMarker.setPoint(marketPoint);
						oMap.addOverlay(marketMarker);
						
						var marketLabel = new nhn.api.map.MarkerLabel();
						oMap.addOverlay(marketLabel);
						marketLabel.setVisible(true, marketMarker);
	 				} // end for.
				});
				  
				  
				// 클릭한 시장의 상세 상점 지도 로드 
				oMap.attach('click', function(oCustomEvent) {		
						
					var oTarget = oCustomEvent.target;
					// 마커 클릭했을 때
					if (oTarget instanceof nhn.api.map.Marker) {
						// 겹침 마커 클릭했을 때
						if (oCustomEvent.clickCoveredMarker) {
							return;
						}
						// 현재 위치 아이콘 클릭했을 때는 상점으로 이동 안 되게 
						if(oTarget._sTitle == '현재 위치'){
										
// 							console.log('startMarker click');
							mapInfoTestWindow.setVisible(false);
								
						} else{
								
							var clickLat = oCustomEvent.point.y;
							var clickLng = oCustomEvent.point.x;
			
									
							$.post('/cpr/getMarketCoord',{curLat:clickLat,curLng:clickLng}).done(function(data){
		
// 								console.log("marIdx : " + data.marIdx);
// 								console.log("targetLat : " + data.targetLat);
// 								console.log("targetLng : " + data.targetLng);
										
								var reloadPoint = new nhn.api.map.LatLng(data.targetLat, data.targetLng);
								var tempZoomOptions = { useEffect : true, centerMark : true };
								oMap.setCenterAndLevel(reloadPoint, 14, tempZoomOptions);
							}); // end ajax-getMarketCoord 
						} // end else 
						return;
					}
				});	// end click event 
			} // end if a or b 
		}); // end isNearestShop 
	} // end showMap
	
	// a.1. 상점 정보 불러와서 지도에 찍기 
	function fnShopInfo(marIdx, targetLat, targetLng){
		
		$.post('/cpr/shopInfo', {"marIdx" : marIdx}).done(function(data2){

			oMap.setLevel(14);
// 			drawCircle(100);
			  
			for(var i = 0; i < data2.length; i++){
					
			// 쇼핑카트 아이콘으로 변경 (사이즈도 변경)
			var oSize2 = new nhn.api.map.Size(30, 40);
			var oOffset2 = new nhn.api.map.Size(14, 37);
			var storePoint = new nhn.api.map.LatLng(data2[i].targetLat, data2[i].targetLng); 
			
			var storeIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/shopping_cart_30_40.png', oSize2, oOffset2);
						
			// 상점 위치 마커 찍기
			var storeMarker = new nhn.api.map.Marker(storeIcon, {title : data2[i].selStore}); 
			storeMarker.setPoint(storePoint);
			oMap.addOverlay(storeMarker);
			
			//이름주기
			var storeLabel = new nhn.api.map.MarkerLabel();
			oMap.addOverlay(storeLabel);
			storeLabel.setVisible(true, storeMarker);	
			}
		});
	} // end fnShopInfo
	
	
	// 사이드메뉴에 해당할때마다 밑에꺼 복사해서 붙여 넣어줄것!!!/////////////////////////////////////////////////	
// 	$('#menu-item-2').attr('class', 'current-menu-item menu-item-type-post_type menu-item-object-page menu-item-1');
	$('#menu-item-2').attr('class', 'change btn btn-primary');
</script>	
</body>
</html>