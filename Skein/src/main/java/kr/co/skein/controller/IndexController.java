package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.vo.BoardDetailView;
import kr.co.skein.model.vo.BoardGroup;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberBoardCommand;
import kr.co.skein.model.vo.NotificationCountCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class IndexController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private View jsonView;

	@RequestMapping(value = { "/", "/index.skein" }, method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

		System.out.println("INFO : Skein-P101 - 서비스 접속 요청이 들어왔습니다.");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인된 사용자 정보를 정의합니다.");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			String personalURI = "";
			if (session.getAttribute("PersonalURI") == null) {
				System.out.println("INFO : Skein-P103 - 로그인 후 첫 진입시 사용자 세션을 생성합니다.");
				personalURI = memberDao.getPersonalURI(user.getUsername());
				session.setAttribute("PersonalURI", personalURI);
				System.out.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI="	+ personalURI);
			} else {
				personalURI = (String) session.getAttribute("PersonalURI");
				System.out.println("INFO : Skein-I101 - 이미 생성된 사용자 세션이 있습니다. user=" + user);
			}
			
			int startNum = 1;
			int endNum = 2;
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<BoardGroup> listSource = boardDao.getBoardGroup(user.getUsername(),startNum,endNum);
			System.out.println("INFO : Skein-I101 - 사용자 게시물 조회 결과, groupListSize=" + listSource.size());
			
			model.addAttribute("groupList", listSource);

			Member member = memberDao.getMemberInfo(user.getUsername());
			String colorTheme = memberDao.selectColorTheme(user.getUsername());

			SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("MMdd");
			if (colorTheme == null || colorTheme.equals("")) {
				model.addAttribute("colorTheme", "blue");
			} else {
				model.addAttribute("colorTheme", colorTheme);
			}
			
			NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
			List<NotificationCountCommand> notificationList = notificationDao.getNotifications(user.getUsername());

			model.addAttribute("member", member);
			model.addAttribute("birthDay", SimpleDateFormat.format(member.getBirthday()));
			model.addAttribute("toDay", SimpleDateFormat.format(new Date()));
			model.addAttribute("notificationList", notificationList);
		}
		return "index";
	}
	//메인 더보기 
	@RequestMapping(value = { "/mainMoreBoard" }, method = RequestMethod.GET)
	public String mainMoreBoard(HttpSession session, Model model,@RequestParam("pictureCount") int pictureCount) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

		System.out.println("INFO : Skein-P101 - 서비스 접속 요청이 들어왔습니다.");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인된 사용자 정보를 정의합니다.");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			String personalURI = "";
			if (session.getAttribute("PersonalURI") == null) {
				System.out.println("INFO : Skein-P103 - 로그인 후 첫 진입시 사용자 세션을 생성합니다.");
				personalURI = memberDao.getPersonalURI(user.getUsername());
				session.setAttribute("PersonalURI", personalURI);
				System.out.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI="	+ personalURI);
			} else {
				personalURI = (String) session.getAttribute("PersonalURI");
				System.out.println("INFO : Skein-I101 - 이미 생성된 사용자 세션이 있습니다. user=" + user);
			}
			
			System.out.println("현재 게시물갯수"+pictureCount);
            int startNum = pictureCount+1;
            int endNum = startNum+5;
            System.out.println("시작 넘 :"+startNum+ "종료값"+endNum);
            
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<BoardGroup> listSource = boardDao.getBoardGroup(user.getUsername(),startNum,endNum);
			System.out.println("INFO : Skein-I101 - 사용자 게시물 조회 결과, groupListSize=" + listSource.size());
			
			model.addAttribute("groupList", listSource);
		}
		return "more-board";
	}
	@RequestMapping(value ="/member/colorTheme", method = RequestMethod.POST)
	public View the(String colorTheme, Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-I101 - 사용자 지정색상 정보 입력, colorTheme=" + colorTheme);

		SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();

		String email = user.getUsername();
		memberDao.updateColorTheme(colorTheme, email);
		/* String color=memberDao.selectColorTheme(user.getUsername()); */
		model.addAttribute("colorTheme", colorTheme);

		return jsonView;
	}

	@RequestMapping(value ="/info/mapInfo", method = RequestMethod.GET)
	public View mapInfo(@RequestParam("xPos") int xPos,
			@RequestParam("yPos") int yPos, Model model) {

		System.out
				.println("INFO : Skein-I684 - xPos=" + xPos + ",yPos=" + yPos);
		model.addAttribute("result", "test");
		return jsonView;
	}
	


    @RequestMapping(value = { "/time" }, method = RequestMethod.GET)
    public String picturetab(HttpSession session, Model model,@RequestParam("pictureCount") int pictureCount)
          throws ClassNotFoundException, SQLException {
       MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
       int startNum ;
       int endNum;
       if(pictureCount>0){
    	   	startNum = pictureCount+1;
            endNum = startNum+20;
       }else{
    	   //////////////////////////////////   
            startNum = 1;
            endNum = 20;
           
           //////////////////////////////
    	   
       }
       System.out.println("사진보기 클릭 들어옴!!");
       
       System.out.println("INFO : Skein-P101 - 서비스 접속 요청");
       if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
          System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
          SecurityContextImpl sci = (SecurityContextImpl) session
                .getAttribute("SPRING_SECURITY_CONTEXT");
          UserDetails user = (UserDetails) sci.getAuthentication()
                .getPrincipal();
          String personalURI = "";
          if (session.getAttribute("PersonalURI") == null) {
             System.out.println("INFO : Skein-P103 - 사용자 진입 요청에 관한 처리");
             personalURI = memberDao.getPersonalURI(user.getUsername());
             session.setAttribute("PersonalURI", personalURI);
             System.out.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI="+ personalURI);
          } else {
             personalURI = (String) session.getAttribute("PersonalURI");
             System.out.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user="+ user);
          }
          BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
       
          List<MemberBoardCommand> list = boardDao.getBoardsPage(personalURI, startNum, endNum);
          List<List<MemberBoardCommand>> allList = new ArrayList<List<MemberBoardCommand>>();

          int groupStatus = -1;
          boolean isGrouped = false;
          List<MemberBoardCommand> l = null;
          for (int i = 0; i < list.size(); i++) {
             if (!isGrouped) {
                l = new ArrayList<MemberBoardCommand>();
                isGrouped = true;
             }
             int groupSeq = list.get(i).getGroupSeq();
             l.add(list.get(i));
             if (groupStatus != groupSeq) {
                //
             }
             groupStatus = groupSeq;
          }
          model.addAttribute("list", list);
          Member member = memberDao.getMemberInfo(user.getUsername());
          String colorTheme = memberDao.selectColorTheme(user.getUsername());
          SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("MMdd");
          if (colorTheme == null || colorTheme.equals("")) {
             model.addAttribute("colorTheme", "blue");
          } else {
             model.addAttribute("colorTheme", colorTheme);
          }
          model.addAttribute("member",member);
          model.addAttribute("birthDay",
                SimpleDateFormat.format(member.getBirthday()));
          model.addAttribute("toDay", SimpleDateFormat.format(new Date()));
       }
       if(startNum>1){
    	   return "morepicture"; 
       }else{
    	   return "time";
       }
     
    }
    

    
    
	   

}
