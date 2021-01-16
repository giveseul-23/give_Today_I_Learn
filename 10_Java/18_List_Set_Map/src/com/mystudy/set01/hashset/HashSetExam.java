package com.mystudy.set01.hashset;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetExam {

	public static void main(String[] args) {
		//Set 인터페이스(추상체) : Set 타입에서 구현되어야 할 메소드 정의
		//HashSet 클래스(구현체) : Set 인터페이스를 구현한 클래스
		HashSet<String> set = new HashSet<String>();
		set.add("1");
		set.add("홍길동");
		set.add("홍길동");
		set.add(new String("홍길동")); //중복은 넣을 수 없음.
		System.out.println("set : " + set);
		
		set.remove("1");
		System.out.println("set : " + set);
		
		System.out.println(set.contains("홍길동")); //contains 리턴값은 boolean
		System.out.println("set.size() : "+set.size());
		System.out.println("set.isEmpty() : "+set.isEmpty());
		
		System.out.println("---------------");
		set.add("김유신");
		set.add("을지문덕");
		set.add("홍경래");
		System.out.println("set : "+set); //순서개념없이 들어감
		
		System.out.println("----set 전체 데이터 조회(Iterator)----");
		Iterator<String> ite = set.iterator();
		while(ite.hasNext()) {
			String str = ite.next();
			System.out.println(str);
		}
		
		System.out.println("---------------");
		for (String name : set) {
			System.out.println(name);
		}
		
		System.out.println("---------------");
		//-----------------------------
		//실습(수정) : 김유신 --> 김유신2
		//김유신 삭제하고 김유신2가 존재하게 함
		
		boolean b = false;
		String str = "김유신";
		
		b = set.contains(str);
		if(b == true) {
			set.remove(str);
			set.add(str+"2");
			System.out.println(str+"의 이름을 삭제하였습니다.");
		}else {
			System.out.println("존재하지 않는 이름입니다.");
		}
		
		System.out.println(set);
	
	}

}
