package dto;

import dto.MemberDto;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class memdto_t {

	public static void main(String[] args) {
		
		ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
		
		//추가 - 3명
		MemberDto dto = new MemberDto(101, "홍길동", 24);
		memberList.add(dto);
		
		dto = new MemberDto(102, "성춘향", 16);
		memberList.add(dto);
		
		memberList.add(new MemberDto(103, "일지매", 25));
		
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println(memberList.get(i).toString());
		}
		
		//검색

		//이름
		String name = "성춘향";
		int findIndex = -1;
		for (int i = 0; i < memberList.size(); i++) {
			MemberDto m = memberList.get(i);
			if(name.equals(m.getName())) {
				findIndex = i;
				break;
			}
		}
		
		MemberDto m = memberList.get(findIndex);
		System.out.println("찾은 데이터 : "+m.toString());
		
		//나이 18세 이상 멤버
		List<MemberDto> findlist = new ArrayList<MemberDto>();
		
		for (int i = 0; i < memberList.size(); i++) {
			MemberDto mem = memberList.get(i);
			if(mem.getAge() >= 18) {
				findlist.add(mem);
			}
		}
		
		for (MemberDto mem : findlist) {
			System.out.println("18세 이상 찾은 데이터 : "+mem.toString());
		}
		
		System.out.println();
		
		//수정
		//01 -  전체 변경
		for (MemberDto mem : memberList) {
			System.out.println("현재 데이터 : "+mem.toString());
		}
		
		System.out.println();
		
		MemberDto uMem = new MemberDto(105, "정수동", 26);
		memberList.set(0, uMem);
		
		for (MemberDto mem : memberList) {
			System.out.println("수정된 데이터1 : "+mem.toString());
		}
		
		System.out.println();
		
		//02 - 일부분 수정 | call by reference
		MemberDto upMem = memberList.get(0);
		upMem.setName("임꺽정");
		
		for (MemberDto mem : memberList) {
			System.out.println("수정된 데이터2 : "+mem.toString());
		}
		
		System.out.println();
		
		//삭제
		memberList.remove(0);
		
		for (MemberDto mem : memberList) {
			System.out.println("삭제해서 남은 데이터 : "+mem.toString());
		}//0번째가 삭제됨
		
		MemberDto dDate = memberList.remove(0);
		//System.out.println(x);
		
		
		
		
	}

}
