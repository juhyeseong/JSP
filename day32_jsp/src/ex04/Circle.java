package ex04;

public class Circle {
	private double radius;
	private double length;
	private double square;
	
	@Override
	public String toString() {
		String format = "반지름 : %.2f\n, 둘레 : %.2f\n, 넓이 : %.2f\n";
		return String.format(format, radius, length, square);
	}
	
	public void calc() {
		if(radius != 0) {
			length = 2 * 3.14 * radius;
			square = radius * radius * 3.14;
		}
	}
	
	public double getRadius() {
		return radius;
	}
	public void setRadius(double radius) {
		this.radius = radius;
	}
	public double getLength() {
		return length;
	}
	public void setLength(double length) {
		this.length = length;
	}
	public double getSquare() {
		return square;
	}
	public void setSquare(double square) {
		this.square = square;
	}	
}
