$(document).ready(function(){
	
	$(".addFriends").on('click', function(){
		var obj = $(this);
		console.log($(this));
		$.ajax({
			type : 'post',
			url : '../../friendship/add/' + $(this).data("uri"),
			cache : false,
			success : function(data) {
				//console.log(data);
				obj.parent().append("<div>Text</div>");
				obj.remove();
				
				
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});
	//**********************친구 목록 페이지 처리 ************************//
	/*스크롤 감지  */
    function lastPostFunc(friendCount){ 
    $.ajax({
          type:'get',
          url:"viewlist",
          data:"friendCount="+ friendCount,
          dataType : "html",
          success : function(data) {
        	console.log(data);
           if(data.trim()==""){
              
           }else{
              $('#friendlist').append(data);  
           }  
          },
          error: function(){
             alert('스크롤 에러 :error while request..'   );
          }
       });
    }; 
     
    $(window).scroll(function(){ 
       if ($(window).scrollTop() == $(document).height() - $(window).height()){ 
         // alert('스크롤 감지');
         //alert("현재 사진 불러온 수 : "+ $('.list').size());
    	  
         var pictureCount = $('.list').size();
         console.log(pictureCount);
          lastPostFunc(pictureCount); 
       }

    });
	
//****************************************************************************//	
   //친구 버튼 
  /*  $('.friendlistInfo').hover(
    	function(){
    		//alert("들어옴");
    	  $(this).find('.friendBtn').css("dispaly","none")
    	},
    	function(){
    		//alert("나감");
    	  $('.friendBtn').remove();
    	}
    	
    );
    */
   $(document).on('mouseout', ".friendlistInfo", function(){
	    $(this).find('.friendBtn').css("display","none")
	});

	$(document).on('mouseover', ".friendlistInfo", function() {
		
		$(this).find('.friendBtn').css("display","block")
	});
    
   

});