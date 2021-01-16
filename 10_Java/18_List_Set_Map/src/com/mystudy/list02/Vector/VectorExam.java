package com.mystudy.list02.Vector;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Vector;

public class VectorExam {
	public static void main(String[] args) {
		Vector v = new Vector();
		v.add("1");
		v.add("2");
		v.add("3");
		System.out.println("v.size() : "+v.size());
		System.out.println("v.capacity() : " + v.capacity());
		v.trimToSize();
		System.out.println("-------trimToSize 실행후 ------");
		System.out.println("v.size() : "+v.size());
		System.out.println("v.capacity() : " + v.capacity());
		v.add("4");
		System.out.println(v);
		//v.remove(7); - 오류
		v.remove(v.size() - 1);
		System.out.println(v);
		
		v.set(0, "홍길동");
		System.out.println(v);
		
		System.out.println("-------객체복사-----");
		Vector<String> v2 = (Vector<String>)v.clone();
		System.out.println("v : "+v);
		System.out.println("v2 : "+v2);
	
		//전체데이터삭제
		System.out.println("----------v 데이터 전체 삭제후 ----");
		v.clear();
		System.out.println("v : "+v);
		System.out.println("v2 : "+v2);
		
		System.out.println("-------Enumeration------");
		Enumeration<String> enu = v2.elements();
		while(enu.hasMoreElements()) {
			String str = enu.nextElement();
			System.out.println("enu.nextElement() : " + str);
		}
		
		System.out.println("------Iterator 활용 조회 ----");
		Iterator<String> ite = v2.iterator();
		while(ite.hasNext()) {
			String str = ite.next();
			System.out.println("ite.next() : "+str);
		}
		
	}
}
