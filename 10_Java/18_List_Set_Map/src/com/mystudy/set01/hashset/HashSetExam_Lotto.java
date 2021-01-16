package com.mystudy.set01.hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

public class HashSetExam_Lotto {

	public static void main(String[] args) {
		/*
		  (실습) set을 이용한 로또만들기
		  	1. 로또번호 : 1~ 45 랜덤한 숫자 6개를 Set에 저장
		  	2. 로또번호 6개를 추첨 후 작은 숫자부터 순서대로 화면출력
			-Math.random() 사용해서 랜덤한 숫자 만들기
		*/
		
		//int lotto_num[] = new int[6];
		HashSet<Integer> set = new HashSet<Integer>();
		
		/*
		for (int i = 0; set.size() < 6; i++) { //set 데이터가 6개 될 때까지
			set.add((int)((Math.random()*45)+1));
		}
		*/
		
		while(set.size() < 6) {
			set.add((int)((Math.random()*45)+1));
		}
		
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		
		System.out.print("금주의 로또번호 : ");
		for (Integer i : list) {
			System.out.print(i + " ");
		};
		
		
	}

}
