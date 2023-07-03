package product;

/*
 이름    널?       유형            
----- -------- ------------- 
IDX   NOT NULL NUMBER        
NAME  NOT NULL VARCHAR2(100) 
PRICE          NUMBER        
 */

public class ProductDTO {
	private int idx, price;
	private String name;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
