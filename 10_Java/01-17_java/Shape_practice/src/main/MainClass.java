package main;

import cls.Circle;
import cls.Rectangle;
import cls.Shape;

public class MainClass {

	public static void main(String[] args) {
		
		Shape sc = new Circle(2.5);
		System.out.println(sc.calcArea());
		
		Shape sr = new Rectangle(5,5);
		System.out.println(sr.calcArea());
		
		boolean b = ((Rectangle)sr).isSquare();
		
		if(b==true) {
			System.out.println("정사각형");
		}else {
			System.out.println("직사각형");
		}
				
		
	}

}
