package MOMOMemberInfo;

import java.util.Scanner;

public class MemberView {
	Scanner sc = new Scanner(System.in);
	
	MemberVo memvo;
	
	//시작메뉴
	public String index() {
		System.out.println("1.가입 2.로그인 3.종료");
		return sc.next();
	}
	
	//회원가입 메뉴
	public MemberVo memberMenu() {
		System.out.println("-----------회원가입-----------");
		System.out.print("ID : ");
		String id = sc.next();
		
		System.out.print("PW : ");
		String pw = sc.next();
		
		System.out.print("NAME : ");
		String name = sc.next();
		
		System.out.print("PHONE : ");
		String phone = sc.next();
		
		System.out.print("EMAIL : ");
		String email = sc.next();
		
		memvo = new MemberVo(id, pw, name, phone, email, "USER");
		
		return memvo;
		
	}
	
	//회원 로그인시 메뉴
	
	
}
