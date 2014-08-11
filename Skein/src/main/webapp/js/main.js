
$(document).ready(function () { 
	  
    $('#editbtn').click(function () {    
    	   alert('수정 페이지 출력');     
    	    });
    	    
    	 
    	    $('#reply').click(function () {    
    	    if( $('#commentcontent').val() ==''){
    	       	alert('댓글을 입력해주세요');
    	       	
    	       	$('#commentcontent').focus();
    	    }
    	    
    	    else{
    	    	 $('.commentlist').before("<tr id='writer' style='background-color:#e9eaed;margin-top: 2px;'><td ><img src='img/20100107221109605_2R2EJLGPV_raw.jpg' width='50px;' height='50px;' style=' border-radius:100px;'></td><td style='width: 120px;'>서현덕<br>2014/07/28</td><td >"+$('#commentcontent').val()+"</td><td id='editreply' style='float: right;margin-right: 10px;color:#7F6C62;'><a href='' >수정&nbsp;</a>||<a href=''>&nbsp;삭제</a></td></tr>");
    			   
    	    	 $('#commentcontent').val('');}
    	 
    	    	
    	    
    	    });
    	    
    	    
    	    
    	    
    	    
    	    $('#submit').click(function(){
    	    	if($('input[name="year"]').is(":checked")&&$('input[name="season"]').is(":checked")){
    	       	 
    	       	 alert('날짜나 계절중 하나만 선택해 주세요');
    	       	 
    	       	 
    	        }
    	    	
    	    	
    	    });
    	    
    	    $('#writememnu1').click(function(){
    	    	/*document.getElementById('fileupload').click();*/
    	    	
    	    	
    	    	
    	    	  $('#fileupload').toggle("display");
    	    	
    	    });
    	    
    	    
    	    $('#writememnu2').click(function(){
    	    
    	    	$('#year').toggle("display");
    	   
    	    	
    	    });
    	    
    	    $('#writememnu4').click(function(){
    	    	$('#emoticon').toggle("display");
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
    	    
    	$('#more').click(function(){
    	    	
    	    	$('#contentlist').append($('#contentlist2').toggle("display"));
    	    	
    	    	
    	    });
    	    
    	    $('#searchinput').click(function(){
    	    	
    	    	 $('#searchinput').val('');
    	    	
    	    });


   
 
 
 
 
 
});



