/**
 * Product Image Slider
 * and
 * Move to Product List
 */


// 2. 상점에 마우스 호버시 상품이미지 슬라이드
function fnNivo(){
	
	var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성
	
	oMap.attach('mouseenter', function(oCustomEvent) {
	
		oMap.addOverlay(mapInfoTestWindow);	// - 지도에 추가

		var oTarget = oCustomEvent.target;
		// 마커 위에 마우스 올라간거면
		if (oTarget instanceof nhn.api.map.Marker) {

			console.log(oTarget);

			var hoverLat = oTarget._oPoint.y ;
			var hoverLng = oTarget._oPoint.x ;
			console.log(hoverLat);
			console.log(hoverLng);

			$.post('/cpr/loadShopSlideData',{curLat:hoverLat, curLng:hoverLng}).done(function(data3){
		
//			alert( data3[0].selImgUuid);
//			console.log('loadShopSlideData : ' + data3[0].selStore);
//			console.log('loadShopSlideData : ' + data3[0].productImgUuid);
			
				var slider = '';
				slider += '<div id="slider-wrapper theme-dark"> <div id="slider" class="nivoSlider">';				
				slider += '<a href="/cpr/product/list/' + data3[0].selIdx + '"><img src="/cpr/resources/view.jsp?file=D:/images/seller/thumb/' + data3[0].selImgUuid + '" title="' + data3[0].selStore +'" /></a>';			
				
				for(var i = 1; i < data3.length; i++){
					slider += '<a href="/cpr/product/view/seller?productIdx=' + data3[i].productIdx + '"><img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/' + data3[i].productImgUuid + '" title="' + data3[i].productName +'" /></a>';
				
				}
			
//			var arr = new Array(data3.length);
//			var ran = 0;
//			var check;
//			
//			for(var i = 1; i < arr.length; i++){
//				
////				alert(data3[i]);
//
//				ran = Math.floor(Math.random() * arr.length);
//				check = true;
//				for(var j = 1; j < i; j++){
//					// 배열에 들어있는 기존값과 같은 경우, for문 한번 더 돌게 함.
//					if(arr[j] == ran){
//						i--;
//						check = false;
//					}
//				}
//					if(check) {
//						arr[i] = ran;
//						var n = arr[i];
//					 // console.log(n);
//						slider += '<a href="/cpr/product/view/seller?productIdx=' + data3[n].productIdx + '"> <img src="/cpr/resources/view.jsp?file=D:/images/product/thumb/' + data3[n].productImgUuid + '" title="' + data3[n].productName +'" /> </a>';				
//					}
//			}
		    	slider += '</div> </div>';
	    
				mapInfoTestWindow.setContent(slider);
				jQuery.noConflict();
	        	$('#slider').nivoSlider();
		
			});
			
			mapInfoTestWindow.setPoint(oTarget.getPoint());
			mapInfoTestWindow.setVisible(true);
			mapInfoTestWindow.setPosition({right : 20, top : 10});
			mapInfoTestWindow.autoPosition();
			
		} // end if oTarget
	}); // end mouseenter
} // end fnNivo

// 3. 상점 클릭시 상품 리스트 페이지로 이동
function moveToProductList(){
	
	oMap.attach('click', function(oCustomEvent) {		
						
		var oTarget = oCustomEvent.target;
		// 마커 클릭했을 때
		if (oTarget instanceof nhn.api.map.Marker) {
			// 겹침 마커 클릭했을 때
			if (oCustomEvent.clickCoveredMarker) {
				return;
			}
			var clickLat = oCustomEvent.point.y;
			var clickLng = oCustomEvent.point.x;
			
			$.post('/cpr/loadShopSlideData',{curLat:clickLat,curLng:clickLng}).done(function(data){
  				location.href = '/cpr/product/list/' + data[0].selIdx;						
			});
			return;
		}
	});	
} // end moveToProductList