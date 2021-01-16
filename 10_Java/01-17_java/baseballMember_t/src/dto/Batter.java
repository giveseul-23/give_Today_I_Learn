package dto;

public class Batter extends Human{
	
	private int batCount;	//타수
	private int hit;	//안타수
	private double hitAvg;	//타율
	
	public Batter() {
		
	}
	
	public Batter(int number, String name, int age, double height, int batCount, int hit, double hitAvg) {
		super(number, name, age, height);
		this.batCount = batCount;
		this.hit = hit;
		this.hitAvg = hitAvg;
	}


	public int getBatCount() {
		return batCount;
	}


	public void setBatCount(int batCount) {
		this.batCount = batCount;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}


	public double getHitAvg() {
		return hitAvg;
	}


	public void setHitAvg(double hitAvg) {
		this.hitAvg = hitAvg;
	}
	
	//삭제메서드
	public void batterClear() {
		setNumber(0);
		setName("");
		setAge(0);
		setHeight(0);
		setHit(0);
		setBatCount(0);
		setHitAvg(0);
	}

	@Override
	public String toString() {
		return "Batter [batCount=" + batCount + ", hit=" + hit + ", hitAvg=" + hitAvg + "]";
	}
	
	
	
}
