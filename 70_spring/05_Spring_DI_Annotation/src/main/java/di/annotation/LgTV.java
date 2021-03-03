package di.annotation;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//LgTV 객체 생성하고, 스피커도 주입해서 TVUser에서 사용해보기
@Component("lgtv")
public class LgTV implements TV{
	@Resource(name="sony")
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
