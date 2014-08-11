
$(document).ready(function () { 
	

    
    
    $('#alram').click(function(){
    
    	$('#sidecontent').after($('#alrampage').toggle("display"));
    	
    });
    
    
    
    
    $('#sidemenu1').click(function(){
		
    	
		$('#sidemenu1').append($('#mon').toggle("display"));
		
});


$('#sidemenu2').click(function(){
	
	
	
		$('#sidemenu2').after($('#mon').toggle("display"));
	
		

	
});
$('#sidemenu3').click(function(){
	
	


		$('#sidemenu3').after($('#mon').toggle("display"));
	
	
	
});
  
$("#modal-launcher,#modal-content, #modal-background").click(function() {
var boardSeq = $(this).find("input").val();
	
		if($(this).attr("id")=="modal-launcher"){
	$.ajax({
		type:'post',
		url:'post/getHistoryPost',
		cache: false,				
		data:
		

			'boardSeq=' + boardSeq,
		
	    success: function(data){ 
	      
	    	$("#modalfullName").html(data.post.fullName);
	    	$("#modalwriteDate").html(data.post.writeDate);
	    	$("#modalcontent").html(data.post.content);
	    	
	    	
	     },
		error: function(){						
			alert('Error while request..'	);
		}
	});
		}else{
			
		}
	$("#modal-content, #modal-background").toggleClass("active");

});

 	

 
 
});


