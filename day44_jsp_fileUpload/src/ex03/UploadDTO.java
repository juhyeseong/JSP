package ex03;

import java.io.File;
import java.sql.Date;

// 업로드)	request -> java.util.File -> String -> DB
// 불러오기)	DB -> String -> response

public class UploadDTO {
	private int idx;
	private String title;
	private String uploadFile;
	private Date uploadDate;
	private File upload;		// form에서 넘어오는 파일을 저장하기 위한 필드
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
}
