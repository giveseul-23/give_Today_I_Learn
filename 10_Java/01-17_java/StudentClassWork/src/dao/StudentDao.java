package dao;

import java.util.Scanner;

import student.Student;

public class StudentDao {
	Scanner sc = new Scanner(System.in);
	
	Student studentArr[] = null;
	private int memberNumber;
	
	Student is = new Student();
	
	//배열의 갯수는 외부에서 들어옴
	public StudentDao(int count) {
		studentArr = new Student[count];
	}
	
	//CRUD - 추가, 삭제, 검색, 수정
	public void insert() {	//create
			System.out.print("학생번호를 입력하세요 : ");
			int num = sc.nextInt();
			is.setNumber(num);
			
			System.out.print("학생이름을 입력하세요 : ");
			String name = sc.next();
			is.setName(name);
			
			System.out.print("국어점수를 입력하세요 : ");
			int lang = sc.nextInt();
			is.setLang(lang);
			
			System.out.print("수학점수를 입력하세요 : ");
			int math = sc.nextInt();
			is.setMath(math);
			
			System.out.print("영어점수를 입력하세요 : ");
			int eng = sc.nextInt();
			is.setEng(eng);
			
			studentArr[memberNumber] = new Student(num, name, lang, math, eng);
			
			memberNumber++;
		
	}
	
	public void delete() {	//삭제
		System.out.print("어떤 학생의 정보를 삭제하시겠습니까 = ");
		String inputInfo = sc.next();
		
		for (int i = 0; i < studentArr.length; i++) {
			if(inputInfo.equals(studentArr[i].getName())) {
				studentArr[i] = null;
				System.out.println("해당정보를 삭제하였습니다.");
			}
		}
		
	}
	
	public void select() { //search
		
	}
	
	public void update() { //수정
		
	}
}
