jQuery(document).ready(function($) {
    // 페이지가 로드될 때 실행되는 코드
    console.log("페이지가 로드되었습니다.");

    // 사용자의 위치 정보 가져오기
    navigator.geolocation.getCurrentPosition(showPosition, showError);

    function showPosition(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        console.log("위도: " + latitude);
        console.log("경도: " + longitude);
        $("#latitude").html(latitude);
        $("#longitude").html(longitude);

        // 카카오맵 관련 코드 위치 변경
        var container = document.getElementById('mapapp'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
            level: 5 //지도의 레벨(확대, 축소 정도)
        };
        
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        var markerPosition = new kakao.maps.LatLng(latitude, longitude); 

        var marker = new kakao.maps.Marker({

            position: markerPosition

        });

        marker.setMap(map);

        var iwContent = '<div>My Location</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
        infowindow.open(map, marker);  
    });
    }

    function showError(error) {
        switch(error.code) {
            case error.PERMISSION_DENIED:
                console.error("위치 정보 사용 권한이 거부되었습니다.");
                break;
            case error.POSITION_UNAVAILABLE:
                console.error("위치 정보를 사용할 수 없습니다.");
                break;
            case error.TIMEOUT:
                console.error("위치 정보 가져오기가 시간 초과되었습니다.");
                break;
            case error.UNKNOWN_ERROR:
                console.error("알 수 없는 오류가 발생했습니다.");
                break;
        }
    }
});