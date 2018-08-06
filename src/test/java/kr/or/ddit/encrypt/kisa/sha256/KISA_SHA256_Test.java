package kr.or.ddit.encrypt.kisa.sha256;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KISA_SHA256_Test {
	private Logger logger = LoggerFactory.getLogger(KISA_SHA256_Test.class);

	/**
	* Method : encrypTest
	* 최초작성일 : 2018. 7. 18.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : sha256 hash 암호화 테스트
	*/
	@Test
	public void encrypTest() {
		/***Given***/
		String plainText = "1234";
		String plainText2 = "12345";

		/***When***/
		String encryptText = KISA_SHA256.encrypt(plainText);
		String encryptText2 = KISA_SHA256.encrypt(plainText2);
		logger.debug("encryptText : " + encryptText);
		logger.debug("encryptText2 : " + encryptText2);

		/***Then***/
		assertEquals("3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4",
					 encryptText);
		
		//encryptText : 3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4
		//encryptText2 : 5994471abb1112afcc18159f6cc74b4f511b9986da59b3caf5a9c173cacfc5

	}

}





