package kr.co.skein.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.vo.HistoryCommand;
import kr.co.skein.model.vo.Media;
import kr.co.skein.util.CustomFileRenamePolicy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private View JsonView;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	@RequestMapping(value="/registry", method=RequestMethod.POST)
	public String registry(){
		return "redirect:/";
	}
	
	@RequestMapping(value="/historyReg", method=RequestMethod.POST)
	@Transactional
	public View upload(HistoryCommand command, MultipartHttpServletRequest multiRequest, Model model) throws ClassNotFoundException, SQLException{
		String result = "";
		System.out.println("INFO : Skein-U530 - Parameter 확인, email=" + command.getEmail() + ",startDate=" + command.getStartDate() + ",endDate="+command.getEndDate() + ",publicLevelCode=" + command.getPublicLevelCode());
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		//1. 초기 Seq Set
		int groupSeq = boardDao.getGroupMaxSequence();
		//System.out.println("INFO : Skein-D692 - groupSeq=" + groupSeq);
		command.setGroupSeq(groupSeq);
		
		int boardSeq = boardDao.getBoardMaxSequence();
		command.setBoardSeq(boardSeq);
		
		int historySeq = boardDao.getHistoryMaxSequence();
		command.setHistorySeq(historySeq);
		
		int mediaSeq = boardDao.getMediaMaxSequence();
		
		
		//2. 기본 값 Set
		command.setBoardKindSeq(2); //History 게시판
		
		//Feelings, Weather, IsImportant, IsShare, Keyword, Place
		if(command.getFeelings() == null) command.setFeelings(""); 
		if(command.getWeather() == null) command.setWeather("");
		//if(command.getIsImportant() == 0) command.setIsImportant(0);
		//if(command.getIsShare() == 0) command.setIsShare(0);
		if(command.getKeyword() == null) command.setKeyword("");
		if(command.getPlace() == null) command.setPlace("");
		
		//3. 그룹 이름 정책
		if(command.getGroupName() == null){
			System.out.println("INFO : Skein-U152 - 그룹명이 지정되어 있지 않습니다.");
			String date = sdf.format(Calendar.getInstance().getTime());
			command.setGroupName(date + "에 작성된 글");
		}
		
		//4. 발생일/종료일 정책
		if(command.getGroupStartDate() == null && command.getGroupEndDate() == null){
			if(command.getStartDate() == null && command.getEndDate() == null){
				command.setStartDate(Calendar.getInstance().getTime());
				command.setEndDate(Calendar.getInstance().getTime());
			}
			command.setGroupStartDate(command.getStartDate());
			command.setGroupEndDate(command.getEndDate());
		}
		
		if(command.getGroupStartDate() == null){
			if(command.getStartDate() == null){
				command.setStartDate(Calendar.getInstance().getTime());
			}
			command.setGroupStartDate(command.getStartDate());
		}
		
		if(command.getGroupEndDate() == null){
			if(command.getEndDate() == null){
				command.setEndDate(Calendar.getInstance().getTime());
			}
			command.setGroupEndDate(command.getEndDate());
		}
		
		
		System.out.println("INFO : Skein-P151 - History 게시물 등록 처리 시작");
		if(command.getFiles() != null){
			System.out.println("INFO : Skein-U151 - 사용자가 미디어를 업로드 하였습니다.");
			System.out.println("INFO : Skein-P151 - 파일 업로드 처리 시작");
			
					
			//파일 업로드 경로 설정
			String fileUploadDir = "\\resources\\upload";
			String rootPath = multiRequest.getSession().getServletContext().getRealPath("/");
			String fileUploadPath = rootPath + File.separator + fileUploadDir;
			System.out.println("INFO : Skein-P151 - 파일 업로드 경로, rootPath="+rootPath+",fileUploadDir="+fileUploadDir+",fileUploadPath="+fileUploadPath);
			
			
			List<MultipartFile> files = command.getFiles();
			List<String> fileNames = new ArrayList<String>();
			if(files.size()>0 && files != null){
				System.out.println("INFO : Skein-U300 - 업로드 파일 수=" + files.size());
				for(MultipartFile multipartFile : files){				
					System.out.println("INFO : Skein-U310 - 업로드 파일 정보, fileName=" + multipartFile.getOriginalFilename() + ",fileSize=" + multipartFile.getSize() + ",contentType=" + multipartFile.getContentType());
										
					String fname = multipartFile.getOriginalFilename();
					String fullPath = fileUploadPath + "\\" + fname;
					System.out.println("INFO : Skein-U311 - 파일 업로드를 진행합니다. ");
					System.out.println("INFO : Skein-U311 - 업로드 경로, fullPath=" + fullPath);
									
					if(!fname.equals("")){
						try{
							File file = new File(fullPath);
							file = new CustomFileRenamePolicy().rename(file);
							String filename = new String(file.getName().getBytes("ISO8859_1"), "UTF-8");
							System.out.println("INFO : Skein-U515 - 데이터 베이스 입력 파일명, filename=" + filename);
							multipartFile.transferTo(file);
							fileNames.add(filename);
	
						}catch(IOException e){ 
							result = "upload error";
						}
						
					}else{
						result = "upload error";
					}
				}
				
				if(!result.equals("upload error") && (files.size() == fileNames.size())){
					int groupRegResult = boardDao.groupReg(command);
					command.setGroupSeq(groupSeq);
					
					if(groupRegResult != 0){					
						System.out.println("INFO : Skein-D152 - BoardGroup 등록에 성공하였습니다. groupSeq=" + groupSeq);
						
						for(int i = 0;i<fileNames.size();i++){
							Media media = new Media();
							media.setMediaSeq(mediaSeq);
							media.setBoardSeq(boardSeq);
							media.setFileName(fileNames.get(i));
							media.setFileSize((int) files.get(i).getSize());
							media.setExtension(files.get(i).getContentType());
							
							command.setBoardSeq(boardSeq);
							int boardRegResult = boardDao.boardReg(command);
							command.setBoardSeq(boardSeq);
							
							if(boardRegResult != 0){
								System.out.println("INFO : Skein-D153 - Board 등록에 성공하였습니다. boardSeq=" + boardSeq);

								command.setHistorySeq(historySeq);
								int historyRegResult = boardDao.historyReg(command);
								command.setHistorySeq(historySeq);
								
								media.setMediaSeq(mediaSeq);
								int mediaRegResult = boardDao.mediaReg(media);
								media.setMediaSeq(mediaSeq);
								
								if(historyRegResult == 0 && mediaRegResult == 0){
									result = "insert fail";
								}else{
									System.out.println("INFO : Skein-D153 - History, Media 등록에 성공하였습니다. historySeq="+historySeq+",mediaSeq="+mediaSeq);
									boardSeq++;
									historySeq++;
									mediaSeq++;
									result = "success";
								}
							}else{
								result = "insert fail";
							}
							
						}
					}else{
						result = "insert fail";
					}
				}
			}else{
				result = "insert fail";
			}
		}else{
			System.out.println("INFO : Skein-U152 - 사용자가 미디어를 포함하지 않는 글을 등록하였습니다.");
			try {
				int groupRegResult = boardDao.groupReg(command);
				command.setGroupSeq(groupSeq);
				
				if(groupRegResult != 0){
					System.out.println("INFO : Skein-D152 - BoardGroup 등록에 성공하였습니다. groupSeq=" + command.getGroupSeq());
					
					int boardRegResult = boardDao.boardReg(command);
					command.setBoardSeq(boardSeq);
					
					if(boardRegResult != 0){
						System.out.println("INFO : Skein-D153 - Board 등록에 성공하였습니다. boardSeq=" + command.getBoardSeq());
											
						int historyRegResult = boardDao.historyReg(command);
						command.setHistorySeq(historySeq);
						
						if(historyRegResult == 0){
							result = "insert fail";
						}else{
							System.out.println("INFO : Skein-D153 - History 등록에 성공하였습니다. historySeq="+historySeq);
							result = "success";
						}
					}else{
						result = "insert fail";
					}
				}else{
					result = "insert fail";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				result = "insert fail";
			}
		}
		
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 결과, result=" + result);
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 종료");
		model.addAttribute("result", result);
		return JsonView;
	}
}
