////photo js

$(document).ready(function(){
	// /////////////색깔변경////////////////
	$('#changeBackgroundColor li').on('mouseover', function() {
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('.header-container').css("background-color",	$(this).css("background-color"));
		$('#leftinfo').css("background-color",	$(this).css("background-color"));
		$('#menu2').css("background-color",	$(this).css("background-color"));
	});
	
	$('#changeBackgroundColor li').on('click', function() {
		var obj = $(this);
		var colorTheme = $(this).context.className;
		
		$.ajax({
			type : 'post',
			url : '../member/colorTheme',
			cache : false,
			data :'colorTheme='+ colorTheme,
			success : function(data) {
				alert("사용자 지정색상이 변경되었습니다!");
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('.header-container').css("background-color",	$(obj).css("background-color"));
				$('#leftinfo').css("background-color",	$(obj).css("background-color"));
				$('#menu2').css("background-color",	$(obj).css("background-color"));
				
				/*$('.header-container').css("background-color", $(this).css(colorTheme));
				$('.header-container').css("background-color",$(this).css(colorTheme));
				$('#leftinfo').css("background-color",$(this).css(colorTheme));
				$('#menu2').css("background-color",$(this).css(colorTheme));*/
			},
			error : function() {
				alert('Error while request..');
			}
		});
	});
	// Bar 색상 변경 End /////////////////////////////////////////
	
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
				alert("ajax");
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
			alert('스크롤 감지');
			//alert("현재 사진 불러온 수 : "+ $('.list').size());
			var pictureCount = $('.list-item').size();
			lastPostFunc(pictureCount);
		}
	});
});