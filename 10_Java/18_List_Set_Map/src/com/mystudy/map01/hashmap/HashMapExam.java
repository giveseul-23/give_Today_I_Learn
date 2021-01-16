package com.mystudy.map01.hashmap;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class HashMapExam {

	public static void main(String[] args) {
		//Map 인터페이스 : 키(key) - 값(value) 쌍으로 데이터 저장
		// - 순서가 없다.(단, TreeMap의 경우 key 기준 오름차순 정렬)
		// - 키(key) : 중복안됨(중복값 없이 유일한 데이터)
		// - 값(value) : 중복 가능
		// -----------------------------------------
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("홍길동", 100); //100 -> Integer 타입 100 자동형변환
		map.put("김유신", new Integer(95)); //-> 컴파일러가 자동으로 처리해주기때문에 굳이 이렇게 쓰지 않아도 된다.
		map.put("강감찬", 88);
		map.put("계백", 88);
		map.put("홍길동", 93); //동일한 키값을 또 사용하면 덮어씌워진다
		System.out.println(map);
		
		
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("일지매", 92);
		map2.put("전우치", 82);
		System.out.println(map2);
		
		//삭제
		map2.remove("일지매");
		System.out.println(map2);
		
		//비었는지 여부
		System.out.println("map.isEmpty() : "+ map.isEmpty());
		
		//key값을 이용해서 조회, 검색
		System.out.println("key - 홍길동 : " + map.get("홍길동"));
		
		//포함여부
		//key
		map.containsKey("홍길동");
		System.out.println("key 홍길동 포함 여부 : "+map.containsKey("홍길동"));
		//value
		map.containsValue(88);
		System.out.println("value 88 포함 여부 : "+map.containsValue(88));
		
		
		System.out.println("----------------");
		//데이터 수정
		System.out.println("map : "+map);
		map.replace("홍길동", 99);
		System.out.println("map : "+map);
		
		//----------------------------
		System.out.println("----------map 전체 데이터 조회----------");
		//map에서는 키(key)를 이용해서 데이터(value) 조회
		System.out.println("----key를 추출해주는 : keySet() 사용 -----");
		Set<String> keySet = map.keySet(); //Set 타입에 담아줌
		System.out.println(keySet);
		
		Iterator<String> ite = keySet.iterator();
		while(ite.hasNext()) {
			String key = ite.next();
			Integer value = map.get(key);
			System.out.println("key : "+ key+", value : "+value);
		}
		
		System.out.println("-----값(value) 추출 : values() 사용");
		Collection<Integer> values = map.values();
		System.out.println("값(values) : "+values);
		Iterator<Integer> iteValues = values.iterator();
		//값(value)들의 합계 구하기
		int sum = 0;
		while(iteValues.hasNext()) {
			Integer value = iteValues.next();
			System.out.println("점수 : " + value);
			sum += value;
		}
		
		System.out.println("점수합계 : " + sum);
		
		System.out.println("--------map데이터 전체 조회 방법 ----------");
		System.out.println("----------방법1 : keySet(), iterator() 사용");
		
		System.out.println("----------방법2 : entrySet() 사용");
		//Entry : map 내부에 선언된 인터페이스 - map.Entry
		Set<Entry<String, Integer>> entrySet = map.entrySet();
		System.out.println("entrySet : " + entrySet);
		
		Iterator<Entry<String, Integer>> entryIte = entrySet.iterator();
		while(entryIte.hasNext()) {
			Entry<String, Integer> entry = entryIte.next();
			System.out.println("key : "+entry.getKey() + ", value : "+entry.getValue());
		}
	}

}
