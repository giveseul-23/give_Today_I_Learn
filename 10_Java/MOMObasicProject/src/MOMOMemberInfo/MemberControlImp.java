package MOMOMemberInfo;

public class MemberControlImp implements MembercontrolInter{
	private final MemberView memview;
	private MemberVo memvo;
	
	public MemberControlImp(MemberView memview) {
		this.memview = memview;
	}
	
	@Override
	public MemberVo join() {
		MemberVo memvo = memview.memberMenu();
		return memvo;
	}
	
	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addCash() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void index() {
		while(true) {
			String menuSelect = memview.index();
			
			if(menuSelect.equals("종료") ) {
				break;
			} else if("가입".equals(menuSelect)) {
				join();
			} else if("로그인".equals(menuSelect)) {
				memvo = login();
				if (memvo == null) {
					continue;
				}
				
				if ("USER".equals(memvo.getGrade())) {
					userMenu();
				} else if ("ADMIN".equals(memvo.getGrade())) {
					adminMenu();
				}
			}
			
		}
	}

	@Override
	public MemberVo login() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void userMenu() {
		
		
	}

	@Override
	public void adminMenu() {
		
		
	}
	
	
	
	
	
	
	
}
