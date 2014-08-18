package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.BoardDetailView;
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
import org.springframework.web.servlet.View;

@Controller
public class IndexController {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private View jsonView;

	@RequestMapping(value = { "/", "/index.skein" }, method = RequestMethod.GET)
	public String home(HttpSession session, Model model)
			throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);

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
				System.out.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user=" + user);
			}
			
			
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			List<MemberBoardCommand> listSource = boardDao.getBoards(personalURI);
			List<List<MemberBoardCommand>> groupList = new ArrayList<List<MemberBoardCommand>>();

			if(listSource.size() > 0){
				int groupStatus = listSource.get(0).getGroupSeq();
				int groupSeq = groupStatus;
				boolean isGrouped = false;
				List<MemberBoardCommand> list = null;

				for (int i = 0; i < listSource.size(); i++) {
					groupSeq = listSource.get(i).getGroupSeq();

					if (groupStatus != groupSeq) {
						groupList.add(list);
						groupStatus = groupSeq;
						isGrouped = false;
					}

					if (!isGrouped) {
						list = new ArrayList<MemberBoardCommand>();
						isGrouped = true;
						list.add(listSource.get(i));
					} else {
						list.add(listSource.get(i));
					}
				}
			}
			

			// model.addAttribute("list", list);allList
			model.addAttribute("groupList", groupList);

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

		return "index";
	}

	@RequestMapping(value = { "/board/detailView" }, method = RequestMethod.POST)
	public View detailView(int groupSeq, Model model)
			throws ClassNotFoundException, SQLException {
		
		BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
		
		List<BoardDetailView> boardDetailView = boardDao.getBoardDetail(groupSeq);
		
		model.addAttribute("detailView",boardDetailView);
	     
		
		
		return jsonView;
	}

	@RequestMapping(value = {"/member/colorTheme" }, method = RequestMethod.POST)
	public View the(String colorTheme, Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-I101 - 사용자 지정색상 정보 입력, colorTheme=" + colorTheme);

		SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
		UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();

		String email = user.getUsername();
		memberDao.updateColorTheme(colorTheme, email);
		/* String color=memberDao.selectColorTheme(user.getUsername()); */
		model.addAttribute("colorTheme", colorTheme);

		return jsonView;
	}

	@RequestMapping(value = { "/info/mapInfo" }, method = RequestMethod.GET)
	public View mapInfo(@RequestParam("xPos") int xPos,
			@RequestParam("yPos") int yPos, Model model) {

		System.out
				.println("INFO : Skein-I684 - xPos=" + xPos + ",yPos=" + yPos);
		model.addAttribute("result", "test");
		return jsonView;
	}

}
