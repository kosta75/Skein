$(document).ready(function(){
	
	//친구 관계 삭제 버튼
	$(document).on('mouseleave', ".friend-item-container", function(){
	    $(this).find('.unfriend-button').css("display","none")
	}).on('mouseover', ".friend-item-container", function() {
		$(this).find('.unfriend-button').css("display","block")
	});
   
   $(document).on('click', '.unfriend-button', function(){
	 var result = confirm('친구 관계를 끊습니다. (' + $(this).data('name') + ')\n다시 한번 확인해주세요.' );
	 if(result){
		 var uri = $(this).data('uri')
		 var obj = $(this).parents('.friend-item-container');
		 $.ajax({
				type : 'post',
				url : 'delete/' + uri,
				cache : false,
				success : function(data) {
					if(data.result.trim() == 'true'){
						obj.remove();
					}
				},
				error : function() {
					alert('Error while request..');
				}
			});
	 }
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
			var pictureCount = $('.friend-item-container').size();
			console.log(pictureCount);
			lastPostFunc(pictureCount);
		}
	});

});