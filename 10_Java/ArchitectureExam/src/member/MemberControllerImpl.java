package member;

import java.util.List;

public class MemberControllerImpl implements MemberController {
	private final MemberView view;
	private final MemberDao dao;
	
	public MemberControllerImpl(MemberView view, MemberDao dao) {
		this.view = view;
		this.dao = dao;
	}

	public void join() {		
		Member member = view.joinUI();
		dao.addMember(member);		
	}

	public void searchAll() {
		List<Member> findAll = dao.findAll();
		view.printList(findAll);		
	}

	@Override
	public void login() {
		while(true) {
			String menu = view.loginMenu();
			if("로그아웃".equals(menu)) {
				break;
			}
		}
		
	}	
}
