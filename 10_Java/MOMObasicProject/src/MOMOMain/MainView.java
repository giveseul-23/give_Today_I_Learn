package MOMOMain;

import java.util.Scanner;

public class MainView {
	
	Scanner sc = new Scanner(System.in);
	
	//첫번째 화면
	public String MainMenu() {
		String select;
		
		System.out.println("원하시는 메뉴를 선택하세요.");
		System.out.println("1. 회원가입 | 2. 로그인 | 3. 종료");
		
		select = sc.next();
		
		return select;
	}
	
	
	
}
