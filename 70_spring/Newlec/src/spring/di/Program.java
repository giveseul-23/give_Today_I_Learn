package spring.di;

import spring.di.entity.Exam;
import spring.di.entity.NewlecExam;
import spring.di.ui.ExamConsole;
import spring.di.ui.GridExamConsole;
import spring.di.ui.InlineExamConsole;

public class Program {
	public static void main(String[] args) {
		
		Exam exam = new NewlecExam();
		//ExamConsole console = new InlineExamConsole(exam); //DI
		ExamConsole console = new GridExamConsole(exam);
		/*
		  	DI하는 객체를 아래 객체(new GridExamConsole(exam);)로 변경한다면?
		  	"소스코드 수정없이" 가능하게 하려면?
		  	ExamConsole console = new GridExamConsole(exam);
		  	> 이 부분이 내부에서 변경되게 해야하는데 저 설정을 빼서 조립해주는 작업을 Spring을 통해 해결함
		*/
		console.print();
	}
}
