package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.ProfileDao;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberProfileCommand;
import kr.co.skein.model.vo.ProfileCommand;
import kr.co.skein.model.vo.SearchMemberCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;

	//사용자 프로필 조회
	@RequestMapping("/{personalURI}")
	public String userProfile(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청");
		
		
		
		
		if(!personalURI.endsWith("/")){
			System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청 정보, personalURI=" + personalURI);
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("searchKey", "personalURI");
			parameters.put("searchValue", personalURI);
			
			List<Member> members = memberDao.getMembers(parameters);
			List<ProfileCommand> profiles = profileDao.getMemberProfiles(personalURI);
			
			
			
			
			if(members.size() > 0){
				System.out.println("INFO : Skein-M526 - 사용자 기본 정보 및 상세 프로필 조회");
				Member member = members.get(0);
				MemberProfileCommand mpc = new MemberProfileCommand();
				
				mpc.setLastName(member.getLastName());
				mpc.setFirstName(member.getFirstName());
				mpc.setFullName(member.getFullName());
				mpc.setBirthday(member.getBirthday());
				mpc.setProfiles(profiles);
				
				model.addAttribute("email", member.getEmail());
				model.addAttribute("memberProfile", mpc);
				model.addAttribute("requestPersonalURI", personalURI);

				return "profile.profileView"; 

			}else{
				System.out.println("INFO : Skein-U516 - 요청된 URI의 사용자가 존재하지 않습니다.");
				return "error.notFound";
			}			
		}else{
			System.out.println("INFO : Skein-M014 - 잘못된 URI 요청");
			return "error.incorrectRequest";
		}
	}

}
