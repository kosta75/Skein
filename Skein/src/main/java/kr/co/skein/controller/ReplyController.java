package kr.co.skein.controller;

import java.sql.SQLException;

import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.Reply;
import kr.co.skein.model.vo.ReplyNotificationCommand;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;













import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.dao.ReplyDao;
import kr.co.skein.model.vo.BoardCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	@Transactional
	public View reply(String boardSeq, String replyContent, HttpSession session) throws ClassNotFoundException, SQLException{
		BaseMemberInfo baseMemberInfo = null;
		if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
			
		}
		
	
		System.out.println("INFO : Skein-R245 - 댓글 입력, boardSeq="+boardSeq+", replyContent="+replyContent);
		
		ReplyDao replydao = sqlSession.getMapper(ReplyDao.class);
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		String ownerEmail = boardDao.getUserEmailByBoardSeq(Integer.valueOf(boardSeq));
		
		Reply reply = new Reply();
		reply.setEmail(baseMemberInfo.getEmail());
		reply.setBoardSeq(boardSeq);
		reply.setReplyContent(replyContent);
		
		replydao.insertReply(reply);
		
		if(!ownerEmail.equals(baseMemberInfo.getEmail())){
			ReplyNotificationCommand replyNotificationCommand = new ReplyNotificationCommand();
			replyNotificationCommand.setEmail(ownerEmail);
			replyNotificationCommand.setNotificationCode(6);
			replyNotificationCommand.setReplySeq(reply.getReplySeq());
			
			notificationDao.replyNotificationReg(replyNotificationCommand);
		}else{
			System.out.println("INFO : Skein-R552 - 동일한 사용자 댓글등록");
		}
		return jsonView;
	}
		
	
	//댓글 조회 
	@RequestMapping(value="/select", method=RequestMethod.POST)
	public View replyList(String boardSeq,Model model,int Count) throws ClassNotFoundException, SQLException{
		int replyStartNum;
		int replyEndNum;
		if(Count >0){
			replyStartNum =  Count+1;
			replyEndNum = replyStartNum+5;
			
		}else{
			replyStartNum =1;
			replyEndNum = 5;
		}
		
		ReplyDao replydao =sqlSession.getMapper(ReplyDao.class);
		List<Reply> replylist =replydao.selectReply(boardSeq,replyStartNum,replyEndNum);
		model.addAttribute("replylist",replylist );
		
		for(int i=0; i<replylist.size();i++){
			
			System.out.println(replylist.get(i).getReplyContent());
		}
		return jsonView;
	}
	
	
	//댓글삭제
	@RequestMapping(value="replyDelete",method=RequestMethod.POST)
	public View replyDelete(String replySeq,Model model) throws ClassNotFoundException, SQLException{
		System.out.println(replySeq);
		ReplyDao replyDao = sqlSession.getMapper(ReplyDao.class);
		
		int result = replyDao.deleteReply(replySeq);
		
		model.addAttribute("result", result);
		return jsonView;
	}
	
	
	//댓글 수정
	@RequestMapping(value="replyUpdate",method=RequestMethod.POST)
	public View replyUpdate(String replyEditContent,int replySeq,Model model) throws ClassNotFoundException, SQLException{
		
		ReplyDao replyDao = sqlSession.getMapper(ReplyDao.class);
		
		int result = replyDao.updateReply(replyEditContent,replySeq);
		
		model.addAttribute("result", result);
		return jsonView;
	}
	
	
	//댓글 카운터 
	@RequestMapping(value="/replyCountSelect", method=RequestMethod.POST)
	public View replyList(int Count,String boardSeq,Model model, HttpSession session) throws ClassNotFoundException, SQLException{
		
		int replyCount = Count+5;
		ReplyDao replydao =sqlSession.getMapper(ReplyDao.class);
		int count = replydao.countReply(replyCount, boardSeq);
		
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		model.addAttribute("baseMemberInfo", baseMemberInfo);
		model.addAttribute("count",count );
	
		return jsonView;
	}
	
}
