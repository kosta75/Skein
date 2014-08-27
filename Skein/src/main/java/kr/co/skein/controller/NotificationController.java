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
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/notification/*")
public class NotificationController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	//알림 페이지 첫 진입점
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String viewNotificationList() throws ClassNotFoundException, SQLException{
		
		
		
		
		
		
		return "notification.notificationView";
	}

	//친구 신청 알림 추가 메서드
	@RequestMapping("/addFriendsNotification/{personalURI}")
	public View addFriendsNotification(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
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
			6	댓글*/
			
			if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
				SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
				UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
				
				FriendshipNotificationCommand friendshipNotificationCommand = new FriendshipNotificationCommand();
				System.out.println("INFO : Skein-F001 - 사용자 알림 정보 주입");
				friendshipNotificationCommand.setEmail(user.getUsername());
				friendshipNotificationCommand.setFriendEmail(member.getEmail());
				friendshipNotificationCommand.setNotificationCode(2);
				friendshipNotificationCommand.setFriendshipConfirm(0);
				friendshipNotificationCommand.setIsRead(0);
				
				
				//FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
				NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
				
				//int friendshipRegResult = friendshipDao.addFriends(user.getUsername(), member.getEmail());
				int notificationRegResult = notificationDao.friendshipNotificationReg(friendshipNotificationCommand);
				
				//System.out.println("INFO : Skein-F001 - 친구 등록 결과, friendshipRegResult=" + friendshipRegResult);
				System.out.println("INFO : Skein-F001 - 친구 알림 등록 결과, notificationRegResult=" + notificationRegResult);				
			}
		}
		
		model.addAttribute("result", "true");
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	
	
	
	
	
}
