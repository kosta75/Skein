package kr.co.skein.controller;

import java.sql.SQLException;

import kr.co.skein.model.vo.reply;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;







import kr.co.skein.model.dao.replyDao;
import kr.co.skein.model.vo.BoardCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	//댓글 등록
		@RequestMapping(value="/insert", method=RequestMethod.POST)
		public View reply(String boardSeq,String replyContent,HttpSession session) throws ClassNotFoundException, SQLException{
		
		System.out.println("boardSeq="+boardSeq+"content"+replyContent);
		/*  = session.getAttribute("BASE_MEMBER_INFO");*/
		replyDao replydao = sqlSession.getMapper(replyDao.class);
		String email = "admin@skein.com";
		int i = replydao.insertReply(boardSeq, email, replyContent);
		
			return jsonView;
		}
		
	
	//댓글 조회 
		@RequestMapping(value="/select", method=RequestMethod.POST)
		public View replyList(String boardSeq,Model model) throws ClassNotFoundException, SQLException{
			System.out.println("modal reply start");
			replyDao replydao =sqlSession.getMapper(replyDao.class);
			System.out.println(boardSeq);

			List<reply> replylist =replydao.selectReply(boardSeq);
			System.out.println(replylist.size());
			for(int i =0;i<replylist.size();i++){
				
				System.out.println("modal ="+replylist.get(i).getReplyContent());
				
			}
			model.addAttribute("replylist",replylist );
			
			
		
			return jsonView;
		}
	
	
}
