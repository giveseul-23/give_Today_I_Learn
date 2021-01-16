package dto;

public class Batter extends Human{
	
	int bat;
	int hit;
	double batCount;
	
	public Batter() {
		
	}
	
	public Batter(int number, String name, int age, Double height, int bat, int hit, double batCount) {
		super(number, name, age, height);
		this.bat = bat;
		this.hit = hit;
		this.batCount = batCount;
	}

	public int getBat() {
		return bat;
	}

	public void setBat(int bat) {
		this.bat = bat;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public double getBatCount() {
		return batCount;
	}

	public void setBatCount(double batCount) {
		this.batCount = batCount;
	}
	
	//삭제메서드
		public void batterClear() {
			setNumber(0);
			setName("");
			setAge(0);
			setHeight(0.0);
			setHit(0);
			setBat(0);
			setBatCount(0.0);
		}
	
	@Override
	public String toString() {
		return super.toString()+ " Batter " + bat + "-" + hit + "-" + batCount;
	}
	
	
	
}
