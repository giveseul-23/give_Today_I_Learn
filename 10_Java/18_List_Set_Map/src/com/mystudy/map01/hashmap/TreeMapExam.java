package com.mystudy.map01.hashmap;

import java.util.TreeMap;

public class TreeMapExam {

	public static void main(String[] args) {
		//TreeMap : 키 값 기준으로 오름차순 정렬해서 저장
		TreeMap<String, Integer> map = new TreeMap<String, Integer>();
		map.put("홍길동", 100);
		map.put("김유신", 100);
		map.put("강감찬", 88);
		map.put("100", 93);
		map.put("10", 93);
		map.put("20", 93);
		System.out.println("map : "+map);
	}

}
