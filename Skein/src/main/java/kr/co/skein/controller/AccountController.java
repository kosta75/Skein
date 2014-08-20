package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import kr.co.skein.model.dao.AccountDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.AuthorityCommand;
import kr.co.skein.model.vo.Member;
import kr.co.skein.util.PasswordEncryptor;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/{personalURI}/account/certification/mailsend")
	public String sendCertificationText(@PathVariable String personalURI) throws ClassNotFoundException, SQLException{
		System.out.println("INFO: Skein-U142 - 계정 인증 메일을 보냅니다. personalURI=" + personalURI);
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		//1. 기존 사용자의 계정인증문자 얻기
		List<Member> list = memberDao.getMembers(parameters);
		Member member = null;
		if(list.size() > 0){
			member = list.get(0);
		}
		
		//2. CertificationText(계정인증문자) 생성
		//--------------------------------------------------------------------------------->>>>>>> 수정해야 할 부분
		String certificationText = "a2b7a8c9d3c9a0f2b7d";
		member.setCertificationText(certificationText);
		System.out.println("INFO : Skein-P007 - 계정인증코드 생성 및 주입, certificationText=" + member.getCertificationText());
		
		//3. 수정 내용 반영
		memberDao.updateMemberAccount(member);
		
		return "account.certificationSend";
	}
	
	@RequestMapping("/{personalURI}/account/certification/check/{certificationText}")
	public String memberCertification(@PathVariable String personalURI,@PathVariable String certificationText, Model model) throws ClassNotFoundException, SQLException{
		
		/*
		 * certificationResult
		 * 1 : 계정 등록 승인
		 * 2 : 계정 휴면 해제 승인 
		 * 3 : 계정 재등록 승인
		 * 11 : 이미 승인된 계정
		 * 88 : 폐쇄된 계정 인증 요청 
		 * 90 : 잘못된 인증 요청
		 * 99 : 인증 실패 
		 */
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-P009 - 계정인증요청, personalURI="+ personalURI + ",certificationText=" + certificationText);
		System.out.println("INFO : Skein-P010 - 계정인증처리 시작");
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		
		List<Member> members = memberDao.getMembers(parameters);
		if(members.size() > 0){
			
			System.out.println("INFO : Skein-U008 - 계정 인증");
			Member member = members.get(0);
			if(member.getIsLockedOut() != 1){
				System.out.println("INFO : Skein-P010 - 계정폐쇄여부, isLockedOut=" + member.getIsLockedOut());
				if(member.getIsDropedOut() != 1){
					System.out.println("INFO : Skein-P012 - 계정탈퇴여부, isDropedOut=" + member.getIsDropedOut());
					if(member.getIsDomranted() !=1){
						System.out.println("INFO : Skein-P016 - 계정휴면여부, isDropedOut=" + member.getIsDropedOut());
						if(member.getIsApproved() !=1){
							System.out.println("INFO : Skein-P016 - 계정승인여부, isApproved=" + member.getIsApproved());
							if(certificationText.equals(member.getCertificationText())){
								System.out.println("INFO : Skein-P017 - 신규 계정 인증 확인");
								member.setIsApproved(1);
								memberDao.updateMemberAccount(member);
								memberDao.createMemberAuthority(new AuthorityCommand("ROLE_USER", member.getEmail()));
								
								System.out.println("INFO : Skein-U019 - 계정 인증이 정상적으로 처리 되었습니다.");
								model.addAttribute("certificationResult", 1); //certificationResult : 1, 계정 등록 승인
								return "account.certificationResult";
							}else{
								model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
								return "error.incorrectCertification";
							}
						}else{
							System.out.println("INFO : Skein-P016 - 계정승인여부, isApproved=" + member.getIsApproved());
							System.out.println("INFO : Skein-U019 - 이미 승인된 계정입니다.");
							model.addAttribute("certificationResult", 11); //certificationResult : 11, 이미 승인된 계정 
							return "account.certificationResult";
						}
					}else{
						System.out.println("INFO : Skein-P016 - 계정휴면여부, isDropedOut=" + member.getIsDropedOut());
						if(certificationText.equals(member.getCertificationText())){
							System.out.println("INFO : Skein-P017 - 계정 휴면 해제 인증 확인");
							System.out.println("INFO : Skein-P018 - 계정 휴면 해제 처리");
							member.setIsDomranted(0);
							member.setIsApproved(1);
							memberDao.updateMemberAccount(member);
							
							model.addAttribute("certificationResult", 2); //certificationResult : 2, 계정 휴면 해제 승인 
							return "profile.accountSetting";
						}else{
							model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
							model.addAttribute("member", member);
							return "error.incorrectCertification";
						}
					}
				}else{
					System.out.println("INFO : Skein-P012 - 계정탈퇴여부, isDropedOut=" + member.getIsDropedOut());
					System.out.println("INFO : Skein-P013 - 계정 재등록 인증 처리");
					if(certificationText.equals(member.getCertificationText())){
						System.out.println("INFO : Skein-P014 - 계정 재등록 인증 확인");
						System.out.println("INFO : Skein-U008 - 이전 데이터 복원을 위해 경로를 이동합니다.");
						
						model.addAttribute("certificationResult", 3); //certificationResult : 3, 계정 재등록 승인
						model.addAttribute("member", member);
						return "post.restoreProcess";
						/*member.setIsDropedOut(0);
						member.setIsDomranted(0);
						member.setIsApproved(1);*/
					}else{
						model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
						model.addAttribute("member", member);
						return "error.incorrectCertification";
					}
				}
			}else{
				System.out.println("INFO : Skein-P010 - 계정폐쇄여부, isLockedOut=" + member.getIsLockedOut());
				System.out.println("INFO : Skein-U008 - 폐쇄된 계정에 대한 인증 요청입니다.");
				System.out.println("INFO : Skein-P011 - 계정인증처리 종료");
				
				model.addAttribute("certificationResult", 88); //certificationResult : 99, 폐쇄된 계정 인증 요청
				return "error.incorrectCertification";
			}
			
		}else{
			System.out.println("INFO : Skein-U008 - 올바르지 않은 인증 요청입니다.");
			model.addAttribute("certificationResult", 90); //certificationResult : 90, 잘못된 인증 요청
			return "error.incorrectCertification";
		}
	}
	@RequestMapping("/joinus/refind")
	public String help(){
		
		return "account.help_id";
	}
	@RequestMapping("/joinus/id")
	public String helpId(Member member, Model model) throws ClassNotFoundException, SQLException{
		AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
		List<String> emails = accountDao.getAccountEmails(member);
		if(emails.size()==0){
			model.addAttribute("noResult", "y");
		}
		
		//***처리
		for(String email : emails){
			String result = email.substring(0,3);
			email.indexOf("@");
		}
		
		model.addAttribute("emails", emails);
		return "account.help_id";
	}
	@RequestMapping("/joinus/pwd")
	public String helpPwd(Member member, Model model) throws ClassNotFoundException, SQLException{
		AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
		String email = accountDao.getAccountEmail(member);
		
		if(email==null){
			System.out.println(email);
			model.addAttribute("noResultPwd", "y");
		}
		model.addAttribute("email", email);
		return "account.help_id";
	}
	
	
	@RequestMapping("/joinus/pwdUpdate")
	public String helpPwdUpdate(Member member, Model model) throws Exception{
		AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
		
		//임의문자열
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();

		String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
				.split(",");

		for (int i = 0; i < 8; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		String password = buffer.toString();
		
		emailSender.SendEmail("univcss@gmail.com", member.getEmail(),
				"[Sil] 임시 비밀번호!", password + "<br>비밀번호를 바로 변경하시기 바랍니다.");
		member.setPassword(new PasswordEncryptor().getEncryptSource(password));

		int result = accountDao.updateAccountPassword(member);
		if (result > 0) {
			model.addAttribute("result", "success");
		}
		return "account.help_id";
	}
	
}
