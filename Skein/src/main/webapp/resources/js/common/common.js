// 로그인/비로그인 상태에서 적용될 자바스크립트

//서비스 contextPath 얻기 start
function getContextPath(){
	var offset = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(offset,location.href.indexOf('/',offset+1));
	return contextPath;
}//서비스 contextPath 얻기 end