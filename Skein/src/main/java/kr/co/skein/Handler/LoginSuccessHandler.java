package kr.co.skein.Handler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private SqlSession sqlSession;	
    public SqlSession getSqlSession() {return sqlSession;	}
	public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;}

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
    	System.out.println("INFO : Skein-U202 - 로그인에 성공하였습니다.");
    	request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");

    	//권한이 없으면 해당 실패핸들러작동
    	logger.info("Login, user="+auth.getName()+",Authorities="+auth.getAuthorities().toString());
    	//logger.info(auth.getDetails().toString());
    	//logger.info(auth.getPrincipal().toString());

    	//권한이 부족할시 이동할 URL
    	String url = request.getContextPath() + "/login?error=denied";
    	
    	
    	HttpSession session = request.getSession();
    	MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
    	String personalURI = "";
    	//사용자 고유 주소 설정을 위한 세션 생성
    	if(session.getAttribute("PersonalURI") == null){
			System.out.println("INFO : Skein-P103 - 사용자 진입 요청에 관한 처리");
			
			try {
				personalURI = memberDao.getPersonalURI(auth.getName());
				session.setAttribute("PersonalURI", personalURI);
				System.out.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI=" + personalURI);	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user=" + auth.getName());
		}
		//return "redirect:/";
    	//권한 확인 후 해당 URL 지정
    	/*for(GrantedAuthority a : auth.getAuthorities()){
    		//logger.info(a.getAuthority());
    		if(a.getAuthority().equals("MASTER") || 
        			a.getAuthority().equals("CENTER") || 
        			a.getAuthority().equals("TEACHER") || 
        			a.getAuthority().equals("MANAGER")){
    			url = request.getContextPath() + "/employeeLogin"; //직원 로그인
    			break;
    		}else if(a.getAuthority().equals("STUDENT")){
    			url = request.getContextPath() + "/studentLogin"; //학생 로그인
    		}
    	}*/
    	
    	
    	
    	//url = request.getContextPath() + "/joinus/login";
    	response.sendRedirect(request.getContextPath());
    }
}