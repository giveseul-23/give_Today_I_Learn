package Shape;

public class Circle extends Shape {
	double r; //반지름
	
	public Circle(){
		
	}
	
	public Circle(double r) {
		this.r = r;
	}

	@Override
	public double calcArea() {
		//도형면적
		return r*r*(3.14);
	}
	
	
}
