package snack;

public class SnackDTO {
	// private 필드(*)
	private String name;	// 상품이름
	private int price;		// 상품가격
	private String image;	// 이미지 파일 이름
	
	public SnackDTO() {}	// 기본 생성자 (*)
	
	// 매개변수 전달받는 생성자(오버로딩)
	public SnackDTO(String name, int price, String image) {
		super();
		this.name = name;
		this.price = price;
		this.image = image;
	}

	// 메서드(getter / setter) (*)
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
