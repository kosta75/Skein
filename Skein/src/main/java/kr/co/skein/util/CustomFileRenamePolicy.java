package kr.co.skein.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class CustomFileRenamePolicy implements FileRenamePolicy {
	@Override
	public File rename(File f){
		String name = f.getName();
		//////////////////
		//날짜를 기준으로 파일명 재설정
	    //String body = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); //현재시간
		//String body = SupinanDateFormat.getInstance("yyyyMMddhmsS").format(new Date()); //SupinanDateFormat
		
		///////////////////////////////
		//UUID 파일명 재설정
		String body = UUID.randomUUID().toString().replace("-", ""); //UUID에있는 -(하이픈) 제거
	    String ext = null;
	    
	    int dot = name.lastIndexOf(".");
	    if (dot != -1) {
	    	ext = name.substring(dot);  // includes "."   .포함 확장자
	    }
	    else {      
	      ext = "";
	    }
	    String newName = body + ext;
	    f = new File(f.getParent(), newName);
	    
	    return f;
	}
}
