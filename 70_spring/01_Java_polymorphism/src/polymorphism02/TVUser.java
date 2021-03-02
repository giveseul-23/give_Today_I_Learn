package polymorphism02;

public class TVUser {

	public static void main(String[] args) {
		//LgTV
		TV tv = new LgTV();
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		System.out.println("-------------------");
		
		//SamsungTV
		tv = new SamsungTV();
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
	}

}
