package Practice_list;

/*
  	자바빈(Java Bean) - 규칙
  	1. 멤버변수(property)의 접근제한자는 private - 외부에서 접근할 수 없도록 함
  	2. 멤버변수 마다 get/set 메서드 제공(선택적으로 get만 제공)
  	3. 게터 세터 메서드는 public
  	4. get 메서드는 파라미터 없고, set 메서드 하나 이상의 파라미터 존재
  	5. 멤버변수(property)가 boolean타입이면 get 메서드 대신 is 메서드 사용가능
*/

//VO(Value Object) : 값(데이터)를 저장하기 위한 클래스, 객체(xxxVO, XXXVo)
//DTO(Data Transfer Object) : 값을 서로 전달하기 위한 목적(xxxDTO, XXXDto)
//VO를 많이 사용
public class StudentVO {
	private String id; //필드, 멤버변수, 인스턴스 변수, 속성(property)
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot; //tot,avg는 이 클래스 내에 메서드를 만들어서 만들어주는 방법도 있다
	private double avg;
	
	
	public StudentVO() {
		
	}
	
	public StudentVO(String id, String name, int kor, int eng, int math) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		conmputeTotAvg();
	}
	
	public StudentVO(String id, String name, int kor, int eng, int math, int tot, double avg) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		conmputeTotAvg();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
		conmputeTotAvg(); //kor의 값이 바뀔 수도 있으니 여기에 메서드를 추가
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
		conmputeTotAvg();
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
		conmputeTotAvg();
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	private void computeTot() {
		tot = kor + eng + math;
	}
	
	private void computeAvg() {
		avg = tot * 100 / 3 / 100.0; //소수점 둘째자리까지 구해주는 식 //10이면 소수점 첫째자리까지
	}
	
	private void conmputeTotAvg() {
		computeTot();
		computeAvg();
	}

	@Override
	public String toString() {
		return name+" "+kor+" "+eng+" "+math+" "+tot+" "+avg;
	}
	
	
}
