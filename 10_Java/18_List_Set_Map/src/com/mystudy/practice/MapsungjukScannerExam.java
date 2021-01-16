package com.mystudy.practice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;

//클래스 
class sungjuk{
	Scanner sc = new java.util.Scanner(System.in);
	
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	String name;
	int subject;
	Iterator<String> ite;
	int i = 0;
	//성명 중복처리
	String[] abc = {"A", "B", "C", "D"};
	
	//생성자
	public sungjuk() {
		
	}
	
	//입력
	public void input() {

			System.out.print("이름을 입력하세요 : ");
			this.name = sc.next().trim();
			
			ite = map.keySet().iterator();
			while(ite.hasNext()) {
				String key = ite.next();
				if(name.equals(key)) {
					name = name + abc[i];
					i++;
				}
			}
			
			System.out.print("성적을 입력하세요 : ");
			this.subject = sc.nextInt();
			
			map.put(name, subject);
		
	}
	
	//출력
	public void print() {
		
		if(map.isEmpty()) {
			System.out.println("데이터가 비어있습니다.");
			return;
		}
		
		System.out.println("성명   점수");
		System.out.println("----------");
		entryFunc();
		System.out.println("==========");
		System.out.println("총점 : " + tot());
		System.out.println("평균 : "+ avg());
	}
	
	//수정
	public void update(String name) {
		
		check();
		
		System.out.print(name+"님의 수정할 성적을 입력 해 주세요 : ");
		int update = sc.nextInt();
		
		map.replace(name, update);
	}
	
	//삭제
	public void delete() {
		System.out.print("삭제할 이름을 입력하여 주세요 : ");
		String name = sc.next();
		
		check();
		
		map.remove(name);
		
	}
	
	//클리어
	public void clear() {
		if(map.isEmpty()) {
			System.out.println("데이터가 비어있습니다.");
			return;
		}
		
		map.clear();
		System.out.println("클리어 완료.");
	}
	
	//데이터 비었는지 여부, 이름 존재 여부
	public void check() {
		if(map.isEmpty()) {
			System.out.println("데이터가 현재 비어있습니다. 입력 먼저 해 주세요.");
			return;
		}
		
		ite = map.keySet().iterator();
		while(ite.hasNext()) {
			String key = ite.next();
			if(!(name.equals(key))) {
				System.out.println("존재하는 이름이 없습니다. 다시 입력하세요.");
				return;
			}
		}
	}
	
	
	//entryset 메서드
	public void entryFunc() {
		Set<Entry<String, Integer>> entrySet = map.entrySet();
		Iterator<Entry<String, Integer>> entryIte = entrySet.iterator();
		while(entryIte.hasNext()) {
			Entry<String, Integer> entry = entryIte.next();
			System.out.println(entry.getKey() + "  " + entry.getValue());
		}
	}
	
	
	//tot, avg
	//총점
	public int tot() {
		int tot = 0;
		
		Iterator<String> ite = map.keySet().iterator();
		while(ite.hasNext()) {
			String key = ite.next();
			int value = map.get(key);
			tot += value;
		}
		
		return tot;
	}
	//평균
	public double avg() {
		double avg = 0;
		
		avg = tot() * 100 / map.size() / 100.0; //소수점 두자리까지 출력됨
		
		return avg;
	}
	
}



//메인클래스
public class MapsungjukScannerExam {

	public static void main(String[] args) {
		Scanner sc = new java.util.Scanner(System.in);
		sungjuk sj = new sungjuk();
		
		while(true) {
			System.out.println("성적계산기의 메뉴를 선택 해주세요.");
			System.out.print("1 - 입력 | 2 - 출력 | 3 - 수정 | 4 - 삭제 | 5 - 초기화 | 6 - 종료  : ");
			int menuNum = sc.nextInt();
			
			
			switch(menuNum) {
			case 1 : 
				sj.input();
				break;
			case 2 : 
				sj.print();
				break;
			case 3 : 
				System.out.println("수정할 사람의 이름을 입력 해 주세요 : ");
				String up_name = sc.next();
				sj.update(up_name);
				break;
			case 4 : 
				sj.delete();
				break;
			case 5 : 
				sj.clear();
				break;
			case 6 : 
				System.out.println("안녕히 가십시오.");
				System.exit(0);
				break;
			}
		}
		
	}

}
