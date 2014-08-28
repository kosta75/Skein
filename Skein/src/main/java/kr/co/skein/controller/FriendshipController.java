package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.FriendshipListCommand;
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
	
	//친구 페이지 첫 진입점
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String getFriendList(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-F002 - 친구 목록 페이지" );
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
				
		//친구 목록 페이징 처리 기본 값
		int	startNum = 1;
		int	endNum = 8;
		
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		List<FriendshipListCommand> friendshipList = friendshipDao.getFriendList(baseMemberInfo.getEmail(), startNum, endNum);

		model.addAttribute("friendshipList", friendshipList);
		return "friendship.friendshipView";
	}
	
	//수정 필요한 사항
	//더보기 
	@RequestMapping("/moreviewlist")
	public String getFriendList(HttpSession session, Model model, @RequestParam("friendCount") int friendCount) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-F003 - 친구 목록 더 불러오기," );
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		
		//친구 더 불러오기 기본 값
		int startNum = friendCount +1 ;
		int endNum = startNum + 7;
		
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);

		List<FriendshipListCommand> list = friendshipDao.getFriendList(baseMemberInfo.getEmail(), startNum, endNum);
		model.addAttribute("list", list);
		return "friendship.morefriendlist";
	}
	
	//친구 추가 메서드
	@RequestMapping("/add")
	@Transactional
	public View addFriends(@RequestParam("personalURI") String personalURI, @RequestParam("notificationSeq") int notificationSeq, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F234 - 친구 추가 요청");
		
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		
		if(memberDao.hasMemberByPersonalURI(personalURI) > 0){
			String email = memberDao.getEmailByPersonalURI(personalURI);
			System.out.println("INFO : Skein-F001 - 추가하려는 친구 정보, personalURI=" + personalURI + ",email=" + email);
			int friendshipRegResult = friendshipDao.addFriends(baseMemberInfo.getEmail(), email);
			
			System.out.println("INFO : Skein-N001 - 사용자 알림 정보 수정");
			FriendshipNotificationCommand friendshipNotificationCommand = notificationDao.getFriendshipNotificationByNotificationSeq(notificationSeq);
			friendshipNotificationCommand.setFriendshipConfirm(1);
			friendshipNotificationCommand.setIsRead(1);
			
			int notificationRegResult = notificationDao.updateNotification(friendshipNotificationCommand);
			int friendshipNotificationRegResult = notificationDao.updateFriendshipNotification(friendshipNotificationCommand);
						
			System.out.println("INFO : Skein-F001 - 친구 등록 결과, friendshipRegResult=" + friendshipRegResult);
			System.out.println("INFO : Skein-F001 - 사용자 알림 수정 결과, notificationRegResult=" + notificationRegResult);
			System.out.println("INFO : Skein-F001 - 친구 알림 수정 결과, friendshipNotificationRegResult=" + friendshipNotificationRegResult);
			
			model.addAttribute("result", "true");
		}else{
			model.addAttribute("result", "false");
		}
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	//친구 삭제 메서드
	@RequestMapping("/delete/{personalURI}")
	@Transactional
	public View deleteFriends(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F234 - 친구 삭제 요청");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		
		if(memberDao.hasMemberByPersonalURI(personalURI) > 0){
			String email = memberDao.getEmailByPersonalURI(personalURI);
			System.out.println("INFO : Skein-F001 - 삭제하려는 친구 정보, personalURI=" + personalURI + ",email=" + email);
			
			int friendshipDeleteResult = friendshipDao.deleteFriendship(baseMemberInfo.getEmail(), email);
			System.out.println("INFO : Skein-F001 - 친구 삭제 결과, friendshipRegResult=" + friendshipDeleteResult);
			
			List<FriendshipNotificationCommand> flist = notificationDao.getFriendshipNotificationBoth(baseMemberInfo.getEmail(), email);
			for(int i=0;i<flist.size();i++){
				FriendshipNotificationCommand friendshipNotificationCommand = flist.get(i);
				String notificationSeq = friendshipNotificationCommand.getNotificationSeq();
				System.out.println("INFO : Skein-R342 - 조회한 알림 번호, notificationSeq=" + notificationSeq);
				
				int notificationDeleteResult = notificationDao.deleteNotification(Integer.valueOf(notificationSeq));
				System.out.println("INFO : Skein-F001 - 알림 삭제 결과, notificationDeleteResult=" + notificationDeleteResult);
			}
			model.addAttribute("result", "true");
		}else{
			model.addAttribute("result", "false");
		}
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
}
