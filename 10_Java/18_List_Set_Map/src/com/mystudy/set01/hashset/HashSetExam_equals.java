package com.mystudy.set01.hashset;

import java.util.HashSet;

class Person{
		String name; //이름
		int age; //나이
		String jumin;//주민번호
		
		
		public Person(String name, int age, String jumin) {
			super();
			this.name = name;
			this.age = age;
			this.jumin = jumin;
		}


		@Override
		public String toString() {
			return "Person [name=" + name + ", age=" + age + ", jumin=" + jumin + "]";
		}

		
		//jumin 주민번호가 동일하면 같은 객체로 인식하고 하나만 출력하게 함
		
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((jumin == null) ? 0 : jumin.hashCode());
			return result;
		}


		@Override
		public boolean equals(Object obj) { 
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Person other = (Person) obj;
			if (jumin == null) {
				if (other.jumin != null)
					return false;
			} else if (!jumin.equals(other.jumin))
				return false;
			return true;
		} 
		
}

public class HashSetExam_equals {

	public static void main(String[] args) {
		//Set은 중복데이터를 하나만 저장(중복 데이터 허용 안함)
		//참조형 데이터의 동일 데이터 여부는 equals 메소드 기준
		//equals() 메서드 재정의(override)하고, hashCode() 함께 재정의 함
		//비교순서 : hashCode() 값 비교 후 같으면 equals() 비교
		
		HashSet<Person> persons = new HashSet<Person>();
		Person p = new Person("홍길동", 27, "950101-1234567");
		Person p2 = new Person("홍길동", 30, "950101-1234567"); //hashcode와 equals 때문에 이 부분은 같은 객체라고 정의하고 출력되지 않는다
		
		persons.add(p);
		persons.add(p2);
		
		persons.add(new Person("홍길동", 27, "951111-1234567"));
		System.out.println(persons);
	}

}
