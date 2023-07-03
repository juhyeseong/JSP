package ex03;

/*
 이름       널?       유형            
-------- -------- ------------- 
IDX      NOT NULL NUMBER        
USERID   NOT NULL VARCHAR2(100) 
USERPW   NOT NULL VARCHAR2(100) 
USERNAME NOT NULL VARCHAR2(100) 
EMAIL    NOT NULL VARCHAR2(100) 
BIRTH             VARCHAR2(100) 
GENDER            VARCHAR2(20)  
AGE               NUMBER 
*/

public class MemberDTO {
	private int idx, age;
	private String userId, userPw, userName;
	private String email, birth, gender;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
