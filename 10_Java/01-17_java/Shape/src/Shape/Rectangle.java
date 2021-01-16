package Shape;

public class Rectangle extends Shape {
	int width;	//폭
	int height;	//높이
	public Rectangle() {
		
	}
	
	public Rectangle(int x, int y) {
		this.width = x;
		this.height = y;
	}
	
	//정사각형 판별
	public boolean isSquare() {
		boolean b;
		
		if(width != 0 && height != 0 && width == height) {
			b = true;
		}else {
			b = false;
		}
		
		return b;
	}

	@Override
	public double calcArea() {
		//도형면적
		return width*height;
	}
}
