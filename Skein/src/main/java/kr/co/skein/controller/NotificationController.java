package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.dao.ProfileDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberBoardCommand;
import kr.co.skein.model.vo.NotificationCountCommand;
import kr.co.skein.model.vo.notification.FriendshipNotification;
import kr.co.skein.model.vo.notification.MemberNotification;
import kr.co.skein.model.vo.notification.ReplyNotification;
import kr.co.skein.model.vo.notification.ShareNotification;
import kr.co.skein.model.vo.profile.MemberProfile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/notification/*")
public class NotificationController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	
	@RequestMapping(value = "/notificationCountList", method=RequestMethod.POST)
	public View getNotificationList(HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			List<NotificationCountCommand> list = notificationDao.getNotifications(baseMemberInfo.getEmail());
			//List<FriendshipNotificationCommand> friendshipNotificationCommands = notificationDao.getFriendshipNotification(baseMemberInfo.getEmail());
			//System.out.println("INFO : Skein-F100 - 알림 목록 읽기");
			
			//model.addAttribute("notificationList", friendshipNotificationCommands);
			model.addAttribute("notificationList", list);
		}
		return jsonView;
	}
	
	
	@RequestMapping(value = "/notificationGroupList", method=RequestMethod.POST)
	public View getNotificationGroupList(HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			List<NotificationCountCommand> list = notificationDao.getNotifications(baseMemberInfo.getEmail());
			//List<FriendshipNotificationCommand> friendshipNotificationCommands = notificationDao.getFriendshipNotification(baseMemberInfo.getEmail());
			//System.out.println("INFO : Skein-F100 - 알림 목록 읽기");
			
			//model.addAttribute("notificationList", friendshipNotificationCommands);
			model.addAttribute("notificationList", list);
		}
		return jsonView;
	}
	
	//알림 모두 읽음
	@RequestMapping(value="/notificationAllRead", method=RequestMethod.POST)
	public View setAllRead(Model model, HttpSession session) throws ClassNotFoundException, SQLException{
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			notificationDao.allNotificationRead(baseMemberInfo.getEmail());
		}
		return jsonView;
	}
	
	//알림 읽음
	@RequestMapping(value="/notificationRead", method=RequestMethod.POST)
	public View notificationRead(@RequestParam("notificationSeq") String notificationSeq, Model model, HttpSession session) throws ClassNotFoundException, SQLException{
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			notificationDao.readNotification(baseMemberInfo.getEmail(), notificationSeq);
			System.out.println("INFO : Skein-R221 - 알림 읽음 처리, notificationSeq=" + notificationSeq + ", email=" + baseMemberInfo.getEmail());
		}
		return jsonView;
	}
	
	
	
	//친구 신청 알림 추가 메서드
	@RequestMapping("/addFriendsNotification/{personalURI}")
	public View addFriendsNotification(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		List<Member> list = memberDao.getMembers(parameters);
		if(list.size() > 0){
			Member member = list.get(0);
			System.out.println("INFO : Skein-F001 - 친구 신청 알림 추가, 친구 신청을 받은 personalURI=" + personalURI );
			System.out.println("INFO : Skein-F001 - 친구 신청 정보, 친구 신청을 받은 email=" + member.getEmail());
			
			/*1	공지사항
			2	친구신청
			3	친구신청수락
			4	공유신청
			5	공유신청수락
			6	댓글*/
			
			BaseMemberInfo baseMemberInfo = null;
			if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
				//친구 신청을 한 사용자의 정보를 사용
				FriendshipNotificationCommand friendshipNotificationCommand = new FriendshipNotificationCommand();
				System.out.println("INFO : Skein-F001 - 사용자 알림 정보 주입");
				friendshipNotificationCommand.setEmail(member.getEmail());
				friendshipNotificationCommand.setFriendEmail(baseMemberInfo.getEmail());
				friendshipNotificationCommand.setNotificationCode(2);
				friendshipNotificationCommand.setFriendshipConfirm(0);
				friendshipNotificationCommand.setIsRead(0);
				
				NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
				int notificationRegResult = notificationDao.friendshipNotificationReg(friendshipNotificationCommand);
				System.out.println("INFO : Skein-F001 - 친구 알림 등록 결과, notificationRegResult=" + notificationRegResult);
				model.addAttribute("result", "true");
			}	
		}
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	//알림 정렬 하기 
	@RequestMapping(value ="/", method=RequestMethod.GET)
	public String viewNotificationListSort(HttpSession session, Model model) throws ClassNotFoundException, SQLException{	
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);

		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			List<MemberNotification> memberNotifications = notificationDao.getMemberNotificationList(baseMemberInfo.getEmail());
			model.addAttribute("notificationList", memberNotifications);
		}
		
		return "notification.notificationView";
	}
	
	@RequestMapping(value="/notificationDetailInfo", method=RequestMethod.POST)
	public View getNotificationDetailInfo(@RequestParam("notificationSeq") int notificationSeq, @RequestParam("notificationCode") int notificationCode, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			
			switch(notificationCode){
			case 1:
				break;
			case 2:
				
				FriendshipNotification friendshipNotification = notificationDao.getFriendshipNotificationDetail(notificationSeq);
				
				List<MemberProfile> memberProfiles = profileDao.getMemberProfileList(friendshipNotification.getFriendEmail(), "false");
				
				friendshipNotification.setMemberProfileList(memberProfiles);
				
				model.addAttribute("friendshipNotification", friendshipNotification);
				break;
			case 4:
				
				BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
				ShareNotification shareNotification = notificationDao.getShareNotificationDetail(notificationSeq);
				
				int boardSeq = Integer.valueOf(shareNotification.getBoardSeq());
				MemberBoardCommand memberBoardCommand = boardDao.getBoardByBoardSeq(boardSeq);
				
				String personalURI = "";
				if(shareNotification.getShareType() > 0){
					personalURI = memberDao.getPersonalURI(shareNotification.getEmail());
					//memberBoardCommand.setPersonalURI(personalURI);
				}else{
					personalURI = memberDao.getPersonalURI(shareNotification.getSenderEmail());
					//memberBoardCommand.setPersonalURI(personalURI);
				}
				
				
				String profileImageFileName = profileDao.getMemberProfileByProfileCode(personalURI, 2);
				
				shareNotification.setMemberBoardCommand(memberBoardCommand);
				shareNotification.setProfileImageFileName(profileImageFileName);
				
				model.addAttribute("shareNotification", shareNotification);
				break;
			case 6:
				ReplyNotification replyNotification = notificationDao.getReplyNotificationDetail(notificationSeq);
				
				
				
				model.addAttribute("replyNotification", replyNotification);
				break;
			}
			
			
		}

		return jsonView;
	}
	
}
