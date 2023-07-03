package sales;

import java.sql.Date;

/*
이름      널?       유형     
------- -------- ------ 
IDX     NOT NULL NUMBER 
PRODUCT NOT NULL NUMBER 
SDATE            DATE   
CNT              NUMBER 
*/

public class SalesDTO {
	private int idx, product, cnt;
	private Date sdate;
	
	// 조인을 위한 추가 필드
	private String name;
	private int price;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getProduct() {
		return product;
	}
	public void setProduct(int product) {
		this.product = product;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
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
}
