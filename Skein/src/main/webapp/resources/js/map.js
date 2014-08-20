bind(window, 'load', function() {
   geolocationInit();
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
    
       
      weatherAjax(pos.coords.latitude,pos.coords.longitude);
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

function weatherBgc(weatherCondition){
   if(weatherCondition == "Rain"){
      $('#header_bar').css("background-color","black");
     }
}
function weatherAjax(latitude,longitude){
   $.ajax({
       url : "http://api.wunderground.com/api/047cfd871300e5c2/geolookup/conditions/lang:KR/q/"+latitude+","+longitude+".json",
      
      dataType : "jsonp",
      success : function(parsed_json) {
  
         
         var observ = parsed_json.current_observation;
         
         
         var weather_s = "<div style='width:100%;'><p><img  src='"+observ.icon_url+"'/></p></div>";
         
         weather_s += "<p>날씨 :        "+ observ.weather + "</p>";
         weather_s += "<p>온도 :        "+ observ.temp_c + "ºC</p>";
         //weather_s += "<p>아이콘 : " + observ.icon+ "</p>";
         weather_s += "<p id='updateDate'>"+observ.observation_time+ "</p>";
         
         $("#locationinfo").append(weather_s);      
         
         var location = parsed_json.location;
           var location_s = "<p>도시명:  "+ location.city+"</p>";
          
         $("#locationinfo").append(location_s);
         
   
         $('#observinfo').css("opacity","0.95");/**/
         $('#observinfo').css("background-repeat","no-repeat");
         $('#observinfo').css("border-radius","10px 10px 10px 10px");
         $('#observinfo').css("background-image","url('./resources/media/weather/"+observ.icon+".gif')");
         //alert(observ.weather+"1");
         
        	 $("#historyWriteMenu3").click(function(){
        		
        		 if( $("#historymap").css("display") == "block"){
        		 $("#historymap").css("display","none");
        		
        		
        		 }else{
        			 $("#historyImg").css("display","none");
        				$("#historyDate").css("display","none")
        				$("#historyemoticon").css("display","none");
        				$("#historymap").css("display","block");
        				 $("#historyplace").val(location.city);
        		 }
        	 });
        	 
        	 
        
   
      },
      error: function(){
         alert('에러 :error while request..'   );
      }
   });
}
