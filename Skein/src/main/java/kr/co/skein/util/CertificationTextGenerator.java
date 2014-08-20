package kr.co.skein.util;

import java.util.UUID;

public class CertificationTextGenerator {

	public static String certificationTextGenerate(){
		String certificationText = UUID.randomUUID().toString();//"a2b7a8c9d9e0b8e0a0f0e6a3";
		certificationText = certificationText.replace("-", "");
		return certificationText;
	}
}
