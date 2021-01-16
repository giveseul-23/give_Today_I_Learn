package main;

import member.MemberController;

public class MainController {
	private final MainView mainView;
	private final MemberController memberController;
	
	public MainController(MainView view, MemberController memberController) {
		this.mainView = view;
		this.memberController = memberController;
	}

	public void menu() {
		while(true) {
			String select = mainView.menu();
			
			if("가입".equals(select)) {
				memberController.join();
			} else if("조회".equals(select)) {
				memberController.searchAll();
			} else if("종료".equals(select)) {
				break;
			} else if("관리자로그인".equals(select)) {
				adminMenu();		
			} else if("회원로그인".equals(select)) {
				memberController.login();
			}
		}
	}
	
	public void adminMenu() {
		
	}
}
