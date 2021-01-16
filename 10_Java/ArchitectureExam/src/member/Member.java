package member;

public class Member {
	private String name;

	public Member(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + "]";
	}

	public String getName() {
		return name;
	}
	
}
