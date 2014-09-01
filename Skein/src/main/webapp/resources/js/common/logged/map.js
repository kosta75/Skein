bind(window, 'load', function() {
	//geolocationInit();
});


// 이벤트 할당
function bind(elem, type, handler, capture) {
	type = typeof type === 'string' && type || '';
	handler = handler || function() {
		;
	};
	if (elem.addEventListener) {
		elem.addEventListener(type, handler, capture);
	} else if (elem.attachEvent) {
		elem.attachEvent('on' + type, handler);
	}
	return elem;
};
function geolocationInit() {
	if (navigator.geolocation) {
		var geo = navigator.geolocation;
		geo.getCurrentPosition(function(pos) {
			//alert("위도" + pos.coords.latitude + "/" + "경도"+ pos.coords.longitude);
			// alert(pos.coords.longitude);
			// 정확도
			// alert(pos.coords.accuracy);
			// 마지막 업데이트 시간(초)
			// alert(pos.timestamp);
			// google map 연동
			//mapInit(pos.coords.latitude, pos.coords.longitude);
////////////////////////////////////////////////////////////////////
		//"http://map.naver.com/common2/getRegionByPosition.nhn?xPos="+ pos.coords.latitude+"&yPos="+pos.coords.longitude;
		//ss ='http://map.naver.com/common2/getRegionByPosition.nhn?xPos='+pos.coords.longitude+'&yPos='+pos.coords.latitude;
		//var longitude= pos.coords.longitude;//경도
		//var latitude= pos.coords.latitude;//위도
		 
		weatherAjax(pos.coords.latitude,pos.coords.longitude);
//////////////////////////////////////////////////////////////////////			
		}, function(e) {
			msg({
				0 : '위치 정보 검색에 문제가 있습니다.(msg:' + e.message + ')',
				1 : '현재 페이지에서 사용자가 위치 정보 검색을 거부했습니다.',
				2 : '브라우저가 위치정보를 검색하지 못했습니다.(msg:' + e.message + ')',
				3 : '브라우저의 위치 정보 검색 시간이 초과됐습니다.'
			}[e.code]);
		}, {
			enableHeighAccuracy : true,
			timeout : 10000,
			maximumAge : 0
		});
	} else {
		alert('HTML 5 지오로케이션을 지원하지 않는 브라우저입니다.');
	}
}

//날씨별 배경이미지 변화
function weatherImag(){};
function msg(msg) {
	alert(msg);
}
function weatherBgc(weatherCondition){
	if(weatherCondition == "Rain"){
		$('#header_bar').css("background-color","black");
		//$('#bar').css("background-color",$(this).css("background-color"));
	}
}
function weatherAjax(latitude,longitude){
	$.ajax({
		// 결과를 한글로 받을 수 있다.
		//url : "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/conditions/lang:KR/q/Korea/Busan.json",//도시이름 날씨
		//url: "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/q/autoip.json",//IP기반 날씨
		//url: "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/q/36.776289,127.395234.json",/위도 경도 날씨
		url : "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/conditions/lang:KR/q/"+latitude+","+longitude+".json",
		//url : "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/conditions/lang:KR/q/25.2001,127.5002.json",
		
		dataType : "jsonp",
		success : function(parsed_json) {
			//alert('aaa');
			//alert(parsed_json.response.version);
			//alert(parsed_json.location.city);
			// alert(parsed_json.location.wmo);
	/* 	
			// location
			var location = parsed_json.location;
			var location_s = "<p>국가명(country_name):  "+ location.country_name+ "</p>";
			location_s += "<p>도시명(city_name):  "+ location.city + "</p>";
			location_s += "<p>경도(lat):  "+ location.lat + "</p>";
			location_s += "<p>위도(lon):  "+ location.lon + "</p>";
			$("#locationinfo").append(location_s);
			//====================================================================================
			// 관측지에 대한 정보
			var observ = parsed_json.current_observation;
			var observ_s = "<p>관측지 주소 전체 : "+ observ.display_location.full+ "</p>";
			observ_s += "<p>관측지 주소 국가 : "+ observ.display_location.state_name+ "</p>";
			observ_s += "<p>관측지 주소 도시 : "+ observ.display_location.city+ "</p>";
			observ_s += "<p>관측지 경도(latitude) : "+ observ.display_location.latitude+ "</p>";
			observ_s += "<p>관측지 위도(longitude) : "+ observ.display_location.longitude+ "</p>";
			observ_s += "<p>관측지 해발고도(elevation) : "+ observ.display_location.elevation+ "</p>";
			$("#observinfo").append(observ_s);
			//====================================================================================
			// 날씨정보
			var weather_s = "<p>업데이트 정보:  "+ observ.observation_time+ "</p>";	
			weather_s += "<p>현재 날씨 :  "+ observ.weather + "</p>";
			weather_s += "<p>현재 온도 화씨(섭씨):  "+ observ.temperature_string+ "</p>";
			weather_s += "<p>현재 온도 화씨:  "+ observ.temp_f + "</p>";
			weather_s += "<p>현재 온도 섭씨:  "+ observ.temp_c + "</p>";
			weather_s += "<p>상대 습도 :  "+ observ.relative_humidity+ "</p>";
			weather_s += "<p>바람 정보 전체 :  "+ observ.wind_string + "</p>";
			weather_s += "<p>풍향 :  "+ observ.wind_dir + "</p>";
			weather_s += "<p>풍속 (mph):  "+ observ.wind_mph + "</p>";
			weather_s += "<p>풍속 (kph):  "+ observ.wind_kph + "</p>";
			weather_s += "<p>자외선 양:  " + observ.UV+ "</p>";
			weather_s += "<p>아이콘 : " + observ.icon+ "</p>";
			weather_s += "<p>아이콘 그림 :  "+ "<img src='"+observ.icon_url+"'/></p>";
			$("#weatherinfo").append(weather_s);
			//====================================================================================
	*/		
			
			var observ = parsed_json.current_observation;
			
			
			var weather_s = "<div align='center'><p><img  src='"+observ.icon_url+"'/></p></div>";
			
			weather_s += "<p>날씨 :        "+ observ.weather + "</p>";
			weather_s += "<p>온도 :        "+ observ.temp_c + "ºC</p>";
			//weather_s += "<p>아이콘 : " + observ.icon+ "</p>";
			weather_s += "<p id='updateDate'>"+observ.observation_time+ "</p>";
			
			$("#locationinfo").append(weather_s);		
			
			var location = parsed_json.location;
			//var location_s; = "<p>국가명:  "+ location.country_name+ "</p>";
			var location_s = "<p id='city'>도시명:  "+ location.city+"</p>";
			$("#locationinfo").append(location_s);
			
		
			//var observ_s;
			//observ_s += "<p>관측지 주소 도시 : "+ observ.display_location.city+ "</p>";
			//$("#locationinfo").append(observ_s);
			
/*
chanceflurries
chancerain
chancesleet
chancesleet
chancesnow
chancetstorms
chancetstorms
( v ) clear
( v ) cloudy
flurries 강풍
fog     
hazy
( v ) mostlycloudy
mostlysunny
partlycloudy
partlysunny
sleet 짖눈깨비
( v ) rain
sleet
( v ) snow
( v ) sunny
tstorms
tstorms
tstorms
cloudy
*/
			$('#observinfo').css("opacity","0.95");/**/
			$('#observinfo').css("background-repeat","no-repeat");
			$('#observinfo').css("border-radius","10px 10px 10px 10px");
			$('#observinfo').css("background-image","url('./resources/media/gif/"+observ.icon+".gif')");
			//alert(observ.weather+"1");

			/*
			$('.footer-container').css("background-image","url('./resources/media/gif/rain.gif')");
			$('.footer-container').css("opacity","0.45");
			//background-size:cover; background-repeat:no-repeat;
			$('.footer-container').css("background-size","100%");
			$('.footer-container').css("background-repeat","no-repeat");
			*/
		},
		error: function(){
			alert('에러 :error while request..'	);
		}
	});
	
}
//구글 맵 보여주는 코드
/*<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false">
</script> 
<script type="text/javascript"> 
function mapInit(latitude, longitude) { var opt = {
	zoom : 15, center : new google.maps.LatLng(latitude, longitude), mapTypeId :
	google.maps.MapTypeId.ROADMAP }; var map = new google.maps.Map(
	document.getElementById('map_canvas'), opt); };*/
	

	
 	
