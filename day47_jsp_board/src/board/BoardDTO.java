package board;

import java.sql.Date;

/*
이름        널?       유형             
--------- -------- -------------- 
IDX       NOT NULL NUMBER         
TITLE     NOT NULL VARCHAR2(100)  
WRITER    NOT NULL NUMBER         
CONTENT   NOT NULL VARCHAR2(2000) 
FILENAME           VARCHAR2(255)  
WRITEDATE          DATE           
IPADDR    NOT NULL VARCHAR2(50)   
USERAGENT NOT NULL VARCHAR2(500)   
*/

public class BoardDTO {
	private int idx, writer;
	private String title, content, fileName, userId;
	private String ipaddr, userAgent;
	private Date writeDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
