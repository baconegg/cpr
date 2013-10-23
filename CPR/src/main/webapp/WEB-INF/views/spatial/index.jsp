﻿<%@page import="org.shinyul.util.Constant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet" href="/cpr/resources/css/nivo/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/cpr/resources/css/nivo/style.css" type="text/css" media="screen" />
<body>
<!-- naver map -->
<div id="map"  style="border:1px solid #000;"></div>

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
		
	  	currentPoint = new nhn.api.map.LatLng(latitude, longitude);
//  		currentPoint = new nhn.api.map.LatLng(37.4823, 126.9271); // 테스트를 위해 현재 위치 신원시장 입구로 강제설정
		//currentPoint = new nhn.api.map.LatLng(37.487427, 126.927525); // 현재 위치 신원시장 입구로 강제설정
		
		// 맵 초기 환경 설정 (줌 레벨 10)
		mapInitialSetting(10);
		
		// 페이징 로딩시 시장 마커 띄우기
		var currentY = currentPoint.y;
		var currentX = currentPoint.x;
		popMarket(currentY, currentX);
		
		// 원그리기
		drawCircle(500);
		
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
						
					//console.log('startMarker click');
					mapInfoTestWindow.setVisible(false);
				
				} else{
				
					//test
// 					var clickLat = 37.4823;
// 					var clickLng = 126.9271;
					
					var clickLat = oCustomEvent.point.y;
					var clickLng = oCustomEvent.point.x;
					
					// 클릭한 시장의 상점 정보 로드
					fnGetMarketCoord(clickLat, clickLng);

				}
				return;
			}
		});	// end click event
	} // end showMap 
	
	
	// 페이징 로딩시 시장 마커 띄우기
	function popMarket(currentY, currentX){
		$.post('popMarket', {curLat:currentY, curLng:currentX}).done(function(data){
	  		for(var i = 0; i < data.length; i++){
					
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
			}
		}); 		  
	} // end popMarket
	
	//////////////////////////////////////////////////////////////////
	
	// 원하는 시장 클릭한 이후 작업
	// 1. 상점 정보 불러와서 지도에 찍기
	// 2. 상점에 마우스 호버시 상품이미지 슬라이드
	// 3. 상점 클릭시 상품 리스트 페이지로 이동
	function fnGetMarketCoord(clickLat, clickLng){
		
		$.post('/cpr/getMarketCoord',{curLat:clickLat,curLng:clickLng}).done(function(data){

			//console.log("marIdx : " + data.marIdx);
			//console.log("targetLat : " + data.targetLat);
			//console.log("targetLng : " + data.targetLng);
			
			// 1. 상점 정보 불러와서 지도에 찍기
			// ** 공통 X
			fnShopInfo(data.marIdx, data.targetLat, data.targetLng);
			
			// 2. 상점에 마우스 호버시 상품이미지 슬라이드
			fnNivo();
			
			// 3. 상점 클릭시 상품 리스트 페이지로 이동
			moveToProductList();
			  
			//역경매 메뉴 만들기..header에 로그인시 생성되도록 되어 있음... 그래서 필요없을듯
			//$('#menu-item-8').attr('style', 'display: inline-block');
			
		}); // end ajax-getMarketCoord
		
	} // end fnGetMarketCoord
	
	// 1. 상점 정보 불러와서 지도에 찍기
	function fnShopInfo(marIdx, targetLat, targetLng){
		
		//test - 강제로 신원시장으로 함...
// 		marIdx = 290;

		$.post('/cpr/shopInfo', {marIdx: marIdx}).done(function(data2){

			oMap.clearOverlay();

			// 원그리기
			drawCircle(100);
			  
			var reloadPoint = new nhn.api.map.LatLng(targetLat, targetLng);
			var tempZoomOptions = { useEffect : true, centerMark : true };
			oMap.setCenterAndLevel(reloadPoint, 14, tempZoomOptions);
			  
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
	$('#menu-item-1').attr('class', 'change btn btn-primary');
// 	var inhtml = '<a href="http://">링크링크</a>';	
// 	$('#menu-item-5').html(inhtml);
	
</script>	
</body>
</html>