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
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.dao.ReplyDao;
import kr.co.skein.model.vo.BoardDetailView;
import kr.co.skein.model.vo.BoardGroup;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.MemberBoardCommand;
import kr.co.skein.model.vo.NotificationCountCommand;
import kr.co.skein.model.vo.Reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

	//메인 페이지 첫 진입점
	@RequestMapping(value = { "/", "/index.skein" }, method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-P101 - 서비스 접속 요청");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = null;
			if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
				//페이징 처리를 위한 기본 값
				int startNum = 1;
				int endNum = 2;
				int replyStartNum=1;
				int replyEndNum=5;
				int replyCountNum =0;
				BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
				
				//그룹별로 글을 조회하되 각 그룹의 가장 최신글 1개만 그룹으로 조회한다.
				List<BoardGroup> listSource = boardDao.getPartOfBoardGroup(baseMemberInfo.getEmail(),startNum,endNum);
			    			
			    //답글은 각각의 글의 답글을 조회해서 리스트로 담아준다.
				ReplyDao replydao = sqlSession.getMapper(ReplyDao.class);
				for(int i=0;i<listSource.size();i++){
					listSource.get(i).setReplyList(replydao.selectReply(listSource.get(i).getBoardSeq(),replyStartNum,replyEndNum));
					listSource.get(i).setReplyCount(replydao.countReply(replyCountNum,listSource.get(i).getBoardSeq()));
					if(listSource.get(i).getReplyList().get(i).getProfileinfo() == null || listSource.get(i).getReplyList().get(i).getProfileinfo() == " " ){
						listSource.get(i).getReplyList().get(i).setProfileinfo("default-profile-image.png");
						}
					
					System.out.println(listSource.get(i).getBoardSeq());
					
					System.out.println("publicLevelCode"+listSource.get(i).getPublicLevelCode());
				}
				
				System.out.println("INFO : Skein-I101 - 사용자 게시물 조회 결과, groupListSize=" + listSource.size());
				model.addAttribute("groupList", listSource);
			}
		}
		return "index";
	}
	
	
	//메인 더보기 
	@RequestMapping(value = { "/mainMoreBoard" }, method = RequestMethod.GET)
	public String mainMoreBoard(HttpSession session, Model model, @RequestParam("pictureCount") int pictureCount) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-P101 - 게시물 더보기 요청");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
						
			
            int startNum = pictureCount+1;
            int endNum = startNum+1;
            int replyStartNum=1;
			int replyEndNum=5;
			int replyCountNum =0;
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<BoardGroup> listSource = boardDao.getPartOfBoardGroup(baseMemberInfo.getEmail(),startNum,endNum);
		    
			ReplyDao replydao = sqlSession.getMapper(ReplyDao.class);
			for(int i=0;i<listSource.size();i++){
				listSource.get(i).setReplyList(replydao.selectReply(listSource.get(i).getBoardSeq(),replyStartNum,replyEndNum));
				listSource.get(i).setReplyCount(replydao.countReply(replyCountNum,listSource.get(i).getBoardSeq()));
				if(listSource.get(i).getReplyList().get(i).getProfileinfo() == null || listSource.get(i).getReplyList().get(i).getProfileinfo() == " " ){
					listSource.get(i).getReplyList().get(i).setProfileinfo("default-profile-image.png");;
				System.out.println("ddd"+listSource.get(i).getReplyList().get(i).getProfileinfo());
				}
			}

			System.out.println("INFO : Skein-I101 - 사용자 게시물 더보기 조회 결과, groupListSize=" + listSource.size());
			model.addAttribute("baseMemberInfo", baseMemberInfo);
			model.addAttribute("groupList", listSource);
		}
		return "moreboard";
	}
	
	//사용자 지정 색상 변경
	@RequestMapping(value ="/colorTheme", method = RequestMethod.POST)
	public View changeColorTheme(@RequestParam("colorTheme") String colorTheme, Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			String email = baseMemberInfo.getEmail(); 
			memberDao.updateColorTheme(colorTheme, email);
			baseMemberInfo.setColorTheme(colorTheme);
			session.setAttribute("BASE_MEMBER_INFO", baseMemberInfo);
			System.out.println("INFO : Skein-I101 - 사용자 지정색상 정보 입력, colorTheme=" + baseMemberInfo.getColorTheme()+",email="+ email);
		}
		return jsonView;
	}

}
