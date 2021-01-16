package com.mystudy.strings;

public class StringBuilderTest {

	public static void main(String[] args) {
		
		String str = new String("Hello Java!!!");
		System.out.println(str);
		str = str + "반갑습니다.";
		System.out.println(str);
		System.out.println(str.replace("a","o")); //다른 위치에 생긴 데이터
		System.out.println(str); //원래 str은 그대로 유지됨
		
		System.out.println("-------------> StringBuilder");
		
		//StringBuilder 객체 생성
		StringBuilder sb = new StringBuilder("Hello Java!!!");
		System.out.println(sb);
		System.out.println(sb.toString());
		System.out.println("sb.capacity() : " + sb.capacity());
		
		sb.append("반갑습니다.");
		System.out.print(sb.toString());
		System.out.println("sb.capacity() : " + sb.capacity());
		
		System.out.println(">>delete(), insert() -----");
		System.out.println(sb.delete(0, 6)); // 0 ~ 6 이전까지 삭제
		System.out.println(sb);
		
		sb.insert(0, "Hello ");
		System.out.println("inesert 후 : "+ sb);
		System.out.println(".lengt() : "+ sb.length());
		
		System.out.println("---------------");
		StringBuilder sb2 = new StringBuilder(100); //(capacity : 용량)
		System.out.println("sb2.lengt() : "+ sb2.length());
		System.out.println("sb2.capacity() : "+ sb2.capacity());
		sb2.append("안녕하세요. 반갑습니다. ");
		System.out.println(sb2);
		System.out.println("sb2.lengt() : "+ sb2.length());
		System.out.println("sb2.capacity() : "+ sb2.capacity());
		sb2.trimToSize();
		System.out.println("sb2.lengt() : "+ sb2.length());
		System.out.println("sb2.capacity() : "+ sb2.capacity());
		sb2.append("자바 공부중").append("입니다."); //이렇게도 사용가능, 리턴하는 메서드에 따라 메서드를 또 사용이 가능하다.
		System.out.println("sb2.lengt() : "+ sb2.length());
		System.out.println("sb2.capacity() : "+ sb2.capacity());
		
		System.out.println("---------------");
		sb2.trimToSize();
		System.out.println("sb2 : " + sb2);
		sb2.setLength(3);
		System.out.println("sb2 : " + sb2);
		System.out.println("sb2.lengt() : "+ sb2.length());
		System.out.println("sb2.capacity() : "+ sb2.capacity());
	}

}
