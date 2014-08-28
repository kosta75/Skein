package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.BoardCommand;
import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.NotificationAllCommand;
import kr.co.skein.model.vo.NotificationCommand;
import kr.co.skein.model.vo.NotificationCountCommand;

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
	
		
	//알림 페이지 첫 진입점
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String viewNotificationList(HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			List<NotificationAllCommand> list = notificationDao.getNotificationAllList(baseMemberInfo.getEmail());
			
			for(int i = 0; i < list.size(); i++){
				if(list.get(i).getNotificationCode() == 1){
					//공지사항
					//[공지사항] 새로운 업데이트가 있습니다.
				BoardDao boardDao =  sqlSession.getMapper(BoardDao.class);
				List<BoardCommand> addList =boardDao.getBoardsInfo(list.get(i).getBoardSeq());
					list.get(i).setContent(addList.get(i).getContent());
					
				}else if(list.get(i).getNotificationCode() == 2){
					//친구신청
					//[친구신청] 상대방아이디(이름??)  가   친구 신청을 하셧습니다.
				MemberDao memberdao = sqlSession.getMapper(MemberDao.class);	
				Member m =  memberdao.getMemberInfo(list.get(i).getFriendEmail());
				list.get(i).setFullName(m.getFullName());
				
				}else if(list.get(i).getNotificationCode() == 3){
					//친구신청수락
					//[친구신청수락] 상대방 아이디  가 친구 신청을 허락 하셧습니다.
					MemberDao memberdao = sqlSession.getMapper(MemberDao.class);	
					Member m =  memberdao.getMemberInfo(list.get(i).getFriendEmail());
					list.get(i).setFullName(m.getFullName());
					
				}else if(list.get(i).getNotificationCode() == 4){
					//공유신청
					//[공유신청] 상대방 아이디 공유신청을 하였습니다. 
					MemberDao memberdao = sqlSession.getMapper(MemberDao.class);	
					Member m =  memberdao.getMemberInfo(list.get(i).getFriendEmail());
					list.get(i).setFullName(m.getFullName());
					
				}else if(list.get(i).getNotificationCode() == 5){
					//공유신청수락
					//[공유신청수락] 상대방 아이디  공유신청을 수락 하셧습니다.
					MemberDao memberdao = sqlSession.getMapper(MemberDao.class);	
					Member m =  memberdao.getMemberInfo(list.get(i).getFriendEmail());
					list.get(i).setFullName(m.getFullName());
					
				}else if(list.get(i).getNotificationCode() == 6){
					//댓글
					//[댓글] 어떤 게시물에 누가  댓글을 달았습니다??
					//[댓글] 어떤 게시물에 댓글이 달렸습니다.??
				}else {
					//없음
					System.out.println("다른게 있을까??");
				}
			}
			model.addAttribute("notificationList", list);	
			System.out.println("INFO : Skein-E252 - 조회 요청 이메일 정보, email=" + baseMemberInfo.getEmail());
			System.out.println("INFO : Skein-F252 - 조회한 알림 게시물, size=" +  list.size());
		}
		return "notification.notificationView";
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
	
	
	
}
