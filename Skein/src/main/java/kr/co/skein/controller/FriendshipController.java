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
		System.out.println("INFO : Skein-F002 - 친구 목록 불러오기," );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

		int	startNum = 1;
		int	endNum = 4;
		
		System.out.println("INFO : Skein-P101 - 서비스 접속 요청");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session
					.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication()
					.getPrincipal();

			FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);

			// 내 이메일 admin@skein.com
			// 친구 이메일
			String email = user.getUsername();
			List<FriendshipListCommand> list = friendshipDao.getFriendList(email, startNum, endNum);
			//List<List<MemberBoardCommand>> allList = new ArrayList<List<MemberBoardCommand>>();
			for(int i=0; i< list.size();i++){
				//System.out.println(list.get(i).getFriendEmail());
			}
			model.addAttribute("list", list);
			
			Member member = memberDao.getMemberInfo(user.getUsername());
			String colorTheme = memberDao.selectColorTheme(user.getUsername());
			SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("MMdd");
			if (colorTheme == null || colorTheme.equals("")) {
				model.addAttribute("colorTheme", "blue");
			} else {
				model.addAttribute("colorTheme", " " + colorTheme);
			}
			model.addAttribute("member", member);
			model.addAttribute("birthDay", SimpleDateFormat.format(member.getBirthday()));
			model.addAttribute("toDay", SimpleDateFormat.format(new Date()));
			
		}
		return "friendship.friendshipView";
	}
	
	//친구 추가 메서드
	@RequestMapping("/add")
	@Transactional
	public View addFriends(@RequestParam("email") String email, @RequestParam("notificationSeq") int notificationSeq, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F001 - 친구 추가, email=" + email );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "email");
		parameters.put("searchValue", email);
		
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
				
				
				FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
				
				FriendshipNotificationCommand friendshipNotificationCommand = notificationDao.getFriendshipNotificationByNotificationSeq(notificationSeq);
				System.out.println("INFO : Skein-F001 - 사용자 알림 정보 주입");
				friendshipNotificationCommand.setFriendshipConfirm(1);
				friendshipNotificationCommand.setIsRead(1);
				
				
				
				
				System.out.println("여기서 알림정보를 업데이트 해야된다");
				int friendshipRegResult = friendshipDao.addFriends(user.getUsername(), member.getEmail());
				int notificationRegResult = notificationDao.updateNotification(friendshipNotificationCommand);
				int friendshipNotificationRegResult = notificationDao.updateFriendshipNotification(friendshipNotificationCommand);
				
				
				System.out.println("INFO : Skein-F001 - 친구 등록 결과, friendshipRegResult=" + friendshipRegResult);
				System.out.println("INFO : Skein-F001 - 사용자 알림 수정 결과, notificationRegResult=" + notificationRegResult);
				System.out.println("INFO : Skein-F001 - 친구 알림 수정 결과, friendshipNotificationRegResult=" + friendshipNotificationRegResult);
				
			}
		}
		
		model.addAttribute("result", "true");
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	//친구 삭제 메서드
	@RequestMapping("/delete/{personalURI}")
	@Transactional
	public View deleteFriends(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F001 - 친구 삭제, personalURI=" + personalURI );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("searchKey", "personalURI");
			parameters.put("searchValue", personalURI);
			
			List<Member> list = memberDao.getMembers(parameters);
			if(list.size() > 0){
				Member member = list.get(0);
				System.out.println("INFO : Skein-F001 - 삭제하려는 친구 정보, email=" + member.getEmail());
				
				/*1	공지사항
				2	친구신청
				3	친구신청수락
				4	공유신청
				5	공유신청수락
				6	댓글*/
				
				FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
				NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
				List<FriendshipNotificationCommand> flist = notificationDao.getFriendshipNotificationByFriendEmail(baseMemberInfo.getEmail(), member.getEmail());
				for(int i=0;i<flist.size();i++){
					FriendshipNotificationCommand friendshipNotificationCommand = flist.get(i);
					String seq = friendshipNotificationCommand.getNotificationSeq();
					System.out.println("INFO : Skein-R342 - 조회한 알림 번호, seq=" + seq);
					
					int notificationDeleteResult = notificationDao.deleteNotification(Integer.valueOf(seq));
					System.out.println("INFO : Skein-F001 - 알림 삭제 결과, notificationDeleteResult=" + notificationDeleteResult);
				}
				
				
				
				int friendshipDeleteResult = friendshipDao.deleteFriendship(baseMemberInfo.getEmail(), member.getEmail());
				
				
				
				//int notificationDeleteResult = notificationDao.
				
				System.out.println("INFO : Skein-F001 - 친구 삭제 결과, friendshipRegResult=" + friendshipDeleteResult);
				
				model.addAttribute("result", "true");
				
			}else{
				model.addAttribute("result", "false");
			}
			
		}else{
			model.addAttribute("result", "false");	
		}	
		/*return "friendship.searchMembers";*/
		return jsonView;
	}

	//더보기 
	@RequestMapping("/moreviewlist")
	public String getFriendList(
			HttpSession session, Model model, @RequestParam("friendCount") int friendCount) throws ClassNotFoundException,
			SQLException {
		System.out.println("INFO : Skein-F003 - 친구 목록 더 불러오기," );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
	
		
			int startNum = friendCount +1 ;
			int endNum = startNum + 7;
		

		System.out.println("INFO : Skein-P101 - 서비스 접속 요청");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session
					.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication()
					.getPrincipal();

			FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);

			// 내 이메일 admin@skein.com
			// 친구 이메일
			String email = user.getUsername();
			List<FriendshipListCommand> list = friendshipDao.getFriendList(email, startNum, endNum);
			//List<List<MemberBoardCommand>> allList = new ArrayList<List<MemberBoardCommand>>();
			for(int i=0; i< list.size();i++){
				//System.out.println(list.get(i).getFriendEmail());
			}
			model.addAttribute("list", list);
			
		}
			return "friendship.morefriendlist";

	}
		
}
