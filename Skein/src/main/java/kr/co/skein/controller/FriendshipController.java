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
				
				
				FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
				NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
				
				int friendshipRegResult = friendshipDao.addFriends(user.getUsername(), member.getEmail());
				int notificationRegResult = notificationDao.friendshipNotificationReg(friendshipNotificationCommand);
				
				System.out.println("INFO : Skein-F001 - 친구 등록 결과, friendshipRegResult=" + friendshipRegResult);
				System.out.println("INFO : Skein-F001 - 친구 알림 등록 결과, notificationRegResult=" + notificationRegResult);				
			}
		}
		
		model.addAttribute("result", "true");
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	@RequestMapping("/delete/{personalURI}")
	public View deleteFriends(@PathVariable String personalURI, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("INFO : Skein-F001 - 친구 추가, personalURI=" + personalURI );
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		List<Member> list = memberDao.getMembers(parameters);
		if(list.size() > 0){
			Member member = list.get(0);
			System.out.println("INFO : Skein-F001 - 삭제하려는 계정 정보, email=" + member.getEmail());
			
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
				int friendshipRegResult = friendshipDao.deleteFriendship(user.getUsername(), member.getEmail());
				System.out.println("INFO : Skein-F001 - 친구 등록 결과, friendshipRegResult=" + friendshipRegResult);				
			}
		}
		
		model.addAttribute("result", "true");
		
		/*return "friendship.searchMembers";*/
		return jsonView;
	}
	
	
	
	//친구 목록 조회
	//@RequestMapping(value = "/viewlist", method = RequestMethod.GET)
		@RequestMapping("/viewlist")
		public String getFriendList(
				HttpSession session, Model model, @RequestParam("friendCount") int friendCount) throws ClassNotFoundException,
				SQLException {
			System.out.println("INFO : Skein-F002 - 친구 목록 불러오기," );
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			
			int startNum;
			int endNum;
			if(friendCount > 0 ){
				startNum = friendCount +1 ;
				endNum = startNum + 7;
			}else{
				startNum = 1;
				endNum = 8;
			}

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
				String email = "admin@skein.com";
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
			
			if(startNum > 1){
				return "friendship.morefriendlist";
			}else{
				return "friendship.viewlist";
			}
			
		}
}
