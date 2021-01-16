package main;

import dao.memberDao;

public class mainClass {

	public static void main(String[] args) {
		
		memberDao dao = new memberDao();
		
		dao.insert();
		dao.allPrint();
		
		dao.insert();
		dao.allPrint();
		
		//메뉴
		
	}

}
