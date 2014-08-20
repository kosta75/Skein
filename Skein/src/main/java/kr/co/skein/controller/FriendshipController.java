package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.NotificationCommand;
import kr.co.skein.model.vo.SearchMemberCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/friendship/*")
public class FriendshipController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	@RequestMapping("/add/{personalURI}")
	@Transactional
	public View addFriends(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F001 - 친구 추가, personalURI=" + personalURI );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		List<Member> list = memberDao.getMembers(parameters);
		if(list.size() > 0){
			Member member = list.get(0);
			System.out.println("INFO : Skein-F001 - 추가하려는 계정 정보, email=" + member.getEmail());
			
			/*1	공지사항
			2	친구신청
			3	친구신청수락
			4	공유신청
			5	공유신청수락
			6	댓글
			7	공지사항*/
			
			if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
				SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
				UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
				
				FriendshipNotificationCommand command = new FriendshipNotificationCommand();
				System.out.println("INFO : Skein-F001 - 사용자 알림 정보 주입");
				command.setEmail(user.getUsername());
				command.setFriendEmail(member.getEmail());
				command.setNotificationCode(2);
				command.setFriendshipConfirm(0);
				command.setIsRead(0);
				
				FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
				NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
				
				int notificationSeq = notificationDao.getNotificationMaxSequence();
				int friendshipNotificationSeq = notificationDao.getFriendshipNotificationMaxSequence();
				
				
				int res1 = friendshipDao.addFriends(user.getUsername(), member.getEmail());
				System.out.println("INFO : Skein-F001 - 친구 등록 결과, res1=" + res1);
				
				command.setNotificationSeq(notificationSeq);
				int res2 = notificationDao.notificationReg(command);
				System.out.println("INFO : Skein-F001 - 사용자 알림 등록 결과, res2=" + res2);
				command.setNotificationSeq(notificationSeq);
				command.setFriendshipNotificationSeq(friendshipNotificationSeq);
				
				
				int res3 = notificationDao.friendshipNotificationReg(command);
				System.out.println("INFO : Skein-F001 - 친구 알림 등록 결과, res3=" + res3);
				
				
				
			}
			
			
			
			//친구 추가
			//알림 생성
		}
		
		model.addAttribute("result", "true");
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	//사용자 검색은 search/members , search/friends 두가지로
	@RequestMapping(value="/search/members", method=RequestMethod.GET)
	public String searchMembers() throws ClassNotFoundException, SQLException{
		return "friendship.searchMembers";
	}
	
	
	@RequestMapping(value="/search/members", method=RequestMethod.POST)
	public String searchMembers(@RequestParam("fullName") String fullName, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-M006 - 사용자 검색 요청, fullName=" + fullName);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchNameValue", fullName);
		
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			String userName = user.getUsername();
			
			parameters.put("ignoreEmailValue", userName);
		}
			
		
		
		List<SearchMemberCommand> list = memberDao.searchMembers(parameters);
		System.out.println("INFO : Skein-M006 - 검색 결과, " + list.size());
		
		model.addAttribute("list", list);
		
		return "friendship.searchMembers";
	}
}