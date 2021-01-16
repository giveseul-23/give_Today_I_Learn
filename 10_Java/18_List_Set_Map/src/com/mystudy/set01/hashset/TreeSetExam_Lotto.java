package com.mystudy.set01.hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.TreeSet;

public class TreeSetExam_Lotto {

	public static void main(String[] args) {
		/*
		  (실습) set을 이용한 로또만들기
		  	1. 로또번호 : 1~ 45 랜덤한 숫자 6개를 Set에 저장
		  	2. 로또번호 6개를 추첨 후 작은 숫자부터 순서대로 화면출력
			-Math.random() 사용해서 랜덤한 숫자 만들기
		*/
		
		//TreeSet을 사용하면 출력했을 때 기능을 따로 써주지 않아도 정렬이 바로 가능하다.
		//그렇다고 TreeSet 안에 데이터가 순서가 있는 것은 아니다.
		TreeSet<Integer> set = new TreeSet<Integer>();
		
		while(set.size() < 6) {
			set.add((int)((Math.random()*45)+1));
		}
		
		System.out.print("금주의 로또번호 : ");
		for (Integer i : set) {
			System.out.print(i+" ");
		}
		
		/*
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		
		System.out.print("금주의 로또번호 : ");
		for (Integer i : list) {
			System.out.print(i + " ");
		};
		*/
		
	}

}
