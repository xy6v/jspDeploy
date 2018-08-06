package kr.or.ddit.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileDownload")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Content-Disposition", "attachment; filename=\"sally.png\"");
		response.setContentType("application/octet-stream");
		
		//FileUtil.fileUploadPath : sally.png
		//파라미터로 파일명 제공
		// localhost:8180/fileDownLoad?fileName=sally.png
		String fileName = request.getParameter("fileName");
		
		//D:\A_TeachingMaterial\7.JspSpring\fileUpload\sally.png
		String file = FileUtil.fileUploadPath + File.separator + fileName;
		
		//file 입출력을 위한준비
		ServletOutputStream sos = response.getOutputStream();
		
		File f = new File(file);
		FileInputStream fis = new FileInputStream(f);
		byte[] b = new byte[512];
		int len = 0;
		while( (len = fis.read(b)) != -1 ){
			sos.write(b, 0, len);
		}
		
		sos.close();
		fis.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
