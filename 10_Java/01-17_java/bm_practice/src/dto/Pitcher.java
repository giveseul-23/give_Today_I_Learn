package dto;

public class Pitcher extends Human{
	private int win;
	private int loose;
	private double defence;
	
	public Pitcher() {
		
	}

	public Pitcher(int number, String name, int age, Double height, int win, int loose, double defence) {
		super(number, name, age, height);
		this.win = win;
		this.loose = loose;
		this.defence = defence;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLoose() {
		return loose;
	}

	public void setLoose(int loose) {
		this.loose = loose;
	}

	public double getDefence() {
		return defence;
	}

	public void setDefence(double defence) {
		this.defence = defence;
	}
	
	public void pitcherClear() {
		setNumber(0);
		setName("");
		setAge(0);
		setHeight(0.0);
		setWin(0);
		setLoose(0);
		setDefence(0);
	}
	
	@Override
	public String toString() {
		return super.toString() + " Pitcher " + win + "-" + loose + "-" + defence;
	}
	
	
}
