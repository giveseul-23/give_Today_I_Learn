package polymorphism04;

public class LgTV implements TV{
	
	private Speaker speaker;
	private int price;
	private int width;
	private int height;
	
	public LgTV() {
		System.out.println(">> LgTV 객체생성");
	}
	
	
	@Override
	public void powerOn() {
		System.out.println("LGTV - 전원 ON!");
		
	}

	@Override
	public void powerOff() {
		System.out.println("LGTV - 전원 OFF!");
		
	}

	@Override
	public void volumeUp() {
		System.out.println("LGTV - 소리크게!!");
		speaker.volumeUp();
		
	}

	@Override
	public void volumeDown() {
		System.out.println("LGTV - 소리작게~~");
		speaker.volumeDown();
	}
	
	//----------------
	public void initMethod() {
		System.out.println("LGTV - initMethod() 실행");
	}
	
	public void destroyMethod() {
		System.out.println("LGTV - destroyMethod() 실행");
	}
	
	//------------------
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public void setHeight(int height) {
		this.height = height;
	}


	@Override
	public String toString() {
		return "LgTV [speaker=" + speaker + ", price=" + price + ", width=" + width + ", height=" + height + "]";
	}

	
}
