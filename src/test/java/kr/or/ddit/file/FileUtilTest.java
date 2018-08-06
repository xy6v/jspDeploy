package kr.or.ddit.file;

import static org.junit.Assert.*;

import org.junit.Test;

public class FileUtilTest {

	/**
	* Method : getFileNametest
	* 최초작성일 : 2018. 7. 16.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : getFileName Test
	*/
	@Test
	public void getFileNametest() {
		/***Given***/
		String contentDisposition = "form-data; name=\"uploadFile\"; filename=\"sally.png\"";

		/***When***/
		String fileName = FileUtil.getFileName(contentDisposition);

		/***Then***/
		assertEquals("sally.png", fileName);

	}

}




