package member;

import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	
	List<Member> list = new ArrayList<Member>();
	
	public String addMember(Member member) {
		list.add(member);
		return member.getName();
	}

	public List<Member> findAll() {
		return list;
		
	}
}
