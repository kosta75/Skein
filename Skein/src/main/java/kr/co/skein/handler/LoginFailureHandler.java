package kr.co.skein.handler;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.Member;
import kr.co.skein.util.PasswordEncryptor;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


public class LoginFailureHandler implements AuthenticationFailureHandler {
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private SqlSession sqlSession;
    public SqlSession getSqlSession() {return sqlSession;	}
	public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;	}
	
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth) throws IOException, ServletException {

		logger.error("로그인 실패");

		Map<String, String> param = new HashMap<String, String>();
		param.put("searchKey", "email");
		param.put("searchValue", request.getParameter("email"));
		MemberDao memberDao = (MemberDao) sqlSession.getMapper(MemberDao.class);
		
		//request.getSession().setAttribute("SPRING_SECURITY_LAST_EXCEPTION", auth.getMessage());
		
		try {
			List<Member> list = memberDao.getMembers(param);
			if(list.size() > 0){
				Member member = list.get(0); 
				String password = new PasswordEncryptor().getEncryptSource(request.getParameter("password"));
				
				if(member.getFailedPasswordAttemptCount() > 5){
					String remoteAddr = request.getRemoteAddr();
			        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
			        reCaptcha.setPrivateKey("6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, remoteAddr=" + remoteAddr);
			        
			        String challenge = request.getParameter("recaptcha_challenge_field");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, challenge=" + challenge);
			        String uresponse = request.getParameter("recaptcha_response_field");
			        System.out.println("INFO : Skein-K104 - 보안문자 정보, uresponse=" + uresponse);
			        

			        if (request.getParameter("recaptcha_challenge_field") != null && request.getParameter("recaptcha_response_field") != null) {
			        	ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
				        	if(reCaptchaResponse.isValid()){
				        	
				        	if(!member.getPassword().equals(password)){
								System.out.println("INFO: Skein-U423 - 비밀번호가 틀렸습니다.");
								System.out.println("INFO : Skein-U512 - failedPasswordAttemptCount=" + member.getFailedPasswordAttemptCount());
								
								
								member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
								memberDao.updateMemberAccount(member);
								request.setAttribute("LOGIN_ERROR_CODE", 52);
								request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
							}else{
								System.out.println(auth.getMessage());
								if(member.getIsApproved() != 1){
									System.out.println("INFO: Skein-U423 - 인증과정이 완료되지 않은 계정입니다.");
									request.setAttribute("personalURI", memberDao.getPersonalURI(request.getParameter("email")));
									request.setAttribute("LOGIN_ERROR_CODE", 53);
								}else{
									System.out.println("INFO: Skein-U423 - 알 수 없는 에러");
									request.setAttribute("LOGIN_ERROR_CODE", 99);
								}
							}
				        } else {
				        	request.setAttribute("LOGIN_ERROR_CODE", 88);
				        	request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
				        }
			        }else{
			        	if(!member.getPassword().equals(password)){
							System.out.println("INFO: Skein-U423 - 비밀번호가 틀렸습니다.");
							System.out.println("INFO : Skein-U512 - failedPasswordAttemptCount=" + member.getFailedPasswordAttemptCount());
							
							
							member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
							memberDao.updateMemberAccount(member);
							request.setAttribute("LOGIN_ERROR_CODE", 52);
							request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
						}else{
							System.out.println(auth.getMessage());
							if(member.getIsApproved() != 1){
								System.out.println("INFO: Skein-U423 - 인증과정이 완료되지 않은 계정입니다.");
								request.setAttribute("personalURI", memberDao.getPersonalURI(request.getParameter("email")));
								request.setAttribute("LOGIN_ERROR_CODE", 53);
							}else{
								System.out.println("INFO: Skein-U423 - 알 수 없는 에러");
								request.setAttribute("LOGIN_ERROR_CODE", 99);
							}
						}
			        }
				}else{
					if(!member.getPassword().equals(password)){
						System.out.println("INFO: Skein-U423 - 비밀번호가 틀렸습니다.");
						System.out.println("INFO : Skein-U512 - failedPasswordAttemptCount=" + member.getFailedPasswordAttemptCount());
						
						
						member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
						memberDao.updateMemberAccount(member);
						request.setAttribute("LOGIN_ERROR_CODE", 52);
						request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
					}else{
						System.out.println(auth.getMessage());
						if(member.getIsApproved() != 1){
							System.out.println("INFO: Skein-U423 - 인증과정이 완료되지 않은 계정입니다.");
							request.setAttribute("personalURI", memberDao.getPersonalURI(request.getParameter("email")));
							request.setAttribute("LOGIN_ERROR_CODE", 53);
						}else{
							System.out.println("INFO: Skein-U423 - 알 수 없는 에러");
							request.setAttribute("LOGIN_ERROR_CODE", 99);
						}
					}
				}
				
				
			}else{
				System.out.println("INFO: Skein-U423 - 존재하지 않는 아이디입니다.");
				request.setAttribute("LOGIN_ERROR_CODE", 51);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher ds = request.getRequestDispatcher("/joinus/login");
		ds.forward(request, response);
	}
}
