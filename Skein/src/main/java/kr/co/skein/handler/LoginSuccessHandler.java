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
import kr.co.skein.util.PasswordEncryptor;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private SqlSession sqlSession;	
    public SqlSession getSqlSession() {return sqlSession;	}
	public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;}

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);

    	System.out.println("INFO : Skein-U202 - 로그인에 성공하였습니다.");
    	request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");

    	logger.info("Login, user="+auth.getName()+",Authorities="+auth.getAuthorities().toString());

    	//권한이 부족할시 이동할 URL
    	//String url = request.getContextPath() + "/login?error=denied";
    	
    	try {
    		
    		if(memberDao.hasMemberByEmail(request.getParameter("email")) > 0){
    			System.out.println("INFO : Skein-P103 - 로그인 후 첫 진입시 사용자 세션을 생성합니다.");
    			
    			HttpSession session = request.getSession();
    			BaseMemberInfo baseMemberInfo = new BaseMemberInfo();
    			
    			Map<String, String> param = new HashMap<String, String>();
    			param.put("searchKey", "email");
    			param.put("searchValue", auth.getName());
    			
    			List<Member> list = memberDao.getMembers(param);
    			Member member = list.get(0);
    			
    			if (request.getParameter("recaptcha_challenge_field") != null && request.getParameter("recaptcha_response_field") != null) {
					System.out.println("INFO : Skein - 비밀번호 5회이상 틀린 계정이므로 보안문자 확인");
    				String remoteAddr = request.getRemoteAddr();
			        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
			        
			        reCaptcha.setPrivateKey("6Ld6e_kSAAAAAIrC-VARWLSIDdnupUl6vxDiob8M");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, remoteAddr=" + remoteAddr);
			        
			        String challenge = request.getParameter("recaptcha_challenge_field");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, challenge=" + challenge);
			        
			        String uresponse = request.getParameter("recaptcha_response_field");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, uresponse=" + uresponse);
					
		        	ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
		        	if(reCaptchaResponse.isValid()){
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
						baseMemberInfo.setProfileImageFileName(profileDao.getMemberProfileByProfileCode(member.getPersonalURI(), 2));
		
						session.setAttribute("BASE_MEMBER_INFO", baseMemberInfo);
						
						response.sendRedirect(request.getContextPath());
		        	}else{
		        		String url = request.getContextPath() + "/joinus/login?recaptcha_error=1";
		        		response.sendRedirect(url);
		        	}
		        }else{
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
					baseMemberInfo.setProfileImageFileName(profileDao.getMemberProfileByProfileCode(member.getPersonalURI(), 2));
	
					session.setAttribute("BASE_MEMBER_INFO", baseMemberInfo);
					
					response.sendRedirect(request.getContextPath());
		        }
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
	}
}