package kr.co.skein.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.dao.NotificationDao;
import kr.co.skein.model.dao.ShareDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.FriendshipListCommand;
import kr.co.skein.model.vo.MemberBoardCommand;
import kr.co.skein.model.vo.notification.ShareNotification;
import kr.co.skein.util.CustomFileRenamePolicy;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/share/*")
public class ShareController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	@RequestMapping(value="/add")
	public View shareBoardReg(HttpSession session, HttpServletRequest request, @RequestParam("ownerEmail")String ownerEmail, @RequestParam("boardSeq") int boardSeq, @RequestParam("notificationSeq") int notificationSeq ) throws ClassNotFoundException, SQLException, IOException{
		//수락을 누르면 일단 해당 게시물의 코드를 알아야 되
		//그다음에 맞는 DTO에 담아
		//그리고 그걸 다시 이 사람의 이름으로 재 입력 > 누구누구에게로 부터 공유한 글
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			String personalURI = memberDao.getPersonalURI(ownerEmail);
			
			if(boardDao.getBoardKindSeq(boardSeq) == 2){
				MemberBoardCommand memberBoardCommand = boardDao.getBoardByBoardSeq(boardSeq);
				if(memberBoardCommand.getFileName() != null && !memberBoardCommand.getFileName().equals("")){
					System.out.println("INFO - Skein-R124 - 이미지가 있는 게시물 공유");
					
					//파일 업로드 경로 설정
					String fileUploadDir = "resources"+ File.separator +"upload";
					String rootPath = request.getSession().getServletContext().getRealPath("/");
					String fileUploadPath = rootPath + fileUploadDir;
					
					System.out.println("INFO : Skein-P151 - 파일 업로드 경로, rootPath="+rootPath+",fileUploadDir="+fileUploadDir+",fileUploadPath="+fileUploadPath);
					
					String fname = memberBoardCommand.getFileName();
					int pos = fname.lastIndexOf(".");
					String extension = fname.substring(pos);
					System.out.println("파일확장자 : "+ extension);
					
					String fullPath = fileUploadPath + File.separator + fname;
					
					File file = new File(fullPath);					
					file = new CustomFileRenamePolicy().rename(file);
					String filename = new String(file.getName().getBytes("ISO8859_1"), "UTF-8");//파일 이름 여기
					
					BufferedImage image = ImageIO.read(file);					
					
					byte[] currentImage = null;
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					ImageIO.write(image, extension, baos);
					baos.flush();
					currentImage = baos.toByteArray();
					baos.close();
					
					FileOutputStream newFile = new FileOutputStream(fullPath);
					newFile.write(currentImage);
					newFile.close();
				}
			}else if(boardDao.getBoardKindSeq(boardSeq) == 3){
				
			}
		}
		
		return jsonView;
	}
	
	
	@RequestMapping(value="/sharefriendlist", method = RequestMethod.POST)
	public View getFriendList(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-F003 - 친구 목록 더 불러오기," );
		
		System.out.println("들어옴");
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);

		System.out.println("이메일"+baseMemberInfo.getEmail());
		List<FriendshipListCommand> list = friendshipDao.getAllFriendList(baseMemberInfo.getEmail());
		System.out.println();
		model.addAttribute("list", list);
		
		for(int i =0; i< list.size(); i++){
			System.out.println("이름 :" +list.get(i).getFullname());
		}
		
		return jsonView;
	}
	
	
	//최종 공유 확인 버튼 눌렀을때 실행 
	@RequestMapping(value="/shareDo", method = RequestMethod.POST)
	@Transactional
	public View shareDo(HttpServletRequest request,HttpSession session, Model model) throws ClassNotFoundException, SQLException, JSONException {
		//내가 상대방에게 '나'의 게시물을 공유해주는 프로세스
		
		System.out.println("INFO : Skein-F003 - 게시물 친구에게 공유하기," );
		String data = request.getParameter("json");
		JSONObject obj = new JSONObject(data);
		
		List<String> board = new ArrayList<String>();
		List<String> friend = new ArrayList<String>();
		
		int boardSize = obj.getJSONArray("board").length();
		int friendSize = obj.getJSONArray("friend").length();

		
		for(int i=0; i< obj.getJSONArray("board").length(); i++){
			board.add(i, obj.getJSONArray("board").get(i).toString());
		}
		for(int i=0; i< obj.getJSONArray("friend").length(); i++){
			friend.add(i, obj.getJSONArray("friend").get(i).toString());
		}

		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		ShareDao shareDao = sqlSession.getMapper(ShareDao.class);
		
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			//알림 처리!
			//1. Board에 있는 데이터를 조회
			//2. BoardKindSeq를 확인해서 해당하는 게시판의 데이터를 추가 조회
			
			//1 사람에 1게시물 공유 보냄
			if(boardSize == 1 && friendSize == 1){
				String senderEmail = baseMemberInfo.getEmail();
				String email = friend.get(0).toString();
				int boardSeq = Integer.valueOf(board.get(0).toString());
				
				int hasShareBoardResult = shareDao.hasShareBoard(email, boardSeq);
				int hasSaherNotificationResult = notificationDao.hasShareNotification(senderEmail, email, boardSeq);
				
				System.out.println("INFO : Skein-H324 - 공유 상황 조회 결과, hasShareBoardResult="+hasShareBoardResult);
				System.out.println("INFO : Skein-H324 - 공유 알림 조회 결과, hasSaherNotificationResult="+hasSaherNotificationResult);
				
				
				if(hasShareBoardResult == 0 && hasSaherNotificationResult == 0){
					//알림 보내기
					ShareNotification shareNotification = new ShareNotification();
					shareNotification.setEmail(email);
					shareNotification.setIsRead(0);
					shareNotification.setNotificationCode(4);
					shareNotification.setBoardSeq("" + boardSeq);
					shareNotification.setSenderEmail(senderEmail);
					shareNotification.setShareConfirm(0);
					
					notificationDao.shareNotificationReg(shareNotification);
					model.addAttribute("resultMessage", "해당 사용자에게 내보내기를 하였습니다.");
					
				}else if(hasShareBoardResult == 1){
					//이미 공유중
					System.out.println("이미 공유중입니다.");
					model.addAttribute("resultMessage", "해당 사용자와 이미 공유 중인 게시물입니다.");
				}else if(hasSaherNotificationResult == 1){
					//공유 대기중
					System.out.println("공유 대기 중 입니다.");
					model.addAttribute("resultMessage", "해당 사용자에게 이미 내보내기를 해서 수락을 대기 중입니다.");
				}
			}else if(boardSize == 1 && friendSize > 1){
				List<String> failedList = new ArrayList();
				for(int i=0;i<friendSize;i++){
					String ownerEmail = baseMemberInfo.getEmail();
					String email = friend.get(i).toString();
					int boardSeq = Integer.valueOf(board.get(0).toString());
					
					int hasShareBoardResult = shareDao.hasShareBoard(email, boardSeq);
					int hasSaherNotificationResult = notificationDao.hasShareNotification(ownerEmail, email, boardSeq);
					
					System.out.println("INFO : Skein-H324 - 공유 상황 조회 결과, hasShareBoardResult="+hasShareBoardResult);
					System.out.println("INFO : Skein-H324 - 공유 알림 조회 결과, hasSaherNotificationResult="+hasSaherNotificationResult);
					
					if(hasShareBoardResult == 0 && hasSaherNotificationResult == 0){
						//알림 보내기
						ShareNotification shareNotification = new ShareNotification();
						shareNotification.setEmail(email);
						shareNotification.setIsRead(0);
						shareNotification.setNotificationCode(4);
						shareNotification.setBoardSeq("" + boardSeq);
						shareNotification.setSenderEmail(ownerEmail);
						shareNotification.setShareConfirm(0);
						
						notificationDao.shareNotificationReg(shareNotification);
						
						
					}else if(hasShareBoardResult == 1){
						//이미 공유중
						//System.out.println("이미 공유중입니다.");
						failedList.add(email);
						
					}else if(hasSaherNotificationResult == 1){
						//공유 대기중
						failedList.add(email);
						//System.out.println("공유 대기 중 입니다.");
						
					}
					
				}
				
				
				String resultMessage = friendSize + "명 중 "+(friendSize-failedList.size()) +"명의 사용자에게 내보내기를 하였습니다.\n";
				resultMessage += "내보내기에 실패한 사용자에 대해서는\n공유 수락을 대기중이거나 이미 공유중 일 수 있으니\n다시 확인하여 주세요.\n\n";
				/*for(int j=0;j<failedList.size();j++){
					if(j != (failedList.size()-1)){
						resultMessage += failedList.get(j)+ ",";
					}else{
						resultMessage += failedList.get(j)+ ")";
					}	
				}*/
				
				model.addAttribute("resultMessage", resultMessage);
				
				
				
			}
			
			
			//1. 내가 다른 사람에게 공유 해주는 상황
			//- 내가 다른 1명에게 1개의 게시물을 공유해주는 상황
				
				
				
				
				//이미 공유된 게시물/이미 공유한 사람인지 검사
		
				//- 내가 다른 여러사람에게 1개의 게시물을 공유해주는 상황
				//각 사람별로 검사하
		
		
				//- 내가 다른 1명에게 여러개의 게시물을 공유해주는 상황
		
		
		
				//- 내가 다른 여러사람에게 여러개의 게시물을 공유해주는 상황
		
		
		
		
		
		
		
			/*
				2. 다른 사람이 나의 게시물을 공유하려는 상황
				- 나의 게시물 1개를 공유하려는 상황
				- 나의 게시물 여러개를 공유하려는 상황*/
				
		
		
		
		
			
		}
		return jsonView;
	}
	
	
	
	@RequestMapping(value="/publicShareDo", method = RequestMethod.POST)
	@Transactional
	public View hasPublicShareBoard(HttpServletRequest request, HttpSession session, Model model) throws ClassNotFoundException, SQLException, JSONException {
		
		System.out.println("공유한 사용자에게 떨어짐");
		
		System.out.println("INFO : Skein-F003 - 친구 게시물  공유신청 하기," );
		String data = request.getParameter("json");
		JSONObject obj = new JSONObject(data);
		
		String friend ="";
		friend= obj.getString("friend");
		System.out.println(friend);
		
		List<String> board = new ArrayList<String>();
		int boardSize = obj.getJSONArray("board").length();
	
		for(int i=0; i< obj.getJSONArray("board").length(); i++){
			board.add(i, obj.getJSONArray("board").get(i).toString());
		}
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		String friendEmail = memberDao.getEmailByPersonalURI(friend);
		
		
		
		NotificationDao notificationDao = sqlSession.getMapper(NotificationDao.class);
		ShareDao shareDao = sqlSession.getMapper(ShareDao.class);
		
		System.out.println("송광효"+ "if 들어가기전");
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
			
			System.out.println("송광효"+ "if 들어옴 boardSize if 들어가기전");
			if(boardSize ==1){
				System.out.println("송광효"+ "if 들어옴 boardSize if 들어옴   boardsize 1  ");
				//1 사람에 1게시물 공유 보냄
				String ownerEmail = baseMemberInfo.getEmail();
				String email = friendEmail;
				int boardSeq = Integer.valueOf(board.get(0).toString());
				
				int hasShareBoardResult = shareDao.hasShareBoard(email, boardSeq);
				int hasSaherNotificationResult = notificationDao.hasShareNotification(ownerEmail, email, boardSeq);
				
				System.out.println("INFO : Skein-H324 - 공유 상황 조회 결과, hasShareBoardResult="+hasShareBoardResult);
				System.out.println("INFO : Skein-H324 - 공유 알림 조회 결과, hasSaherNotificationResult="+hasSaherNotificationResult);
				
				
				if(hasShareBoardResult == 0 && hasSaherNotificationResult == 0){
					//알림 보내기
					ShareNotification shareNotification = new ShareNotification();
					shareNotification.setEmail(email);
					shareNotification.setIsRead(0);
					shareNotification.setNotificationCode(4);
					shareNotification.setBoardSeq("" + boardSeq);
					shareNotification.setSenderEmail(ownerEmail);
					shareNotification.setShareConfirm(0);
					
					notificationDao.shareNotificationReg(shareNotification);
					model.addAttribute("resultMessage", "해당 사용자에게 공유신청을 하였습니다.");
					
				}else if(hasShareBoardResult == 1){
					//이미 공유중
					System.out.println("이미 공유중입니다.");
					model.addAttribute("resultMessage", "해당 사용자와 이미 공유 중인 게시물입니다.");
				}else if(hasSaherNotificationResult == 1){
					//공유 대기중
					System.out.println("공유 대기 중 입니다.");
					model.addAttribute("resultMessage", "해당 사용자에게 이미 공유신청을 해서 수락을 대기 중입니다.");
				}
				
			}else if(boardSize > 1){
				System.out.println("송광효"+ "if 들어옴 boardSize if 들어옴   boardsize 1  이상!!");
				List<String> failedList = new ArrayList();
				for(int i=0; i<boardSize; i++){
					String senderEmail = baseMemberInfo.getEmail();
					String email = friendEmail;
					int boardSeq = Integer.valueOf(board.get(i).toString());
					
					int hasShareBoardResult = shareDao.hasShareBoard(email, boardSeq);
					System.out.println("shareDao.hasShareBoard(email, boardSeq); 실행끝");
					int hasSaherNotificationResult = notificationDao.hasShareNotification(senderEmail, email, boardSeq);
					System.out.println("notificationDao.hasShareNotification(senderemail, email, boardSeq); 실행끝");
					
					System.out.println("INFO : Skein-H324 - 공유 상황 조회 결과, hasShareBoardResult="+hasShareBoardResult);
					System.out.println("INFO : Skein-H324 - 공유 알림 조회 결과, hasSaherNotificationResult="+hasSaherNotificationResult);
					
					
					
					
					if(hasShareBoardResult == 0 && hasSaherNotificationResult == 0){
						
						System.out.println(" 알림 보내기 if 문 들어옴");
						//알림 보내기
						ShareNotification shareNotification = new ShareNotification();
						shareNotification.setEmail(email);
						shareNotification.setIsRead(0);
						shareNotification.setNotificationCode(4);
						shareNotification.setBoardSeq("" + boardSeq);
						
						System.out.println("----------------------------------------a");
						shareNotification. setSenderEmail(senderEmail);
						System.out.println("----------------------------------------b");
						shareNotification.setShareConfirm(0);
						System.out.println("----------------------------------------c");
						notificationDao.shareNotificationReg(shareNotification);
						System.out.println("----------------------------------------d");
						
					}else if(hasShareBoardResult == 1){
						//이미 공유중
						//System.out.println("이미 공유중입니다.");
						failedList.add(boardSeq+"");
						
					}else if(hasSaherNotificationResult == 1){
						//공유 대기중
						failedList.add(boardSeq+"");
						//System.out.println("공유 대기 중 입니다.");
						
					}
					
				}
				System.out.println("if 완전 밖으로 나옴");
				String resultMessage = "총 "+boardSize+"개의 게시물 중 "+(boardSize-failedList.size())+"개의 게시물을 공유신청 하셨습니다.\n ";
				resultMessage += "공유하기에 실패한 게시물에 대해서는\n공유 수락 대기중이거나 이미 공유중 일 수 있으니\n다시 확인하여 주세요.\n\n";
				
				model.addAttribute("resultMessage", resultMessage);	
				System.out.println("addAttribute 까지 지나옴 ");
			}
			
		}	
		
		System.out.println("마지막!!");
		return jsonView;
	}
	
}
