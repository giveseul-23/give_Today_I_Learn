package di_collection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {

	public static void main(String[] args) {
		System.out.println("-----------컨테이너 구동전 --------");
		
		//1. 컨테이너 구동
		GenericXmlApplicationContext factory 
			= new GenericXmlApplicationContext("applicationContext.xml");
		
		System.out.println("-----------컨테이너 구동후 --------");
		//2. 스프링 컨테이너 사용
		CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
		System.out.println("---- List 타입 ----");
		System.out.println("bean : " + bean);
		List<String> addressList = bean.getAddressList();
		for(String address : addressList) {
			System.out.println(address);
		}
		
		System.out.println("---- Set 타입 ----");
		System.out.println("bean : " + bean);
		Set<String> addressSet = bean.getAddressSet();
		/* Set 은 중복 x */
		System.out.println(addressSet);
		
		System.out.println("---- Map 타입 ----");
		System.out.println("bean : " + bean);
		/* Map 은 key값 중복 x */
		Map<String, String> addressmap = bean.getAddressMap();
		System.out.println(addressmap);
		
		System.out.println("---- Properties 타입 ----");
		Properties addressProp = bean.getAddressProp();
		System.out.println(addressProp);
		
		System.out.println("-----------컨테이너 종료 --------");
		factory.close();
	}

}
