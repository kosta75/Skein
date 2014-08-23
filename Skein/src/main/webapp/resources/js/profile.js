$(document).ready(function() {
	lheight = $(".content_inner:FIRST-CHILD").css("height");
	rheight = $(".content_inner:LAST-CHILD").css("height");

	if(rheight >lheight){
		$(".content_inner:FIRST-CHILD").css("height", rheight);
		$(".informbox_content").css("height", rheight);
	}else{
		$(".content_inner:LAST-CHILD").css("height", lheight);
		$(".informbox_content").css("height", lheight);
	}

	
	
	
});

