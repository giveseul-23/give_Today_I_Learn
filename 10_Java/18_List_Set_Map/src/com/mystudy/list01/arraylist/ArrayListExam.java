package com.mystudy.list01.arraylist;

import java.util.ArrayList;

public class ArrayListExam {

	public static void main(String[] args) {
		ArrayList list1 = new ArrayList();
		list1.add(new Integer(3));
		list1.add(1); // int -> Integer 자동형변환되어서 저장
		list1.add(new Integer(5));
		list1.add(new Integer(3));
		list1.add("123"); //String
		System.out.println("list1 : "+list1);
		Integer obj = (Integer) list1.get(0); //Intger <- Object(실체 Integer)
		int intvalue = obj.intValue(); // int <- Integer
		System.out.println("intvalue : " + intvalue);
		//Integer obj2 = (Integer) list1.get(4); //강제형변환.. 자료형변경시에는 integer.parseint?사용해야하는 것이 아닐까?
		// int <- Integer <- Object(실체 String) : 형변환 안됨
		
		
		//4번 인덱스 값 처리 : 문자열 데이터가 있음
		//실행시 java.lang.ClassCastException 발생 
		if(list1.get(4) instanceof Integer) {
			Integer obj2 = (Integer) list1.get(4); //강제형변환
			// int <- Integer <- Object(실체 String) : 형변환 안됨
			intvalue = obj2.intValue(); 
			System.out.println("intvalue : " + intvalue);
		}else if(list1.get(4) instanceof String) {
			String str = (String)list1.get(4);
			System.out.println("str.substring(1) : "+str.substring(1));
		}
		
		//----------------------
		System.out.println("--------------------------");
		//인덱스	   0  1  2   3  4	
		//list1 : [3, 1, 5, 3, 홍길동]
		ArrayList list2 = new ArrayList(list1.subList(1, 4)); // 지정 리스트만큼 담아줄수있음, subString과 동일한 방식으로 잘림, 1 ~ 4이전까지
		System.out.println("list2 : " + list2);
		
		//데이터 추가 : add
		list2.add(4);
		System.out.println("list2 : " + list2);
		
		//데이터 참조(검색, 확인)
		System.out.println(list2.get(0)); //첫번째 데이터 조회(확인)
		
		//데이터 수정
		list2.set(1, 999);
		System.out.println(list2.get(1));
		
		//데이터 삭제
		list2.remove(0);
		System.out.println("list2.remove(0) 실행 후 : " + list2);
		
		list2.add(77);
		list2.add(88);
		list2.add(77);
		System.out.println(list2); //[999, 3, 4, 77, 88, 77] - 77이 지금 중복됨
		
		//list2.remove(77);	//index로 인식하고 오류로 인식
		list2.remove(new Integer(77));
		System.out.println("list2.remove(new Integer(77)) : " + list2); //앞에서부터 삭제해서 한 개만 삭제된다.
		
		System.out.println("-----------");
		System.out.println("list2 : "+ list2);
	}

}
