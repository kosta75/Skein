function getContextPath(){
	var offset = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(offset,location.href.indexOf('/',offset+1));
	return contextPath;
}//서비스 contextPath 얻기 end



$(document).ready(function(){
	
	$(document).on('submit','#memberJoinForm',function(e){
		e.preventDefault();
		//alert('aa');
		//do some verification
		$.ajax({
			type : 'POST',
			url: 'joinus/registerMember',
		    data: $(this).serialize(),
		    success: function(data){
		    	if(data != null){
		    		if(data.JOIN_MESSAGE != null){
		    			var obj = data.JOIN_MESSAGE;
		    			if(obj == 0){
		    				alert('회원 가입이 성공적으로 완료 되었습니다.');
		    				location.reload();
		    			}else if(obj == 1){
		    				alert('회원 가입에 실패했습니다.');
		    			}else if(obj == 2){
		    				alert('영구 정지된 계정으로 회원가입을 할 수 없습니다.');
		    			}else if(obj == 3){
		    				alert('이미 등록된 회원입니다.');
		    			}
		    		}
		    	}
		    //callback methods go right here
		    }
		});
	});
	
	
	
	
	
//*******************************************************첫 페이지 화면***********************************************************//	
//*******************************************************************************************************************************//
	 $(document).on('click','#login-tap p, #login-second-tap p',function(event){
		 tabDelete();
		
		 event.preventDefault();
		  $('#login-tap').animate({
			 width: '80%',
			 height:'474px',
			 opacity: '1',
			 
		 },1000);
		 $('#join-tap').animate({
			 width: '10%',
			 height:'474px',
			 opacity: '.25'
		 },1000); 	
		 $('#bottom-tap').animate({
			 both: 'clear',
			 opacity: '.25',
			 height: '70px'	
		 },1000); 
		 $('#login-tap').append(
				 '<div id="loginFormContainer">'+
				 '<div id="Sil">'+
					'<a href="${pageContext.request.contextPath}">Sil</a>'+
				'</div> '+
					'<form action="'+getContextPath()+'/security/login"	method="post">'+
						'<fieldset>'+
							'<legend><label for="email">이메일</label></legend>'+
							'<input type="text" id="email" name="email" />'+
						'</fieldset>'+
						'<fieldset>'+
							'<legend><label for="password">비밀번호</label></legend>'+
							'<input type="password" id="password" name="password" />'+
						'</fieldset>'+
						'<fieldset>'+
							'<input id="loginBtn" type="submit" value="Login" />'+
						'</fieldset>'+
						
					'</form>'+
					'<div>'+
						'<a href="'+getContextPath()+'/account/refind">계정찾기</a>'+
					'</div>'+
				'</div>' 
		 );
		
		 $('#join-tap').append(
				 '<div id="join-second-tap"><p class="side-p" style="margin-left: 85px;margin-top:16px">J<br>O<br>I<br>N</p></div>'
		 
		 );	
		 

		 $('#login-tap').css("background-image","url('./resources/media/image/join_login/back_1.jpg')");
		 $('#login-tap').css("background-repeat","no-repeat");
		 $('#login-tap').css("background-position-x","355px");
		 
		 //$('#join-tap').css("background-image","url('./resources/media/image/join_login/1.jpg')");
		 
	 });
	 
	$(document).on("click","#join-tap p, #join-second-tap p",function(event){
		 event.preventDefault();
		 tabDelete();
		 
		 $('#join-tap').animate({
			 width: '80%',
			opacity: '1',
			height: '474px'	
		 },1000);
		 $('#login-tap').animate({
			 width: '10%',
			 opacity: '.25',
			 height: '474px'	
		 },1000); 
		 $('#bottom-tap').animate({
			 both: 'clear',
			 opacity: '.25',
			 height: '70px'	
		 },1000); 
		 $('#join-tap').append(
					 '<div id="memberJoinFormContainer">'+
					 '<div class="join-message">'+
							'<span>Join</span>'+
						'</div>'+
						'<form id="memberJoinForm">	 '+
							'<fieldset>'+
								'<legend class="text-hidden">기본 계정 정보</legend>'+
								'<input type="email" id="email" name="email" placeholder="welcome@skein.com" required />'+
								'<input type="password" id="password" name="password" placeholder="**********" required />'+
							'</fieldset>'+
							
							'<fieldset>'+
								'<legend class="text-hidden">기본 사용자 정보</legend>'+
								'<input type="text" name="lastName" placeholder="성" required />'+
								'<input type="text" name="firstName" placeholder="이름" required />'+
							'</fieldset>'+
							
							'<fieldset>'+
								'<legend class="birthday">생년월일</legend>'+
								'<input type="date" id="birthday" name="birthday" required />'+
							'</fieldset>'+
							'<fieldset>'+
								'<input type="submit" id="joinBtn" value="가입하기">'+
							'</fieldset>'+
						'</form>'+
					'</div>'
		 );
		
		
		 $('#login-tap').append(
				 '<div id="login-second-tap"><p class="side-p">L<br>O<br>G<br>I<br>N</p></div>'
		 );	
		 
		 $('#login-tap').css("background-image","");
		 $('#join-tap').css("background-image","url('./resources/media/image/join_login/back_2.jpg')");
		 
		 $('#join-tap').css("background-repeat","no-repeat"); 
		
		
	 });
	
	$(document).on("click","#bottom-tap p",function(event){
			tabDelete();
		 $('#bottom-tap').animate({
			opacity: '1',
			height: '474px'
		 },1000);
		
		 $('#login-tap').animate({
				opacity: '0.25',
				height: '50px'
			 },1000);
		 
		 $('#join-tap').animate({
				opacity: '0.25',
				height: '50px'
			 },1000);
		 /*$(this).append(
				 '<div id="bottom-second-tap"><p class="bottom-main-p"><h1>CONTENT</h1></p></div>'
		 );	*/
		 $('#login-tap').append(
				 
				 '<div id="login-second-tap" class="bottom-main-p"><p>LOGIN</p></div>'
		 
		 );	
		 $('#join-tap').append(
				 
				 '<div id="join-second-tap"class="bottom-main-p"><p>JOIN</p></div>'
		 
		 );	
		 $('#join-tap').css("background-image","");
		 $('#login-tap').css("background-image","");
		 
		 $('#join-tap').css("background-color","white");
		 $('#login-tap').css("background-color","white");
		 
		 $('#bottom-tap').css("background-image","url('./resources/media/image/join_login/back_3.jpg')");
		 $('#bottom-tap').css("background-repeat","no-repeat");
		 $('#bottom-tap').css("background-position-x","300px");
		 $('#bottom-tap').css("background-position-y","100px");
		 $('#bottom-tap').css("top","no-repeat");
		
	 });
	
	function tabDelete(){
		 $('#loginFormContainer ').remove();
		 $('#memberJoinFormContainer ').remove();
		 $('#join-second-tap').remove();
		 $('#login-second-tap').remove();
		 $('#bottom-second-tap').remove();
		 $('.main-p').remove();
	}
	
	
	$(document).on("mouseover","#join-tap p, #login-tap p, #bottom-tap p, #refesh",function(event){
		 $(this).css("color","red");
		 $(this).css("opacity","1");
	});
	$(document).on("mouseout","#join-tap p, #login-tap p, #bottom-tap p, #refesh",function(event){
		 $(this).css("color","black");
		 //$(this).css("opacity","0.25");
	});
	
	
	
	$(document).on("click","#refresh",function(event){
		
	});
	/*
	$(document).on("oumseover","#join-tap p,#login-tap p, #bottom-tap p, #join-second-tap p,  #login-second-tap p",function(event){
		$(this).css("opacity","1");
	});
	$(document).on("mouseout","#bottom-tap p",function(event){
		$(this).css("opacity","0.25");
	});*/
	
	
	/*$(document).on("mouseover","#login-tap",function(event){
		$(this).css("opacity","1");
	});
	$(document).on("mouseout","#login-tap",function(event){
		$(this).css("opacity","0.25");
	});
	$(document).on("mouseover","#bottom-tap",function(event){
		$(this).css("opacity","1");
	});
	$(document).on("mouseout","#bottom-tap",function(event){
		$(this).css("opacity","0.25");
	});
	*/
	
	
});

