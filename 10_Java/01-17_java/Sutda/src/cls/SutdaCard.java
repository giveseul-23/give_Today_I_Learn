package cls;

public class SutdaCard {
	private int num;
	private boolean isKwang;
	
	public SutdaCard() {
		this(1, true);
	}
	
	public SutdaCard(int num, boolean isKwang) {
		this.num = num;
		this.isKwang = isKwang;
	}
	
	 // info()대신 Object클래스의 toString()을 오버라이딩했다.
	public String toString() {
		return num + ( isKwang ? "K":"");
	}
}
