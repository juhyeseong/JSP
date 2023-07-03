package ex04;

import java.sql.Date;

/*
이름    널?       유형            
----- -------- ------------- 
TITLE NOT NULL VARCHAR2(100) 
SDATE NOT NULL DATE          
EDATE NOT NULL DATE  
 */

public class Ex04DTO {
	private String title;
	private Date sdate;
	private Date edate;
	private int days;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
}
