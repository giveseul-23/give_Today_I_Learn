package di.annotation;

import org.springframework.stereotype.Component;

public class SonySpeaker implements Speaker{
	
	public SonySpeaker() {
		System.out.println(">> SonySpeaker 객체 생성");
	}
	
	@Override
	public void volumeUp(){
		System.out.println("SonySpeaker 소리 크게");
	}
	
	@Override
	public void volumeDown(){
		System.out.println("SonySpeaker 소리 작게");
	}
	
	
}
