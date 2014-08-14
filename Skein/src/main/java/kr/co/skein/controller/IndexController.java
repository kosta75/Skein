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
import org.springframework.web.servlet.View;

@Controller
public class IndexController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonView ;

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
				System.out
						.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user="
								+ user);
			}
			BoardDao boardDao = sqlsession.getMapper(BoardDao.class);
			List<MemberBoardCommand> list = boardDao.getBoards(personalURI);
			
			List<List<MemberBoardCommand>> allList = new ArrayList<List<MemberBoardCommand>>();
			
			int groupStatus = -1;
			boolean isGrouped = false;
			List<MemberBoardCommand> l = null;
			
			for(int i=0;i<list.size();i++){
				if(!isGrouped){
					l = new ArrayList<MemberBoardCommand>();
					isGrouped = true;
				}
				
				int groupSeq = list.get(i).getGroupSeq();
				l.add(list.get(i));
				if(groupStatus != groupSeq){
				
				
				
				
					
				}
				groupStatus = groupSeq;
			}
			
			
			
			
			model.addAttribute("list", list);
			Member member = memberDao.getMemberInfo(user.getUsername());
			SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("MMdd");
			model.addAttribute("member", member);
			model.addAttribute("birthDay",
					SimpleDateFormat.format(member.getBirthday()));
			model.addAttribute("toDay", SimpleDateFormat.format(new Date()));

		}

		return "index";
	}

	@RequestMapping(value = { "/board/detailView" }, method = RequestMethod.POST)
	public View detailView(int boardSeq, Model model)
			throws ClassNotFoundException, SQLException {

		model.addAttribute("fullName", "서현덕");
		model.addAttribute("writeDate", "2222");
		model.addAttribute("content", "아아아아앙");

		return jsonView;
	}

}