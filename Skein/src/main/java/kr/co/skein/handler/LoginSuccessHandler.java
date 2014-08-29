package kr.co.skein.handler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.ProfileDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.Member;

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

    	logger.info("Login, user="+auth.getName()+",Authorities="+auth.getAuthorities().toString());

    	//권한이 부족할시 이동할 URL
    	//String url = request.getContextPath() + "/login?error=denied";
    	
    	try {
	    	HttpSession session = request.getSession();
	    	MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
	    	ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
	    	
	    	System.out.println("INFO : Skein-P103 - 로그인 후 첫 진입시 사용자 세션을 생성합니다.");
			BaseMemberInfo baseMemberInfo = new BaseMemberInfo();
			
			Map<String, String> param = new HashMap<String, String>();
			param.put("searchKey", "email");
			param.put("searchValue", auth.getName());
			
			List<Member> list = memberDao.getMembers(param);
			
			if(list.size() > 0){
				Member member = list.get(0);
				
				member.setLastLoginDate(Calendar.getInstance().getTime());
				member.setFailedPasswordAttemptCount(0);
				memberDao.updateMemberAccount(member);
				
				baseMemberInfo.setEmail(auth.getName());
				baseMemberInfo.setPersonalURI(member.getPersonalURI());
				baseMemberInfo.setBirthday(member.getBirthday());
				baseMemberInfo.setColorTheme(member.getColorTheme());
				if(member.getColorTheme() ==null){
					baseMemberInfo.setColorTheme("skyblue");
				}
				baseMemberInfo.setFullName(member.getFullName());
				baseMemberInfo.setLastName(member.getLastName());
				baseMemberInfo.setFirstName(member.getFirstName());
				
				
								
				session.setAttribute("BASE_MEMBER_INFO", baseMemberInfo);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

    	response.sendRedirect(request.getContextPath());
    }
}