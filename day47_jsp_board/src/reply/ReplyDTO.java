package reply;

import java.sql.Date;

/*
이름        널?       유형             
--------- -------- -------------- 
IDX       NOT NULL NUMBER         
BOARD     NOT NULL NUMBER         
WRITER    NOT NULL NUMBER         
CONTENT   NOT NULL VARCHAR2(1500) 
WRITEDATE          DATE           
IPADDR    NOT NULL VARCHAR2(50)   
USERAGENT NOT NULL VARCHAR2(500)   
*/

public class ReplyDTO {
	private int idx, board, writer;
	private String content, ipaddr, userAgent, userId;
	private Date writeDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard() {
		return board;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
