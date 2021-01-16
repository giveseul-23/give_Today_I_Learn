package dao;

import java.io.File;
import java.util.Scanner;

import data.DataProc;
import dto.Batter;
import dto.Human;
import dto.Pitcher;

public class MemberDao {
	Scanner sc = new Scanner(System.in);
	
	//선수정보를 담을 배열
	private Human humanArr[] = null;
	private int member_count;
	DataProc d;
	File f;
	
	
	public MemberDao() {
		humanArr = new Human[100];
		member_count = 0;
		load();
	}
	
	public MemberDao(int count) {
		humanArr = new Human[count];
		
		d = new DataProc();
		load();
		
		member_count = 0;
		/*
		humanArr[0] = new Pitcher(1001, "홍길동", 24, 180.0, 10, 2, 0.2);
		humanArr[1] = new Batter(1002, "일지매", 21, 178.0, 25, 12, 0.5);
		humanArr[2] = new Pitcher(1003, "성춘향", 16, 175.0, 12, 1, 0.1);
		humanArr[3] = new Batter(1004, "홍길동", 23, 182.0, 11, 5, 0.4);
		*/
		
		
	}
	
	//등록
	public void insert() {
		
		//공통
		System.out.println("등록할 선수의 번호 : (pitcher(1000번대)|batter(2000번대))");
		int number = sc.nextInt();
		
		System.out.println("등록할 선수의 이름 : ");
		String name = sc.next();
		
		System.out.println("등록할 선수의 나이 : ");
		int age = sc.nextInt();
		
		System.out.println("등록할 선수의 키 : ");
		double height = sc.nextDouble();
		
		//분류
		System.out.println("등록할 선수의 종목 : (pitcher(1)|batter(2))");
		int pb = sc.nextInt();
		
		Human h = null;
		
		if(pb == 1) {
			//pitcher
			System.out.println("등록할 선수의 승전 : ");
			int win = sc.nextInt();
			
			System.out.println("등록할 선수의 패전 : ");
			int loose = sc.nextInt();
			
			System.out.println("등록할 선수의 방어율 : ");
			double defence = sc.nextDouble();
			
			h = new Pitcher(number, name, age, height, win, loose, defence);
		}else if(pb == 2) {
			//batter
			System.out.println("등록할 선수의 타수 : ");
			int bat = sc.nextInt();
			
			System.out.println("등록할 선수의 안타수 : ");
			int hit = sc.nextInt();
			
			System.out.println("등록할 선수의 타율 : ");
			double batCount = sc.nextDouble();
			
			h = new Batter(number, name, age, height, bat, hit, batCount);
		}
		
		humanArr[member_count] = h;
		member_count++;
		
	}
	
	//삭제
	public void delete() {
		System.out.print("삭제할 선수명  : ");
		String name = sc.next();
		
		int index = search(name);
		
		if(humanArr[index] instanceof Pitcher) {
			((Pitcher)humanArr[index]).pitcherClear();
		}else if(humanArr[index] instanceof Batter) {
			((Batter)humanArr[index]).batterClear();
		}
	}
	
	//검색
	public void select() {
		System.out.print("검색할 선수 : ");
		String name = sc.next();
		
		int[] indexs = allSearch(name);
		
		if(indexs == null) {
			System.out.println("검색하신 선수 명단에 존재하지 않습니다.");
		}else {
			System.out.println("검색하신 선수 명단입니다.");
			
			for (int i = 0; i < indexs.length; i++) {
				System.out.println(humanArr[indexs[i]]);
			}
		}
	}
	
	//수정
	public void update() {//TODO
		System.out.print("수정할 선수 이름 : ");
		String name = sc.next();
		
		int index = search(name);
		
		if(index == -1) {
			System.out.println("해당 선수의 정보가 존재하지 않습니다.");
			return;
		}
		
		if(humanArr[index] instanceof Pitcher) {
						System.out.print("수정하실 승전 : ");
						int win = sc.nextInt();
						
						System.out.print("수정하실 패전 : ");
						int loose = sc.nextInt();
						
						System.out.print("수정하실 방어율 : ");
						double defence = sc.nextInt();
						
						((Pitcher)humanArr[index]).setWin(win);
						((Pitcher)humanArr[index]).setLoose(loose);
						((Pitcher)humanArr[index]).setDefence(defence);
					}else if(humanArr[index] instanceof Batter) {
						System.out.print("수정하실 타수 : ");
						int bat = sc.nextInt();
						
						System.out.print("수정하실 안타수 : ");
						int hit = sc.nextInt();
						
						System.out.print("수정하실 타율 : ");
						double batCount = sc.nextInt();
						
						((Batter)humanArr[index]).setBat(bat);
						((Batter)humanArr[index]).setHit(hit);
						((Batter)humanArr[index]).setBatCount(batCount);
					}
				}

	//원하는 선수의 목록 찾기 - 리턴값 : 해당선수의 주소에 해당하는 index값  - TODO
	public int search(String name) {
		
		int index = -1;
		
		for (int i = 0; i < humanArr.length; i++) {
			if(humanArr[i] != null && !humanArr[i].getName().equals("")){
				if(humanArr[i].getName().equals(name)) {
						index = i;
					}
				}
		}
		
		return index;
	}
	
	//원하는 선수의 목록 찾기(+동명이인 포함) - 리턴값 : 해당선수 주소에 해당하는 index배열 -> TODO 부족한 부분
	public int[] allSearch(String name) {
		int[] indexs  = null;
		int count = 0;
		
		for (int i = 0; i < humanArr.length; i++) {
			if(humanArr[i] != null && !humanArr[i].getName().equals("")) {
				if(humanArr[i].getName().equals(name)) {
					count++;
				}
			}
		}
		
		if(count == 0) {
			System.out.println("해당 선수의 데이터가 존재하지 않습니다.");
			return null;
		}
		 
		indexs = new int[count];
		
		int j = 0;
		for (int i = 0; i < humanArr.length; i++) {
			if(humanArr[i] != null && !humanArr[i].getName().equals("")) {
				if(humanArr[i].getName().equals(name)) {
					indexs[j] = i;
					j++;
				}
			}
		}
		
		return indexs;
		
	}
	
	//데이터 저장(쓰기)//TODO
	public void save() {
		f = d.createFile("baseballMemeber");
		int len = 0;
		for (int i = 0; i < humanArr.length; i++) {
			if(humanArr[i] != null && !humanArr[i].getName().equals("")) {
				len++;//해당길이 안잡아주면 null도 같이 저장됨
			}
		}
		
		String hum_copy[] = new String[len];
		
		//배열복사
		for (int i = 0; i < humanArr.length; i++) {
			if(humanArr[i] != null && !humanArr[i].getName().equals("")) {
				hum_copy[i] = humanArr[i].toString();
			}
		}
		
		d.fileWriting(f, hum_copy);
		
	}
	
	//데이터 로드(읽기)
	public void load() {
		
		String datas[] = d.dataload();
		
		for (int i = 0; i < datas.length; i++) {
			String data[] = datas[i].split("-");
			int number = Integer.parseInt(data[0]);
						
			if(number < 2000) {	// 투수
				humanArr[i] = new Pitcher(	Integer.parseInt(data[0]), // 번호
										data[1], 					// 이름
										Integer.parseInt(data[2]), 	// 나이
										Double.parseDouble(data[3]), // 신장 
										Integer.parseInt(data[4]), // 승
										Integer.parseInt(data[5]), // 패	
										Double.parseDouble(data[6])); // 방어율
				
			}
			else {				// 타자
				humanArr[i] = new Batter(	Integer.parseInt(data[0]), // 번호
										data[1], 					// 이름
										Integer.parseInt(data[2]), 	// 나이
										Double.parseDouble(data[3]), // 신장 
										Integer.parseInt(data[4]), // 타수
										Integer.parseInt(data[5]), // 안타 수	
										Double.parseDouble(data[6])); // 타율
			}
		}
		
	}
	
	//모든 데이터 출력
	public void allPrint() {
		for (int i = 0; i < humanArr.length; i++) {
			System.out.println(humanArr[i]);
		}
	}
	
	
}
