package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import thread.CreateName;
import thread.SeverThread;

public class MainClass {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		Socket clientSocket1 = null;	//소켓2
		//List<Socket> list = new ArrayList<Socket>();
		
		HashMap<Socket, String> map = null;
		
		
		try {
			//문지기 소켓
			ServerSocket servSocket = new ServerSocket(9000);	//소켓1
			//IP, Port, binding, listen
			
			while(true) {
				
				System.out.println("접속 대기중...");
				clientSocket1 = servSocket.accept();
				
				//list.add(clientSocket1); //리스트에 다른 클라이언트를 모아줘서 클라이언트들이 서버에 보낸 글자를 다른 클라이언트에게 보내주기 위해서
				PrintWriter pw = new PrintWriter(clientSocket1.getOutputStream());
				BufferedReader br = new BufferedReader(new InputStreamReader(clientSocket1.getInputStream()));
				
				pw.println("닉네임 입력 해 주세요 : ");
				pw.flush();
				
				String name = br.readLine();
				
				pw.println(name+"님 환영합니다!");
				pw.flush();
				
				map.put(clientSocket1, name);
				
				new SeverThread(clientSocket1, map);
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}	
