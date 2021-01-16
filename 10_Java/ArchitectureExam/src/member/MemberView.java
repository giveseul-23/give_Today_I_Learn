package member;

import java.util.List;
import java.util.Scanner;

public class MemberView {
	private Scanner sc = new Scanner(System.in);
	
	public Member joinUI() {
		Member member = null;

		System.out.print("name : ");
		String name = sc.next();
		
		member = new Member(name);		
		
		return member;
	}

	public void printList(List<Member> findAll) {
		System.out.println(findAll);
	}

	public String loginMenu() {
		System.out.println("1.변경 2.충전 3.상태 4.로그아웃");
		return sc.next();
	}
}
