<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ccec360727c21d505a84471b5e77c9f&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="/css/modal.css">
<link rel="stylesheet" href="/css/store/detail.css">


<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!-- 메인 -->
<%@ include file="/WEB-INF/views/store/storeDetail.jsp"%>
<!-- 메인 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- 푸터 -->

<script type="text/javascript" src="/js/store/storeDetail.js"></script>

<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			center: new kakao.maps.LatLng(37.4502008011333, 127.12986505883454), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
		var roadmapControl = document.getElementById('btnRoadmap');
		var skyviewControl = document.getElementById('btnSkyview'); 
		if (maptype === 'roadmap') {
			map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
			roadmapControl.className = 'selected_btn';
			skyviewControl.className = 'btn';
		} else {
			map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
			skyviewControl.className = 'selected_btn';
			roadmapControl.className = 'btn';
		}
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
		map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
		map.setLevel(map.getLevel() + 1);
	}

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.4502008011333, 127.12986505883454); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
<style>
	.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
	.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>
</body>
</html>