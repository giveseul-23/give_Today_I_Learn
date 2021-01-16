package com.mystudy.list03.LinkedList;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;

public class LinkedListExam {

	public static void main(String[] args) {
		//LinkedList 클래스 : List 인터페이스 계열 
		LinkedList<String> list = new LinkedList<String>();
		list.add("홍길동");
		list.add("홍길동");
		list.add("김유신");
		System.out.println("list : "+ list);
		System.out.println(list.get(0));
		System.out.println("---------------");
	
		String str = "강강,김유신,강감찬,홍경래,을지문덕";
		String[] strs = str.split(",");
		System.out.println("strs : " + Arrays.toString(strs));
		
		//배열에 있는 데이터를 리스트에 추가
		/*
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		*/
		for (String string : strs) {
			list.add(string);
		}
		
		System.out.println("head : " + list.element());
		
		System.out.println("foreach문 : " + list);

		System.out.println("----------");
		Collections.reverse(list); //뒤집어진 형태로 나옴
		System.out.println("reverse 후 : "+ list);
		
		//삭제 : 김유신
		list.remove("김유신");
		System.out.println("김유신 삭제 후 : "+ list);
		
		//-----------------------------
		//실습 을지문덕 -> 을지문덕2 변경처리(수정)
		int index = list.indexOf("을지문덕");
		if(index >=0 ) {
			list.set(index, "을지문덕2");
		}
		System.out.println(list);
		
		System.out.println("-----------");
		//을지문덕2 -> 을지문덕3
		for (int i = 0; i < list.size(); i++) {
			if("을지문덕2".equals(list.get(i))) {
				list.set(i, "을지문덕3");
				break;
			}
		}
		
		System.out.println(list);
	}

}
