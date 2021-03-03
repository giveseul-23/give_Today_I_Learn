package polymorphism02;

public class SamsungTV implements TV{
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체생성");
	}
	
	@Override
	public void powerOn () {
		System.out.println("SamsungTV - 전원 ON!");
	}
	
	public void powerOff () {
		System.out.println("SamsungTV - 전원 OFF~");
	}
	
	public void volumeUp () {
		System.out.println("SamsungTV - 소리크게!!");
	}
	
	public void volumeDown () {
		System.out.println("SamsungTV - 소리작게~~");
	}
	
	//----------------
	public void initMethod() {
		System.out.println("SamsungTV - initMethod() 실행");
	}
	
	public void destroyMethod() {
		System.out.println("SamsungTV - destroyMethod() 실행");
	}
}
