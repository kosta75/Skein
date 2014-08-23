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
				alert('friendship  line 18 :Error while request..');
			}
		});
	});
	//**********************친구 목록 페이지 처리 ************************//
	/*스크롤 감지  */
    function lastPostFunc(friendCount){ 
    $.ajax({
          type:'get',
          url:"moreviewlist",
          data:"friendCount="+ friendCount,
          dataType : "html",
          success : function(data) {
        	  alert(data);
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
          alert('스크롤 감지');
         //alert("현재 사진 불러온 수 : "+ $('.list').size());
    	  
         var pictureCount = $('.list').size();
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
    
   /////////////////////색상변경//////////////////////////////////////////////////////////////////
	$('#changeBackgroundColor li').on('mouseover', function() {
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.sub-user-profile-tip').css("background-color",	$(this).css("background-color"));
		$('#menu2').css("background-color",	$(this).css("background-color"));
	});
	
	$('#changeBackgroundColor li').on('click', function() {
		var obj = $(this);
		var colorTheme = $(this).context.className;
		
		$.ajax({
			type : 'post',
			url : 'member/colorTheme',
			cache : false,
			data :'colorTheme='+ colorTheme,
			success : function(data) {
				alert("사용자 지정색상이 변경되었습니다!");
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.sub-user-profile-tip').css("background-color",	$(obj).css("background-color"));
				$('#menu2').css("background-color",	$(obj).css("background-color"));
				
				
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});
	////////////////////////////////////////////////////////////////////////////////////

});