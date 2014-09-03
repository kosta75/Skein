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
import kr.co.skein.model.dao.ReplyDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.BoardDetailView;
import kr.co.skein.model.vo.BoardGroup;
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
import org.springframework.web.bind.annotation.RequestMethod;
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

			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
			List<ProfileCommand> profiles = null;
			
			if(memberDao.hasMemberByPersonalURI(personalURI) > 0){
				System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청 정보, personalURI=" + personalURI);
				String accessPersonalURI = personalURI;
				
				if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
					System.out.println("INFO : Skein-M231 - 로그인된 사용자입니다.");
					BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
					
					//로그인한 사용자인지 검증
					if(baseMemberInfo.getPersonalURI().equals(accessPersonalURI)){
						System.out.println("INFO : Skein-M560 - 사용자 본인의 프로필을 조회합니다.");
						
						profiles = profileDao.getMemberProfiles(baseMemberInfo.getEmail());						
						
						
						
						model.addAttribute("memberProfile", profiles);			
						model.addAttribute("PROFILE_RESPONSE_CODE", 99);
						return "profile.profileView"; 					
					}else{
						System.out.println("INFO : Skein-M560 - 타인의 프로필 페이지를 조회합니다.");
						
						String email = memberDao.getEmailByPersonalURI(personalURI);
						int isFriend = friendshipDao.isFriend(email, baseMemberInfo.getEmail());
						
						//프로필 페이지에서 보여줄 게시물의 페이징 처리 기본 값
						int startNum = 1;
						int endNum = 2;
						
						Map<String, String> param = new HashMap<String, String>();
						param.put("startNum", ""+startNum);
						param.put("endNum", ""+endNum);
						param.put("email", email);
						param.put("personalURI", personalURI);
						
						if(isFriend > 1){
							param.put("isFriend", "true");
						}else{
							param.put("isFriend", "false");
						}

						List<BoardGroup> listSource = boardDao.getMemberBoardGroup(param);
						System.out.println("INFO : Skein-R123 - 조회된 게시물, size=" + listSource.size());
						ReplyDao replydao = sqlSession.getMapper(ReplyDao.class);
						int replyStartNum=1;
						int replyEndNum=5;
						int replyCountNum =0;
						for(int i=0;i<listSource.size();i++){
							listSource.get(i).setReplyList(replydao.selectReply(listSource.get(i).getBoardSeq(),replyStartNum,replyEndNum));
							listSource.get(i).setReplyCount(replydao.countReply(replyCountNum,listSource.get(i).getBoardSeq()));
						
						
						}
						
						BaseMemberInfo publicMember = memberDao.getPublicMember(email);
						System.out.println("프로필파일 네임"+publicMember.getProfileInfo());
						if(publicMember.getProfileInfo() == null || publicMember.getProfileInfo().trim().equals("")){
							publicMember.setProfileInfo("default-profile-image.png");
						}
						
						model.addAttribute("boardGroupList", listSource);
						model.addAttribute("requestPersonalURI", personalURI);
						model.addAttribute("publicMember", publicMember);
						model.addAttribute("PROFILE_RESPONSE_CODE", 10);
						return "profile.publicProfileView";
					}
				}else{
					System.out.println("INFO : Skein-M560 - 비로그인한 사용자가 사용자의 프로필 페이지를 조회합니다.");
					//로그인한 사용자가 아니면 특정 정보만 보여주기
					String email = memberDao.getEmailByPersonalURI(personalURI);
					
					
					int startNum = 1;
					int endNum = 2;
					
					Map<String, String> param = new HashMap<String, String>();
					param.put("startNum", ""+startNum);
					param.put("endNum", ""+endNum);
					param.put("email", email);
					param.put("personalURI", personalURI);

					List<BoardGroup> list = boardDao.getMemberBoardGroup(param);
					System.out.println("INFO : Skein-R123 - 조회된 게시물, size=" + list.size());
					
					BaseMemberInfo publicMember = memberDao.getPublicMember(email);
					if(publicMember.getProfileImageFileName() == null || publicMember.getProfileImageFileName().trim().equals("")){
						publicMember.setProfileImageFileName("default-profile-image.png");
					}
					
					model.addAttribute("boardGroupList", list);
					model.addAttribute("requestPersonalURI", personalURI);
					model.addAttribute("publicMember", publicMember);
					model.addAttribute("PROFILE_RESPONSE_CODE", 20);
					return "profile.publicProfileView";
				}
			}else{
				System.out.println("INFO : Skein-U516 - 요청된 URI의 사용자가 존재하지 않습니다.");
				return "error.notFound";
			}							
		}else{
			System.out.println("INFO : Skein-M014 - 잘못된 URI 요청");
			return "error.incorrectRequest";
		}
	}
	
	@RequestMapping(value="moreMemberBoard",method=RequestMethod.GET)
	public String userMoreProfile(String personalURI,int pictureCount, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println(personalURI);
		if(!personalURI.endsWith("/")){

			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
			List<ProfileCommand> profiles = null;
			
			if(memberDao.hasMemberByPersonalURI(personalURI) > 0){
				System.out.println("INFO : Skein-M006 - 사용자 프로필 조회 요청 정보, personalURI=" + personalURI);
				String accessPersonalURI = personalURI;
				
				if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
					System.out.println("INFO : Skein-M231 - 로그인된 사용자입니다.");
					BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
					
					//로그인한 사용자인지 검증
					if(baseMemberInfo.getPersonalURI().equals(accessPersonalURI)){
						System.out.println("INFO : Skein-M560 - 사용자 본인의 프로필을 조회합니다.");
						
						profiles = profileDao.getMemberProfiles(baseMemberInfo.getEmail());						
						model.addAttribute("memberProfile", profiles);						
						model.addAttribute("PROFILE_RESPONSE_CODE", 99);
						return "moreprofileboard"; 					
					}else{
						System.out.println("INFO : Skein-M560 - 타인의 프로필 페이지를 조회합니다.");
						
						String email = memberDao.getEmailByPersonalURI(personalURI);
						int isFriend = friendshipDao.isFriend(email, baseMemberInfo.getEmail());
						
						//프로필 페이지에서 보여줄 게시물의 페이징 처리 기본 값
						int startNum = pictureCount+1;
			            int endNum = startNum+1;
			            int replyStartNum=1;
						int replyEndNum=5;
						int replyCountNum =0;
						
						Map<String, String> param = new HashMap<String, String>();
						param.put("startNum", ""+startNum);
						param.put("endNum", ""+endNum);
						param.put("email", email);
						param.put("personalURI", personalURI);
						
						if(isFriend > 1){
							param.put("isFriend", "true");
						}else{
							param.put("isFriend", "false");
						}

						List<BoardGroup> listSource = boardDao.getMemberBoardGroup(param);
						System.out.println("INFO : Skein-R123 - 조회된 게시물, size=" + listSource.size());
						ReplyDao replydao = sqlSession.getMapper(ReplyDao.class);
						 startNum = pictureCount+1;
			             endNum = startNum+1;
			             replyStartNum=1;
						 replyEndNum=5;
						 replyCountNum =0;
						for(int i=0;i<listSource.size();i++){
							listSource.get(i).setReplyList(replydao.selectReply(listSource.get(i).getBoardSeq(),replyStartNum,replyEndNum));
							listSource.get(i).setReplyCount(replydao.countReply(replyCountNum,listSource.get(i).getBoardSeq()));
							
						
						}
					
						BaseMemberInfo publicMember = memberDao.getPublicMember(email);
						if(publicMember.getProfileImageFileName() == null || publicMember.getProfileImageFileName().trim().equals("")){
							publicMember.setProfileImageFileName("default-profile-image.png");
						}
						
						model.addAttribute("boardGroupList", listSource);
						model.addAttribute("requestPersonalURI", personalURI);
						model.addAttribute("publicMember", publicMember);
						model.addAttribute("PROFILE_RESPONSE_CODE", 10);
						return "moreprofileboard";
					}
				}else{
					System.out.println("INFO : Skein-M560 - 비로그인한 사용자가 사용자의 프로필 페이지를 조회합니다.");
					//로그인한 사용자가 아니면 특정 정보만 보여주기
					String email = memberDao.getEmailByPersonalURI(personalURI);
					
					int startNum = pictureCount+1;
					int endNum = startNum+1;
					
					
					Map<String, String> param = new HashMap<String, String>();
					param.put("startNum", ""+startNum);
					param.put("endNum", ""+endNum);
					param.put("email", email);
					param.put("personalURI", personalURI);

					List<BoardGroup> list = boardDao.getMemberBoardGroup(param);
					System.out.println("INFO : Skein-R123 - 조회된 게시물, size=" + list.size());
					
					BaseMemberInfo publicMember = memberDao.getPublicMember(email);
					if(publicMember.getProfileImageFileName() == null || publicMember.getProfileImageFileName().trim().equals("")){
						publicMember.setProfileImageFileName("default-profile-image.png");
					}
					
					model.addAttribute("boardGroupList", list);
					model.addAttribute("requestPersonalURI", personalURI);
					model.addAttribute("publicMember", publicMember);
					model.addAttribute("PROFILE_RESPONSE_CODE", 20);
					return "moreprofileboard";
				}
			}else{
				System.out.println("INFO : Skein-U516 - 요청된 URI의 사용자가 존재하지 않습니다.");
				return "error.notFound";
			}							
		}else{
			System.out.println("INFO : Skein-M014 - 잘못된 URI 요청");
			return "error.incorrectRequest";
		}
	}
	
	
	
	
	
		//게시물 상세보기
		@RequestMapping(value ="/profileDetailView", method = RequestMethod.POST)
		public View detailView(int groupSeq, Model model)	throws ClassNotFoundException, SQLException {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<BoardDetailView> boardDetailView = boardDao.getBoardDetail(groupSeq);
			model.addAttribute("detailView",boardDetailView);
			
			return jsonView;
		}
	
	
	
	
	
}
