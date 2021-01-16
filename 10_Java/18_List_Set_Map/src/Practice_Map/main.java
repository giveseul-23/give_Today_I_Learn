package Practice_Map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

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
			4. SET에서 아이디(2020333) 수학점수를 80 점으로 수정하고
			   전체 데이터 다시 화면 출력   
			**************************/
		
		HashMap<String, StudentVO> map = new HashMap<String, StudentVO>();
		
		map.put("2020111", new StudentVO("2020111", "홍길동", 100, 90, 81)); //(svo1.getId(), svo객체명)
		map.put("2020222", new StudentVO("2020222", "이순신", 95, 88, 92));
		map.put("2020333", new StudentVO("2020333", "김유신", 90, 87, 77));
		
		
		
		String id = "2020333";
		
		Iterator<String> ite = map.keySet().iterator();
		
		System.out.println("성명     국어   영어  수학    총점     평균");
		System.out.println("--------------------------");
		
		while(ite.hasNext()) {
			String key = ite.next();
			StudentVO vo = map.get(key);
			System.out.println(vo.toString());
		}
		
		/*
			다른방법
			map.get(id).setMath(80);
			-> 바로 다이렉트로 수정가능
		*/
		
		if(map.containsKey(id)) {
			System.out.println("해당 id가 존재합니다");
			StudentVO vo = map.get(id);
			vo.setMath(80);
			map.replace(id, vo);
		}
		
		System.out.println("수정완료.");
		
		/*
		  Set<String> keySet = map.keySet();
		  Iterator<String> ite = keySet.iterator();
		  
		*/
		//위 두 줄을 하나로 묶어서 사용가능
		Iterator<String> ite2 = map.keySet().iterator();
		
		while(ite2.hasNext()) {
			String key = ite2.next();
			StudentVO vo = map.get(key);
			System.out.println(vo.toString());
		}
	}

}
