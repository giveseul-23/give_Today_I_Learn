package polymorphism02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		System.out.println("--- 스프링 컨테이너 구동전");
		//1. 스프링 컨테이너 구동(스프링 설정파일 읽어서)
		AbstractApplicationContext factory 
			= new GenericXmlApplicationContext("applcationContext.xml");
		
		System.out.println("--- 스프링 컨테이너 구동후");
		//2. 스프링 컨테이너 사용 : 생성된 객체를 요청(lookup)
		System.out.println("---- tv 요청 사용 ----");
		TV tv = (TV) factory.getBean("tv2Lg");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		System.out.println("---- tv 요청 한 번 더 ----");
		/* bean에서 scope 타입을 prototype으로 할 경우 객체 생성이 두 번 일어남*/
		tv = (TV) factory.getBean("tv2Lg");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		System.out.println("--- 스프링 컨테이너 구동종료처리");
		//3. 스프링 컨테이너 종료(close)
		factory.close();
	}

}
