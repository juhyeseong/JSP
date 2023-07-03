package sales;

/*
이름     널?       유형            
------ -------- ------------- 
IDX    NOT NULL VARCHAR2(100) 
NAME   NOT NULL VARCHAR2(100) 
PRICE           NUMBER        
CNT             NUMBER        
STATUS          NUMBER(1)   
 */

public class SalesDTO {
	private String idx;
	private String name;
	private int price, cnt, status;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
