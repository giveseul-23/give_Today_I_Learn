package mainClass;

import dao.MemberDao;

public class MainClass {

	public static void main(String[] args) {
		 
		MemberDao dao = new MemberDao(10);
		
		//dao.insert();
		//dao.insert();
//		dao.allPrint();
//		System.out.println("==================");
//		dao.update();
//		System.out.println("==================");
//		dao.allPrint();
//		dao.save();
		dao.allPrint();
		
	}

}
