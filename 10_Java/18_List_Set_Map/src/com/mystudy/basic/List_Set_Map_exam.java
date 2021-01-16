package com.mystudy.basic;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class List_Set_Map_exam {

	public static void main(String[] args) {
			System.out.println("========= List ==========");
			/* (실습) List 사용실습
			1. 이름등록 : 홍길동, 강감찬, 박나래, 이순신
			2. 전체 데이터 출력
				출력 예) index : 이름(데이터)
			3. 데이터 수정 : 홍길동 -> 홍길동2
			4. 바뀐 데이터(홍길동2) 화면 출력
			***********************************/
			
			ArrayList<String> list = new ArrayList<String>();
			list.add("홍길동");
			list.add("강감찬");
			list.add("박나래");
			list.add("이순신");
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(i + " : " + list.get(i));
			}
			
			int i = 0;
			String str = "홍길동";
			while(i < list.size()) {
				if(list.get(i).equals(str)) {
					list.set(i, str+"2");
					break;
				}
			}
			
			System.out.println("========수정후=======");
			for (int j = 0; j < list.size(); j++) {
				System.out.println(j + " : " + list.get(j));
			}
			
			
			System.out.println("========= Set ==========");
			/* (실습) Set 사용
			1. 이름등록 : 홍길동, 강감찬, 박나래, 이순신
			2. 출력 : 이름 (오름차순, 가나다순)
			3. 데이터 수정 : 홍길동 -> 홍길동2
			*******************************/
			TreeSet<String> set = new TreeSet<String>();
			set.add("홍길동");
			set.add("강감찬");
			set.add("박나래");
			set.add("이순신");
			
			for (String str2 : set) {
				System.out.println(str2);
			}
			
			
			Iterator<String> ite = set.iterator();
			while(ite.hasNext()) {
				String name = ite.next();
				if(name.equals("홍길동")) {
					set.remove(name);
					set.add(name+"2");
				}
			}
			
			System.out.println("========수정후=======");
			for (String str2 : set) {
				System.out.println(str2);
			}
			
			
			System.out.println("========= Map ==========");
			/* Map 사용
			1. 데이터 입력 : 101-홍길동, 102-강감찬, 103-박나래, 104-이순신
			2. 출력 : 101-홍길동 (key 오름차순)
			3. 수정 : 홍길동 -> 홍길동2 (key 값 사용 : 101)
			4. 수정 : 강감찬 -> 강감찬2 (이름을 비교해서 찾아서 수정)
			*********************************/
			TreeMap<Integer, String> tmap = new TreeMap<Integer, String>();
			tmap.put(101, "홍길동");
			tmap.put(102, "강감찬");
			tmap.put(103, "박나래");
			tmap.put(104, "이순신");
			
			System.out.println(tmap);
			
			Set<Integer> tset = tmap.keySet();
			Iterator<Integer> setIte = tset.iterator();
			
			while(setIte.hasNext()) {
				if(setIte.next() == 101) {
					tmap.replace(101, "홍길동2");
					break;
				}
				
			}
			
			System.out.println(tmap);
			
			Iterator<Integer> setIte2 = tset.iterator();
			
			while(setIte2.hasNext()) {
				int key = setIte2.next();
				if((tmap.get(key)).equals("강감찬")) {
					tmap.replace(key, "강감찬2");
					break;
				}
			}
			
			System.out.println(tmap);
			
			
			
				
	}

}





