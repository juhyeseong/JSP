package ex03;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	private static FileUtil instance;
	
	private final String saveDirectory;
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public FileUtil(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		saveDirectory = application.getRealPath("image");
	}
	
	public static FileUtil getInstance(HttpServletRequest request) {
		if(instance == null) {
			instance = new FileUtil(request);
		}
		
		return instance;
	}
	
	// request를 전달받아서 파일을 포함하는 DTO를 반환하는 메서드
	public UploadDTO getUploadDTO(HttpServletRequest request) throws IOException {
		UploadDTO dto = null;
		// 0) 만약, saveDirectory가 존재하지 않는다면 디렉토리를 생성한다
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		// 1) MultipartRequest 의 객체를 생성한다 (파일 업로드 자동 완료)
		MultipartRequest req = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,
				policy
		);
		// 2) 전송된 문자열 파라미터와 파일을 DTO에 세팅한다
		String title = req.getParameter("title");	// 문자열 파라미터 받기
		File f = req.getFile("upload");				// 첨부 파일 받기
		dto = new UploadDTO();
		dto.setTitle(title);
		dto.setUploadFile(f.getName());				// 파일의 이름만 문자열로 세팅한다
		
		// 3) dto를 반환한다
		return dto;
	}
}
