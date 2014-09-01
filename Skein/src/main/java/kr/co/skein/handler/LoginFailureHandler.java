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
import org.springframework.http.HttpRequest;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	private SqlSession sqlSession;
    public SqlSession getSqlSession() {return sqlSession;	}
	public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;	}
	
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth) throws IOException, ServletException {
		MemberDao memberDao = (MemberDao) sqlSession.getMapper(MemberDao.class);
		int errorCode = 0;

		try {
			if(memberDao.hasMemberByEmail(request.getParameter("email")) > 0){
				//서비스 상에 존재하는 회원의 이메일 입력
				
				Map<String, String> param = new HashMap<String, String>();
				param.put("searchKey", "email");
				param.put("searchValue", request.getParameter("email"));
				
				List<Member> list = memberDao.getMembers(param);
				Member member = list.get(0);

				String password = new PasswordEncryptor().getEncryptSource(request.getParameter("password"));
				int failedPasswordAttempCount = member.getFailedPasswordAttemptCount();
				
				int isApproved = member.getIsApproved();
				int isDomranted = member.getIsDomranted();
				int isDropedOut = member.getIsDropedOut();
				int isLockedOut = member.getIsLockedOut();
				
				if(isLockedOut > 0){
					//폐쇄된 계정에 대한 로그인 시도로 인한 로그인 실패
					errorCode = 50;
					String url = "/joinus/login";
					
					request.setAttribute("LOGIN_ERROR_CODE", errorCode);
					forward(request, response, url);
				}else if(isDropedOut > 0){
					//탈퇴된 계정에 대한 로그인 시도로 인한 로그인 실패
					errorCode = 99; //없는 계정 - 존재하지 않는 이메일
					String url = "/joinus/login";
					
					request.setAttribute("LOGIN_ERROR_CODE", errorCode);
					forward(request, response, url);
				}else if(isDomranted > 0){
					//휴면 처리된 계정에 대한 로그인 시도
			        
					if (request.getParameter("recaptcha_challenge_field") != null && request.getParameter("recaptcha_response_field") != null) {
			        	//비밀번호 5회 이상 틀림 또는 보안문자 틀림으로 인해 보안문자 조합을 더한 로그인 시도 
			        	if(checkReCaptch(request, response)){
			        		if(!member.getPassword().equals(password)){
								//비밀번호 틀림
								member.setFailedPasswordAttemptCount(failedPasswordAttempCount + 1);
								memberDao.updateMemberAccount(member);
								
								errorCode = 10;
								String url = "/joinus/login";
								
								if(member.getFailedPasswordAttemptCount() > 5){
									//비밀번호 5회 이상 틀림
									request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
								}
								
								request.setAttribute("LOGIN_ERROR_CODE", errorCode);
								forward(request, response, url);
								
								
							}else{
								//비밀번호는 맞지만 휴면 계정이므로 인증 필요
								errorCode = 60;
								String url = "/joinus/login";
								
								request.setAttribute("LOGIN_ERROR_CODE", errorCode);
								forward(request, response, url);
							}
			        	}else{
			        		//보안 문자 틀림
			        		errorCode = 11;
							String url = "/joinus/login";
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
			        	}
			        }else{
			        	if(!member.getPassword().equals(password)){
							//비밀번호 틀림
							member.setFailedPasswordAttemptCount(failedPasswordAttempCount + 1);
							memberDao.updateMemberAccount(member);
							
							errorCode = 10;
							String url = "/joinus/login";
							
							if(member.getFailedPasswordAttemptCount() > 5){
								//비밀번호 5회 이상 틀림
								request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
							}
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
							
							
						}else{
							//비밀번호는 맞지만 휴면 계정이므로 인증 필요
							errorCode = 60;
							String url = "/joinus/login";
							
							request.setAttribute("personalURI", member.getPersonalURI());
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
						}
			        }

				}else if(isApproved > 0){
			        if (request.getParameter("recaptcha_challenge_field") != null && request.getParameter("recaptcha_response_field") != null) {
			        	//비밀번호 5회 이상 틀림 또는 보안문자 틀림으로 인해 보안문자 조합을 더한 로그인 시도
			        	if(checkReCaptch(request, response)){
			        		//비밀번호 틀림
							member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
							memberDao.updateMemberAccount(member);
							
							errorCode = 10;
							String url = "/joinus/login";
							
							if(member.getFailedPasswordAttemptCount() > 5){
								//비밀번호 5회 이상 틀림
								request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
							}
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
			        	}else{
			        		//보안 문자 틀림
			        		errorCode = 11;
							String url = "/joinus/login";
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
			        	}
			        }else{
			        	//비밀번호 틀림
						member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
						memberDao.updateMemberAccount(member);
						
						errorCode = 10;
						String url = "/joinus/login";
						
						if(member.getFailedPasswordAttemptCount() > 5){
							//비밀번호 5회 이상 틀림
							request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
						}
						
						request.setAttribute("LOGIN_ERROR_CODE", errorCode);
						forward(request, response, url);
			        }

				}else if(isApproved == 0){
					 if (request.getParameter("recaptcha_challenge_field") != null && request.getParameter("recaptcha_response_field") != null) {
						//비밀번호 5회 이상 틀림 또는 보안문자 틀림으로 인해 보안문자 조합을 더한 로그인 시도
				        if(checkReCaptch(request, response)){
				        	if(!member.getPassword().equals(password)){
								
								//비밀번호 틀림
								member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
								memberDao.updateMemberAccount(member);
								
								errorCode = 10;
								String url = "/joinus/login";
								
								if(member.getFailedPasswordAttemptCount() > 5){
									//비밀번호 5회 이상 틀림
									request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
								}
								
								request.setAttribute("LOGIN_ERROR_CODE", errorCode);
								forward(request, response, url);
								
							}else{
								//비밀번호는 맞지만 미 인증 계정이므로 인증 필요
								errorCode = 20;
								String url = "/joinus/login";
								
								request.setAttribute("LOGIN_ERROR_CODE", errorCode);
								forward(request, response, url);
							}
			        	}else{
			        		//보안 문자 틀림
			        		errorCode = 11;
							String url = "/joinus/login";
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
			        	}
					 }else{
						 if(!member.getPassword().equals(password)){
							
							//비밀번호 틀림
							member.setFailedPasswordAttemptCount(member.getFailedPasswordAttemptCount() + 1);
							memberDao.updateMemberAccount(member);
							
							errorCode = 10;
							String url = "/joinus/login";
							
							if(member.getFailedPasswordAttemptCount() > 5){
								//비밀번호 5회 이상 틀림
								request.setAttribute("failedPasswordAttempCount", member.getFailedPasswordAttemptCount());
							}
							
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
							
						}else{
							//비밀번호는 맞지만 미 인증 계정이므로 인증 필요
							errorCode = 20;
							String url = "/joinus/login";
							
							request.setAttribute("personalURI", member.getPersonalURI());
							request.setAttribute("LOGIN_ERROR_CODE", errorCode);
							forward(request, response, url);
						}
					 }

				}

			}else{
				//서비스 상에 존재하지 않는 회원의 이메일 입력
				errorCode = 99;
				String url = "/joinus/login";
				
				request.setAttribute("LOGIN_ERROR_CODE", errorCode);
				forward(request, response, url);
			}
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException{
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
	
	public boolean checkReCaptch(HttpServletRequest request, HttpServletResponse response){
		String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        
        String privateKey = "6Ld6e_kSAAAAAIrC-VARWLSIDdnupUl6vxDiob8Mj";
        
        reCaptcha.setPrivateKey(privateKey);
        System.out.println("INFO : Skein-K104 - 보안문자 정보, remoteAddr=" + remoteAddr);
        
        String challenge = request.getParameter("recaptcha_challenge_field");
        System.out.println("INFO : Skein-K104 - 보안문자 정보, challenge=" + challenge);
        
        String uresponse = request.getParameter("recaptcha_response_field");
        System.out.println("INFO : Skein-K104 - 보안문자 정보, uresponse=" + uresponse);
    	
    	ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
		
		return reCaptchaResponse.isValid();
	}
	
}
