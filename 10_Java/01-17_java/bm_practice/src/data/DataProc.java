package data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class DataProc {
	
	File f;
	
	public DataProc() {
		
	}
	
	//파일생성
	public File createFile(String filename) {
		f = new File("C:\\JAVAP\\test"+filename+".txt");
		
		try {
			if(f.createNewFile()) {
				System.out.println("파일생성 성공");
			}else {
				System.out.println("파일생성 실패");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(f.exists()) {
			System.out.println("파일이 존재합니다.");
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		
		return f;
	}
	
	//파일쓰기
	public void fileWriting(File f, String arr[]) {
		try {
			PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(f)));
			
			for (int i = 0; i < arr.length; i++) {
				pw.println(arr[i]);
			}
			
			pw.close();
		} catch (IOException e) {
			System.out.println("파일쓰기 실패");
		}
	}
	
	//파일읽기
	public String[] dataload() {
		String datas[] = null;
		
		try {
			BufferedReader br = new BufferedReader(new FileReader(f));
			
			// data의 수를 조사
			int count = 0;
			String str = "";
			
			while((str = br.readLine()) != null) {
				count++;					
			}
			br.close();
			
			if(count == 0) {				
				return null;
			}
			
			// 동적할당
			datas = new String[count];
			
			// data를 저장
			br = new BufferedReader(new FileReader(f));
			int j = 0;
			while((str = br.readLine()) != null) {
				datas[j] = str;
				j++;
			}
			br.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return datas;
		
		
		
	}
	
}
