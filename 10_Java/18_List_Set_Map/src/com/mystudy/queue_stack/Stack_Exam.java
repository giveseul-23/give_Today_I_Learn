package com.mystudy.queue_stack;

import java.util.Stack;

public class Stack_Exam {

	public static void main(String[] args) {
		System.out.println("-----스탭(Stack : LIFO : 후입선출 ----)");
		Stack<String> st = new Stack<String>();
		//입력
		st.push("1. 첫째");
		st.push("2. 둘째");
		st.add("3. 셋째");
		System.out.println("st : " + st);
		
		System.out.println("st.size() : " + st.size());
		System.out.println(st.empty()); //isEmpty() (-> 상속된 vector의 메서드)는 사용은 할 수 있지만 stack 형태로 사용한다면 stack 메서드인 empty()를 사용하는 것이 더 맞는 방법이다.
		
		//현재 접근가능한 데이터만 볼 수 있음 - 참조같은 느낌
		System.out.println("st.peek() : " + st.peek());
		System.out.println("st.peek() : " + st.peek());
		System.out.println("st.peek() : " + st.peek());
		System.out.println("st.size() : " + st.size()); // 꺼내는 것이 아니라 사이즈에 영향을 주지 않는다.
		
		System.out.println("-------pop() : 데이터 꺼내기 --------");
		System.out.println("st.pop() : " + st.pop());
		System.out.println("st.pop() : " + st.pop());
		System.out.println("st.pop() : " + st.pop());
		//System.out.println("st.pop() : " + st.pop()); // 데이터가 없으면 예외를 발생시킴
		
		System.out.println("st.size() : " + st.size());
		
		System.out.println("\n---스택(Stack) 전체 데이터 사용----");
		System.out.println("st.empty() : " + st.empty()); 
		System.out.println("st.isEmpty() : "+st.isEmpty()); 
		System.out.println("st.size() : " + st.size());
		
		//입력
		st.push("21. 첫째");
		st.push("22. 둘째");
		st.add("23. 셋째");
		
		System.out.println("st.empty() : " + st.empty());
		while(!st.empty()) { //스택이 비어있지 않으면
			System.out.println("st.pop() : " + st.pop());
		}
		System.out.println("st.empty() : " + st.empty());
	}

}
