package polymorphism01;

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
		TV tv = (TV) factory.getBean("tv");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		System.out.println("---- tv 요청 한 번 더 ----");
		//스프링 컨테이너는 싱글톤 패턴처럼 하나의 객체만 만들어냄!
		tv = (TV) factory.getBean("tv");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		System.out.println("--- 스프링 컨테이너 구동종료처리");
		//3. 스프링 컨테이너 종료(close)
		factory.close();
	}

}
