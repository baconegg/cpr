/**
 *  Map Initial Setting
 *  and
 *  Draw Circle
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
					size : new nhn.api.map.Size(browserWidth, browserHeight + 850)		
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
	
	// 현재 위치 사람 아이콘 설정
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
 // var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); //
	var oIcon = new nhn.api.map.Icon('/cpr/resources/images/default/spatial/person.png', oSize, oOffset);
	
	// 현재 위치 마커 찍기
	startMarker = new nhn.api.map.Marker(oIcon, {title : '현재 위치'});
	startMarker.setPoint(currentPoint); 
	oMap.addOverlay(startMarker);

	// 현재 위치 마커에 라벨 추가
	var oLabel = new nhn.api.map.MarkerLabel();
	oMap.addOverlay(oLabel);
	oLabel.setVisible(true, startMarker);

}	// end mapInitialSetting


function drawCircle(rad){
	
	circle = new nhn.api.map.Circle({
		strokeColor : "pink",
		strokeOpacity : 0.2,
		strokeWidth : 5,
		fillColor : "pink",
		fillOpacity : 0.2
	});

	radius = rad; 							// - radius의 단위는 meter
	circle.setCenterPoint(currentPoint); 		// - circle 의 중심점을 지정.
	circle.setRadius(radius); 					// - circle 의 반지름을 지정 (단위 meter).
  //circle.setStyle("strokeOpacity", 0.2); 		// - setStyle 함수로 선의 투명도를 다시 지정.

	oMap.addOverlay(circle);
} // end drawCircle

