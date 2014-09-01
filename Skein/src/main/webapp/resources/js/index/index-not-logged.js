$(document).ready(function(){
	
	$('#memberJoinForm').submit(function(e){
		e.preventDefault();
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
		    				alert('회원 가입이 성공적으로 완료 되었습니다. \n가입하실 때 등록한 메일 계정으로 보낸 인증 메일을 확인해 주세요');
		    				location.reload();
		    			}else if(obj == 1){
		    				alert('회원 가입에 실패했습니다.');
		    			}else if(obj == 2){
		    				alert('이미 등록된 회원입니다.');
		    			}else if(obj == 3){
		    				alert('영구 정지된 계정으로 회원가입을 할 수 없습니다.');
		    			}
		    		}
		    	}
		    //callback methods go right here
		    }
		});
	});
	

});
