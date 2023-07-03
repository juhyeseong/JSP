package member;

/*
이름       널?       유형            
-------- -------- ------------- 
IDX      NOT NULL NUMBER        
USERID            VARCHAR2(100)
USERPW   NOT NULL VARCHAR2(255)
USERNAME          VARCHAR2(100)
EMAIL             VARCHAR2(100)
*/

public class MemberDTO {
	private int idx;
	private String userId, userPw, userName, email;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
