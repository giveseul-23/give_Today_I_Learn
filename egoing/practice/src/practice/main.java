package practice;

import java.math.BigInteger;

public class main {

	public static void main(String[] args) {
		/*
		 * func1();
		 * 
		 * func2();
		 * 
		 * func3();
		 */
		func4();
	}
	
	//(EX1 - ������ �ȿ� ���ǹ� (2,4,6,8 ���� 5���ϱ��� ���ϰ�, 3,5,7,9���� 6~9�������϶�))
	public static void func1() {
		for(int i=2; i<10; i++) {
			if(i%2 == 0) {
				for (int j = 1; j < 5; j++) {
					System.out.println(i + "*" + j +"="+i*j);
				}
			}else{
				for (int j = 6; j < 10; j++) {
					System.out.println(i + "*" + j +"="+i*j);
				}
			}
			
		}
	}
	
	//EX2 - 1~100������ �� / 1~100������ ��
	public static void func2() {
		int result = 0;
		for(int i=1; i<101; i++) {
			result += i;
		}
		System.out.println(result);
	}
	
	public static void func3() {
		BigInteger big = new BigInteger("1");
        for(int i=1; i<=100; i++){
            big = big.multiply(BigInteger.valueOf(i));
        }
        System.out.println(big);
	}
	
	//�����1
	public static void func4() {
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				if(i<=j) {
					System.out.print("*");
				}
			}
			System.out.println();
		}
	}
	

}
