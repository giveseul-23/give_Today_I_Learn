package com.mystudy.queue_stack;

import java.util.LinkedList;

public class Queue_Exam {

	public static void main(String[] args) {
		//큐(Queue) : 선입선출(FIFO : First In First Out)
		System.out.println("--------큐(Queue) : 선입선출(FIFO)---------");
		java.util.Queue<String> que = new LinkedList<>();
		que.offer("1.첫째"); //데이터 입력
		que.add("2.둘째"); //입력
		que.offer("3.셋째");
		System.out.println("que : "+ que);
		System.out.println("que.size() : "+que.size()); // 데이터의 개수
		
		System.out.println("\n----- peek() : 확인만 -----");
		System.out.println("que.peek() : " + que.peek()); //들여다 보는 것인데 가장 첫번째로 들어간 것만 보게된다.
		System.out.println("que.peek() : " + que.peek());
		//peek은 계속 출력하더라도 가장 첫번째에 있는 것만 들여다 볼 수 있다.
		
		System.out.println("\n----- poll() : 데이터 꺼내기 -----");
		System.out.println("que.poll() : "+ que.poll());
		System.out.println("que.poll() : "+ que.poll());
		System.out.println("que.poll() : "+ que.poll());
		System.out.println("que.poll() : "+ que.poll()); // 없다면 예외를 발생시키는 것이 아니라 null값을 리턴시킨다.
		//poll은 계속 출력한다면 하나씩 하나씩 꺼내서 본다고 생각하면 됨
		System.out.println("que.size() : "+que.size()); //모두 다 꺼낸 상태라면 데이터는 꺼낸 갯수만큼 줄어들어있다.
		
		System.out.println(que.isEmpty()); //비어있는지 여부 - boolean값 리턴
		//비어있을때 들여다본 경우
		System.out.println("que.peek() : " + que.peek()); // null 값을 리턴함
		
		System.out.println("\n----------Queue 전체 데이터 추출 isEmpty() 사용 ---------");
		que.offer("21.첫째");
		que.add("22. 둘째");
		que.add("23. 셋째");
		System.out.println("que.isEmpty() : " + que.isEmpty());
		
			//사이즈가 0보다 크다 라는 조건 또는 비어있지 않다면 이런 조건들을 사용할 수 있다.
		while(!(que.isEmpty())) { //비어있지 않다면
			System.out.println("que.poll() : " + que.poll());
		}
		
		System.out.println("\n----------Queue 전체 데이터 size() 사용---------");
		que.offer("31.첫째");
		que.add("32. 둘째");
		que.add("33. 셋째");
		System.out.println("que.size() : "+ que.size());
		
		while(que.size() > 0) {
			System.out.println("que.poll() : " + que.poll());
		}
		
		System.out.println("\n----------remove() 사용---------");
		que.offer("41.첫째");
		que.add("42. 둘째");
		que.add("43. 셋째");
		System.out.println("que.size() : "+ que.size());
		while(que.size() > 0) {
			System.out.println("que.remove()" + que.remove()); //remove()의 리턴값은 삭제된 데이터가 리턴됨(그 데이터가 String이라면 String을 리턴함)
		}
		System.out.println("que.size() : "+ que.size());
		
		System.out.println("que.remove()" + que.remove()); //데이터가 없는 상태에서 삭제 메서드를 쓴다면 예외를 발생시킨다. - poll과의 다른점, poll은 null을 리턴시킴
		//예외처리를 해주지 않는다면 그냥 여기서 시스템이 끝나버림
		
		System.out.println(">>main() 끝");
	
	}

}
