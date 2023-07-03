package diary;

// request를 전달받아서, 파일 업로드를 수행하고, DTO로 구성하여 반환하기
// 파일 업로드를 수행하기 위해서는 MultipartRequest가 필요하다
// MultipartRequest의 생성자에는 5개의 매개변수를 전달한다
// request, saveDirectory, maxPostSize, encoding, policy

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	private final String saveDirectory;
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	private static FileUtil instance;
	
	public FileUtil(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		ServletContext application = session.getServletContext();
		ServletContext application = request.getServletContext();
		saveDirectory = application.getRealPath("image");
	}
	
	public static FileUtil getInstance(HttpServletRequest request) {
		if(instance == null) {
			instance = new FileUtil(request);
		}
		
		return instance;
	}
	
	public DiaryDTO getDiaryDTO(HttpServletRequest request) {
		DiaryDTO dto = null;
		File dir = new File(saveDirectory);
		
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		try {
			MultipartRequest req = new MultipartRequest(
				request,
				saveDirectory, 
				maxPostSize,
				encoding,
				policy
			);
			
			File pic = req.getFile("pic");
			String content = req.getParameter("content");
			String ipaddr = request.getRemoteAddr();
			
			dto = new DiaryDTO();
			dto.setPic(pic.getName());
			dto.setContent(content);
			dto.setIpaddr(ipaddr);
			dto.setAgent(request.getHeader("user-agent"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
