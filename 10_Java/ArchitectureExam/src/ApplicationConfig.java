import main.MainController;
import main.MainView;
import member.MemberController;
import member.MemberControllerImpl;
import member.MemberDao;
import member.MemberView;

public class ApplicationConfig {
	
	private final MainController mainController;
	
	public ApplicationConfig() {
		MemberView memberView = new MemberView();
		MemberDao memberDao = new MemberDao();
		MemberController memCo = new MemberControllerImpl(memberView, memberDao);
		
		MainView mainView = new MainView();
		mainController = new MainController(mainView, memCo);
	}
	
	public MainController getMainController() {
		return mainController;
	}
}
