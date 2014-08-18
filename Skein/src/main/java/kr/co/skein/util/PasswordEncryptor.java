package kr.co.skein.util;
import java.security.MessageDigest;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


public class PasswordEncryptor {

	public String getEncryptSource(String plainText) throws Exception {

	    MessageDigest mDigest = MessageDigest.getInstance("MD5");
	    mDigest.update(plainText.getBytes());
	    byte[] msgStr = mDigest.digest() ;
	    
	    StringBuffer sbuf = new StringBuffer();
	    for(int i=0; i < msgStr.length; i++){
	        String tmpEncTxt = String.format("%02x", 0xff&(char)msgStr[i]);//Integer.toHexString((int)msgStr[i] & 0x00ff) ;           
	        sbuf.append(tmpEncTxt) ;
	    }
	    return sbuf.toString();
	}
}
