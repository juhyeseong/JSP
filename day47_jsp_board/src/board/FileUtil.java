package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	private final String saveDirectory = "D:\\upload";
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();

//	private BoardDAO boardDAO = BoardDAO.getInstance();
	
	private static FileUtil instance;
	
	public static FileUtil getInstance() {
		if(instance == null) {
			instance = new FileUtil();
		}
		
		return instance;
	}
	
	private FileUtil() {
		File dir = new File(saveDirectory);
		
		if(dir.exists() == false) {
			dir.mkdir();
		}
	}
	
	public BoardDTO getDTO(HttpServletRequest request) {
		BoardDTO dto = null;
		
		// 1) 파일이 있는가 없는가 판별하기
		try {
			MultipartRequest req = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);

			File upload = req.getFile("upload");	// <input type="file" name="upload">
			boolean isNull = upload == null;
			
			String title = req.getParameter("title");
			int writer = Integer.parseInt(req.getParameter("writer"));
			String content = req.getParameter("content");
			
			dto = new BoardDTO();
			
			dto.setContent(content);
			dto.setTitle(title);
			dto.setWriter(writer);
			dto.setIpaddr(request.getRemoteAddr());
			dto.setUserAgent(request.getHeader("user-agent"));
			dto.setFileName(isNull ? null : upload.getName());
			
			// 수정 시 idx가 전될되었다면, idx도 dto에 넣어주기
			String idx1 = req.getParameter("idx");
			if(idx1 != null) {
				int idx2 = Integer.parseInt(idx1);
				dto.setIdx(idx2);
			}
			// 파일 삭제 체크박스에 체크되었다면
			if(req.getParameter("deleteFile") != null) {
//				deleteFile(boardDAO.selectOne(dto.getIdx()).getFileName());
				deleteFile(req.getParameter("delete"));
				dto.setFileName("fileName=null");	// 파일이름에 특정 문자열을 전달
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int deleteFile(String fileName) {
		int row = 0;
		File f = new File(saveDirectory, fileName);
		
		if(f.exists() && f.isFile()) {
			row = f.delete() ? 1 : 0;
		}
		
		return row;
	}
}
