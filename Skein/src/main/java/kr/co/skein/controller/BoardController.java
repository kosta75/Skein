package kr.co.skein.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.vo.BoardCommand;
import kr.co.skein.model.vo.BoardGroup;
import kr.co.skein.model.vo.HistoryCommand;
import kr.co.skein.model.vo.Media;
import kr.co.skein.util.CustomFileRenamePolicy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	
	@RequestMapping("/board/getBoards")
	public View getBoards(HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();

			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<BoardGroup> listSource = boardDao.getBoardGroup(user.getUsername());

			model.addAttribute("listSource", listSource);
			System.out.println("INFO : Skein-A123 - 전체 게시물 수, size=" + listSource.size());
		}
		return JsonView;
	}
	
	@RequestMapping(value="/historyReg", method=RequestMethod.POST)
	@Transactional
	public View upload(HistoryCommand command, MultipartHttpServletRequest multiRequest, Model model) throws ClassNotFoundException, SQLException{
		String result = "";
		System.out.println("INFO : Skein-U530 - Parameter 확인, email=" + command.getEmail() + ",startDate=" + command.getStartDate() + ",endDate="+command.getEndDate() + ",publicLevelCode=" + command.getPublicLevelCode());
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		command = initHistory(command);
		
		System.out.println("INFO : Skein-P151 - History 게시물 등록 처리 시작");
		if(command.getFiles() != null){
			System.out.println("INFO : Skein-U151 - 사용자가 미디어를 업로드 하였습니다.");
			System.out.println("INFO : Skein-P151 - 파일 업로드 처리 시작");
	
			//파일 업로드 경로 설정
			String fileUploadDir = "resources"+ File.separator +"upload";
			String rootPath = multiRequest.getSession().getServletContext().getRealPath("/");
			String fileUploadPath = rootPath + fileUploadDir;
			System.out.println("INFO : Skein-P151 - 파일 업로드 경로, rootPath="+rootPath+",fileUploadDir="+fileUploadDir+",fileUploadPath="+fileUploadPath);

			List<MultipartFile> files = command.getFiles();
			
			if(files.size()>0 && files != null){
				List<String> fileNames = fileUpload(fileUploadPath, files);

				if(files.size() == fileNames.size()){
					boardDao.groupReg(command);
					for(int i = 0;i<fileNames.size();i++){
						Media media = new Media();
						media.setFileName(fileNames.get(i));
						media.setFileSize((int) files.get(i).getSize());
						media.setExtension(files.get(i).getContentType());
						
						command.setMedia(media);
							
						int historyRegResult = boardDao.historyReg(command);
						System.out.println("INFO : Skein-D153 - Board 등록에 성공하였습니다. boardSeq=" + command.getBoardSeq());
						
						if(historyRegResult != 0){
							result = "success";
						}else{
							result = "insert fail";
						}
					}
				}
			}else{
				result = "insert fail";
			}
		}else{
			System.out.println("INFO : Skein-U152 - 사용자가 미디어를 포함하지 않는 글을 등록하였습니다.");
			int groupRegResult = boardDao.groupReg(command);
			int historyRegResult = boardDao.historyReg(command);
			
			if(groupRegResult != 0 && historyRegResult != 0){
				result = "success";
			}else{
				result = "insert fail";
			}
		}
		
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 결과, result=" + result);
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 종료");
		model.addAttribute("result", result);
		return JsonView;
	}
	
	
	protected BoardCommand initBoard(BoardCommand command){
		//3. 그룹 이름 정책
		if(command.getGroupName() == null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println("INFO : Skein-U152 - 그룹명이 지정되어 있지 않습니다.");
			String date = sdf.format(Calendar.getInstance().getTime());
			command.setGroupName(date + "에 작성된 글");
		}	
		return command;
	}
	
	
	protected HistoryCommand initHistory(HistoryCommand command) {
		command = (HistoryCommand) initBoard(command);
		
		//4. 발생일/종료일 정책		
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
		
		return command;
	}
	
	protected List<String> fileUpload(String fileUploadPath, List<MultipartFile> files){
		List<String> fileNames = new ArrayList<String>();
		
		System.out.println("INFO : Skein-U300 - 업로드 파일 수=" + files.size());
		for(MultipartFile multipartFile : files){				
			System.out.println("INFO : Skein-U310 - 업로드 파일 정보, fileName=" + multipartFile.getOriginalFilename() + ",fileSize=" + multipartFile.getSize() + ",contentType=" + multipartFile.getContentType());
								
			String fname = multipartFile.getOriginalFilename();
			String fullPath = fileUploadPath + File.separator + fname;
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
					e.printStackTrace();
				}
			}
		}
		
		return fileNames;
	}
	
	
}
