package main;

import java.util.Scanner;

public class MainView {
	Scanner sc = new Scanner(System.in);
	
	public String menu() {
		System.out.println("1.회원가입 2.회원조회 3.종료 4.관리자로그인 5.회원로그인");
		int select = Integer.parseInt(sc.next());
		String result = null;
		switch (select) {
		case 1:
			result = "가입";			
			break;
		case 2:
			result = "조회";
			break;
		case 3:
			result = "종료";
			break;
		case 4:
			result = "관리자로그인";
			break;
		case 5:
			result = "회원로그인";
			break;
		}
		return result;
	}
}
