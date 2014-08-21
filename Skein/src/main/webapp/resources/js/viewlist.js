$(document).ready(function(){
     $(".img-list").hover(
            function(){
               //alert('호버~!!!!!!!!!!!!!들옴');
                $(this).css("background-color",$('#leftinfo').css("background-color")); 
            },
            function(){
               //alert('호버~2!나감');
                $(this).css("background-color","white"); 
            });   
            
        /*  $("div #whatweather").whatWeather({city:"Brussels"}); */
         /*스크롤 감지  */
         function lastPostFunc(pictureCount){ 
        	
         $.ajax({
        	
               type:'get',
               url:"viewList",
               data:"pictureCount="+ pictureCount,
               dataType : "html",
               success : function(data) {
              
                if(data.trim()==""){
                   
                }else{
                   $('#boardlist-picture').append(data);  
                }  
               },
               error: function(){
                  alert('스크롤 에러 :error while request..'   );
               }
            });
         }; 
         
         $(window).scroll(function(){ 
            if ($(window).scrollTop() == $(document).height() - $(window).height()){ 
               //alert('스크롤 감지');
               
              //alert("현재 사진 불러온 수 : "+ $('.list').size());
              var pictureCount = $('.list').size();
               lastPostFunc(pictureCount); 
             
            }
            
           
            //
            //}       
         });
});