package Practice_list;

import java.util.ArrayList;

public class main {

	public static void main(String[] args) {
		/*
			/* ***********************
			1. 3명의 학생데이터(아이디,성명,국어,영어,수학)를 
			   StudentVO 클래스를 이용해서 만들고(저장하고)
			   2020111, "홍길동", 100, 90, 81
			   2020222, "이순신", 95, 88, 92
			   2020333, "김유신", 90, 87, 77
			2. List 타입의 변수(list)에 저장하고
			3. list에 있는 데이타를 사용해서 화면출력
			     성명     국어   영어  수학    총점     평균
			   --------------------------
			     홍길동  100  90  81  270  90.33
			   ...
			4. list에서 아이디(2020333) 수학점수를 80 점으로 수정하고
			   전체 데이터 다시 화면 출력   
			**************************/
		
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		list.add(new StudentVO("2020111", "홍길동", 100, 90, 81));
		list.add(new StudentVO("2020222", "이순신", 95, 88, 92));
		list.add(new StudentVO("2020333", "김유신", 90, 87, 77));
		
		System.out.println("성명     국어   영어  수학    총점     평균");
		System.out.println("--------------------------");
		for (StudentVO vo : list) {
			System.out.println(vo);
		}
		
		boolean b = false;
		String id = "2020333";
		int index = 0;
		
		for (int i = 0; i < list.size(); i++) {
			b = list.get(i).getId().equals(id);
			if(b==true) {
				index = i;
				break;
			}
			
		}
		
		if(b==true) {
			System.out.println(id+"가 list의 "+(index+1)+"위치에 존재합니다");
			list.get(index).setMath(80);
 			System.out.println(list.toString() + "\n");
		}else {
			System.out.println(id+"가 존재하지 않습니다.");
		}
	}

}
