package polymorphism03;

public class SamsungTV implements TV{
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
}
