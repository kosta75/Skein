package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberBoardCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/photo/*")
public class PhotoController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "viewlist", method = RequestMethod.GET)
	public String picturetab(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-G120 - PhotoController");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		int startNum=1;
		int endNum=20;
		
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
				System.out
						.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI="
								+ personalURI);
			} else {
				personalURI = (String) session.getAttribute("PersonalURI");
				System.out
						.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user="
								+ user);
			}
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);

			List<MemberBoardCommand> list = boardDao.getBoardsPage(personalURI,
					startNum, endNum);
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
			model.addAttribute("member", member);
			model.addAttribute("birthDay",
					SimpleDateFormat.format(member.getBirthday()));
			model.addAttribute("toDay", SimpleDateFormat.format(new Date()));
		}
			System.out.println("photo.viewlist");
			return "photo.viewlist";
	
	}
	
	
	@RequestMapping(value = "moreviewlist", method = RequestMethod.GET)
	public String morepicturetab(HttpSession session, Model model, @RequestParam(value="pictureCount",required=false, defaultValue="0") int pictureCount) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-G120 - PhotoController");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			int startNum = pictureCount + 1;
			int endNum = startNum + 19;
		
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
				System.out
						.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI="
								+ personalURI);
			} else {
				personalURI = (String) session.getAttribute("PersonalURI");
				System.out
						.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user="
								+ user);
			}
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);

			List<MemberBoardCommand> list = boardDao.getBoardsPage(personalURI,
					startNum, endNum);
			List<List<MemberBoardCommand>> allList = new ArrayList<List<MemberBoardCommand>>();

			for(int i =0; i< list.size(); i++){
				System.out.println("ddd"+list.get(i).getEmail());
			}

			
			/*int groupStatus = -1;
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
			}*/
			model.addAttribute("list", list);
			Member member = memberDao.getMemberInfo(user.getUsername());
			String colorTheme = memberDao.selectColorTheme(user.getUsername());
			SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("MMdd");
			if (colorTheme == null || colorTheme.equals("")) {
				model.addAttribute("colorTheme", "blue");
			} else {
				model.addAttribute("colorTheme", colorTheme);
			}
			model.addAttribute("member", member);
			model.addAttribute("birthDay",
					SimpleDateFormat.format(member.getBirthday()));
			model.addAttribute("toDay", SimpleDateFormat.format(new Date()));
		}

			return "photo.morepicture";

	}
	
}
