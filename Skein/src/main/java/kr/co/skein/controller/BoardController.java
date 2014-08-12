package kr.co.skein.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.skein.model.dao.BoardDao;
import kr.co.skein.model.vo.HistoryCommand;
import kr.co.skein.model.vo.Media;
import kr.co.skein.util.CustomFileRenamePolicy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public View upload(HistoryCommand command, MultipartHttpServletRequest multiRequest, Model model) throws ClassNotFoundException, SQLException{
		String result = "";
		System.out.println("INFO : Skein-U530 - Parameter 확인, email=" + command.getEmail() + ",startDate=" + command.getStartDate() + ",endDate="+command.getEndDate() + ",publicLevelCode=" + command.getPublicLevelCode());
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		
		if(command.getFiles() != null){
			System.out.println("INFO : Skein-U151 - 사용자가 미디어를 업로드 하였습니다.");
			System.out.println("INFO : Skein-P151 - 파일 업로드 처리 시작");
			
					
			//파일 업로드 경로 설정
			String fileUploadDir = "/resources/upload";
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
				
				if(result.equals("upload error")){
					int res1 = boardDao.groupReg(command);
					if(res1 != 0){
						for(int i = 0;i<fileNames.size();i++){
							Media media = new Media();
							media.setFileName(fileNames.get(i));
							media.setFileSize((int) files.get(i).getSize());
							media.setExtension(files.get(i).getContentType());
							
							int res2 = boardDao.historyReg(command);
							if(res2 != 0){
								int res3 = boardDao.mediaReg(media);
								if(res3 == 0){
									result = "insert fail";
								}else{
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
				int res1 = boardDao.groupReg(command);
				if(res1 != 0){
					int res2 = boardDao.historyReg(command);
					if(res2 == 0){
						result = "insert fail";
					}
				}else{
					result = "insert fail";
				}
				
			} catch (Exception e) {
				result = "insert fail";
			}
		}
		
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 결과, result=" + result);
		System.out.println("INFO : Skein-P151 - 파일 업로드 처리 종료");
		model.addAttribute("result", result);
		return JsonView;
	}
}
