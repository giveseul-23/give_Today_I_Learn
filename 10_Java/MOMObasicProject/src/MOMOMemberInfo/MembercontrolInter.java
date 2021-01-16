package MOMOMemberInfo;

public interface MembercontrolInter {
	//가입
	public MemberVo join();
	//회원정보 수정
	public String update();
	//충전
	public int addCash();
	
	//메뉴
	public void index();
	
	public MemberVo login();
	
	public void userMenu();
	
	public void adminMenu();
}


