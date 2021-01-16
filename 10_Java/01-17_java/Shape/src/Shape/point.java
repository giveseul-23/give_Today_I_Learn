package Shape;

public class point {
	int x;
	int y;
	
	public point() {
		this(0,0);
	}
	
	public point(int x, int y) {
		this.x=x;
		this.y=y;
	}

	public String toString() {
		return "["+x+","+y+"]";
	}
}
