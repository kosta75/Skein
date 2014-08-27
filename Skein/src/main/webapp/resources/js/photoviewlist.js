////photo js

$(document).ready(function(){

	
	//사진 mouseover 배경 색상 변경
	$(document).on('mouseover', '.img-list', function(){
		$(this).css("background-color",$('.sub-user-profile-tip').css("background-color"));
	}).on('mouseout', '.img-list', function(){
		$(this).css("background-color","white");
	})
	
	/*스크롤 감지  */
	function lastPostFunc(pictureCount){
		$.ajax({
			type:'get',
			url:"moreviewlist",
			data:"pictureCount="+ pictureCount,
			dataType : "html",
			success : function(data) {
				console.log(data);
			
				if(data.trim()==""){
					
				}else{
					$('#boardlist-picture').append(data);
				}
			},
			error: function(){
				alert('스크롤 에러 :error while request..'   );
			}
		});
	} 
	         
	$(window).scroll(function(){
		
		if ($(window).scrollTop() == $(document).height() - $(window).height()){
			
			//alert("현재 사진 불러온 수 : "+ $('.list').size());
			var pictureCount = $('.list-item').size();
			lastPostFunc(pictureCount);
		}
	});
});