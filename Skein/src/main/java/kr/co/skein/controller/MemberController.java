package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.ProfileDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberBoardCommand;
import kr.co.skein.model.vo.MemberProfileCommand;
import kr.co.skein.model.vo.ProfileCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		if(!personalURI.endsWith("/")){
			//로그인한 사용자인지 검증
			BaseMemberInfo baseMemberInfo = null;
			String accessPersonalURI = "";
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
			
			
			if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
				accessPersonalURI = baseMemberInfo.getPersonalURI();
				
				//프로필 페이지 주인과 접속한 사용자가 일치하는지 검증
				if(accessPersonalURI.equals(personalURI)){
					//주인이면 프로필 페이지로
					
					System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청");
					
					System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청 정보, personalURI=" + personalURI);
					Map<String, String> parameters = new HashMap<String, String>();
					parameters.put("searchKey", "personalURI");
					parameters.put("searchValue", personalURI);
					
					List<Member> members = memberDao.getMembers(parameters);
					List<ProfileCommand> profiles = profileDao.getMemberProfiles(members.get(0).getEmail());
					
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
						model.addAttribute("PROFILE_RESPONSE_CODE", 99);
						return "profile.profileView"; 

					}else{
						System.out.println("INFO : Skein-U516 - 요청된 URI의 사용자가 존재하지 않습니다.");
						return "error.notFound";
					}	
				}else{
					//로그인은 했는데 주인이 아니면 게시물 보여주기! 하지만 이때는 공개 레벨을 잘 관리할 것!
					//친구이면 친구 게시물 공개
					//친구 아니면 공개된 게시물만 공개
					String email = memberDao.getEmailByPersonalURI(personalURI);
					System.out.println("INFO : Skein-G124 - email=" + email);
					int isFriend = friendshipDao.isFriend(email, baseMemberInfo.getEmail());
					
					Map<String, String> param = new HashMap<String, String>();
					param.put("personalURI", personalURI);
					if(isFriend > 0){
						param.put("isFriend", "true");
					}
					
					List<MemberBoardCommand> list = boardDao.getMemberBoards(param);
					
					model.addAttribute("boardGroupList", list);
					model.addAttribute("PROFILE_RESPONSE_CODE", 10);
					return "profile.publicProfile";
				}
			}else{
				//로그인한 사용자가 아니면 특정 정보만 보여주기
				model.addAttribute("PROFILE_RESPONSE_CODE", 20);
				return "profile.publicProfile";
			}	
		}else{
			System.out.println("INFO : Skein-M014 - 잘못된 URI 요청");
			return "error.incorrectRequest";
		}
	}

}
