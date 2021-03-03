package polymorphism02;

public class LgTV implements TV{
	
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
		
	}

	@Override
	public void volumeDown() {
		System.out.println("LGTV - 소리작게~~");
		
	}
	
	//----------------
	public void initMethod() {
		System.out.println("LGTV - initMethod() 실행");
	}
	
	public void destroyMethod() {
		System.out.println("LGTV - destroyMethod() 실행");
	}

}
