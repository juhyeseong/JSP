package diary;

import java.io.File;
import java.sql.Date;

/*
이름        널?       유형             
--------- -------- -------------- 
IDX       NOT NULL NUMBER         
PIC       NOT NULL VARCHAR2(255)  
CONTENT   NOT NULL VARCHAR2(2000) 
WRITEDATE          DATE           
IPADDR    NOT NULL VARCHAR2(50)  
 */

public class DiaryDTO {
	private int idx;
	private String pic, content, ipaddr, agent;
	private Date writedate;
	private File upload;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
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
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
}
