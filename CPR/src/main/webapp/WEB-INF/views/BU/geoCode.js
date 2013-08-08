function geoCode(addr) {
	 var faddr = addr;
	 var geocoder;
	 geocoder = new google.maps.Geocoder();
	 geocoder.geocode( { 'address': faddr}, function(results, status) {
		 
		  if (status == google.maps.GeocoderStatus.OK) {
		    var faddr_lat = results[0].geometry.location.lat(); //위도
		    var faddr_lng = results[0].geometry.location.lng(); //경도
		  } else {
		    var faddr_lat = "";
		    var faddr_lng = "";
		  }
		  
		  /////////////////////백화점 및 대형마트 위치 포인트//////////////////////////////////////////////////
		  /*var Point = new nhn.api.map.LatLng(faddr_lat, faddr_lng);*/
		  ///////////////////////////////////////////////////////////////////////////////////////////////////
		  //반경 500m 시장 내부 띄우기...
		  var arr = {"memberIdx":18, "distance":"0.5"};
		  $.post('popShop', arr).done(function(data){
			  for(var i = 0; i < data.length; i++){
					
					//alert(data[i].lat);
					
					var oSize2 = new nhn.api.map.Size(28, 37);
					var oOffset2 = new nhn.api.map.Size(14, 37);
					var point = new nhn.api.map.LatLng(data[i].targetLat, data[i].targetLng); 
					
					var oIcon2 = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize2, oOffset2);
									
					// 현재 위치 마커 찍기
					var oMarker2 = new nhn.api.map.Marker(oIcon2, {title : data[i].selStore}); //마커 생성 
					
					oMarker2.setPoint(point); //마커 표시할 좌표 선택
					oMap.addOverlay(oMarker2); //마커를 지도위에 표현 
					var oLabel2 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
					oMap.addOverlay(oLabel2); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 
					oLabel2.setVisible(true, oMarker2); // 마커 라벨 보이기 	
				}
			}); 		  
		   /////////////////////////////////////////////////////////////////////	  
		   
		  //alert('주소 : ' + faddr + '\n\n위도 : ' + faddr_lat + '\n\n경도 : ' + faddr_lng);		
	 });
}