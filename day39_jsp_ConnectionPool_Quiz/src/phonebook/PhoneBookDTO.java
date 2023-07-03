package phonebook;

/*
이름          널?       유형            
----------- -------- ------------- 
IDX         NOT NULL NUMBER        
NAME        NOT NULL VARCHAR2(100) 
PHONENUMBER NOT NULL VARCHAR2(100) 
FAVORITES            NUMBER(1)   
 */

public class PhoneBookDTO {
	private int idx;
	private String name;
	private String phoneNumber;
	private int favorites;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getFavorites() {
		return favorites;
	}
	public void setFavorites(int favorites) {
		this.favorites = favorites;
	}	
}
