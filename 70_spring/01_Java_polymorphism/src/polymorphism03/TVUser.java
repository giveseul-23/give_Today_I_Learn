package polymorphism03;

public class TVUser {
	public static void main(String[] args) {
		BeanFactory factory = new BeanFactory();
		
		//삼성 TV 사용
		//TV tv = (TV) factory.getBean("samsung");
		//TV tvi = (TV) factory.getBean("lg");
		TV tvi = (TV) factory.getBean(args[0]);
		tvi.powerOn();
		tvi.volumeUp();
		tvi.volumeDown();
		tvi.powerOff();
	}
}
