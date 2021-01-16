package com.mystudy.jdbc3_vo;

import java.util.ArrayList;

public class StudentDAO_Test {

	public static void main(String[] args) {
		
		
		StudentDAO dao = new StudentDAO();
		System.out.println("--- 전체 데이터 조회 ---");
		ArrayList<StudentVO> list = dao.selectAll();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		
		/*
		StudentVO svo = dao.selectId("2020111");
		System.out.println(svo.toString());
		System.out.println("이름 : "+svo.getName());
		*/
		
		/*
		 * 	인서트 부분
			StudentVO student = new StudentVO("2020111", "홍길동1", 100, 90, 81);
			System.out.println("Student : "+ student);
			int result = dao.insertData(student);
			System.out.println("처리건수 : " + result);
		*/
		
		/*
		System.out.println("---------데이터 수정---------");
		//데이터 수정처리(업데이트부분)
		StudentVO studentUpd = dao.selectId("2020112");
		System.out.println("변경전 : "+ studentUpd);
		studentUpd.setKor(100);
		int result = dao.updateData(studentUpd);
		System.out.println("result : " + result);
		
		studentUpd = dao.selectId("2020112");
		System.out.println("변경후 : "+ studentUpd);
		*/
		
		/*
		System.out.println("---------데이터 삭제---------");
		int result = dao.deleteData("2020111");
		System.out.println("result : " + result);
		*/
	}

}
