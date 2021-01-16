import main.MainController;
import main.MainView;
import member.MemberControllerImpl;
import member.MemberDao;
import member.MemberView;

public class ArchitectureStart {
	public static void main(String[] args) {
		
		ApplicationConfig ac = new ApplicationConfig();
		ac.getMainController().menu();
	}
}
