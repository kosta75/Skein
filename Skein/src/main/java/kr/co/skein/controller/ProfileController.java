package kr.co.skein.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.ProfileDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.ProfileCommand;
import kr.co.skein.util.CustomFileRenamePolicy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

//프로필 수정시에 사용할 컨트롤러
@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	//프로필 이미지 업데이트
	@RequestMapping(value="/profileImageUpdate", method=RequestMethod.POST)
	public View updateProfileImage(ProfileCommand command, HttpSession session, MultipartHttpServletRequest multiRequest, Model model) throws ClassNotFoundException, SQLException{
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		System.out.println(command.getEmail());
		int code = command.getProfileCode();
		
		if(code == 2){
			System.out.println("이것은 프로필 이미지!!!");
			
			//파일 업로드 경로 설정
			String fileUploadDir = "resources"+ File.separator +"user-profile-image";
			String rootPath = multiRequest.getSession().getServletContext().getRealPath("/");
			String fileUploadPath = rootPath + fileUploadDir;
			System.out.println("INFO : Skein-P151 - 파일 업로드 경로, rootPath="+rootPath+",fileUploadDir="+fileUploadDir+",fileUploadPath="+fileUploadPath);
			
			MultipartFile file = command.getFiles().get(0);
			String fileNames = fileUpload(fileUploadPath, file);
			command.setProfileInfo(fileNames);
			BaseMemberInfo baseMemberInfo = null;
			if((baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO")) != null){
				baseMemberInfo.setProfileImageFileName(fileNames);
				model.addAttribute("result","success");
			}
		}
		
		if(profileDao.countProfiles(command) > 0){
			profileDao.updateProfile(command);
		}else{
			profileDao.insertProfile(command);
		}

		return jsonView;
	}
	
	@RequestMapping(value="/profileUpdate", method=RequestMethod.POST)
	public View updateProfileInfo(ProfileCommand command, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		System.out.println(command.getEmail());
		
		if(profileDao.countProfiles(command) > 0){
			profileDao.updateProfile(command);
		}else{
			profileDao.insertProfile(command);
		}

		return jsonView;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public View deleteProfileInfo(ProfileCommand command, Model model) throws ClassNotFoundException, SQLException{
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		if(profileDao.deleteProfile(command) > 0){
			model.addAttribute("result", "success");
		}
		return jsonView;
	}
	
	//파일 업로드, 업로드된 파일명을 리스트로 반환한다.
	protected String fileUpload(String fileUploadPath, MultipartFile mfile){
		String fileNames = "";
		
		
						
		System.out.println("INFO : Skein-U310 - 업로드 파일 정보, fileName=" + mfile.getOriginalFilename() + ",fileSize=" + mfile.getSize() + ",contentType=" + mfile.getContentType());
								
		String fname = mfile.getOriginalFilename();
		String fullPath = fileUploadPath + File.separator + fname;
		System.out.println("INFO : Skein-U311 - 파일 업로드를 진행합니다. ");
		System.out.println("INFO : Skein-U311 - 업로드 경로, fullPath=" + fullPath);
							
		if(!fname.equals("")){
			try{
				File file = new File(fullPath);
					file = new CustomFileRenamePolicy().rename(file);
					String filename = new String(file.getName().getBytes("ISO8859_1"), "UTF-8");
					System.out.println("INFO : Skein-U515 - 데이터 베이스 입력 파일명, filename=" + filename);
					mfile.transferTo(file);
					fileNames = filename;

			}catch(IOException e){ 
				e.printStackTrace();
			}
		}	
		return fileNames;
	}
}
