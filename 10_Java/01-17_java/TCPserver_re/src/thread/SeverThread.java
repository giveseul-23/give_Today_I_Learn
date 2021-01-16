package thread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class SeverThread extends Thread{
	Scanner sc = new Scanner(System.in);
	
	Socket clientSocket;
	HashMap<Socket, String> map;
	
	public SeverThread(Socket clientSocket, HashMap<Socket, String> map) {
		this.clientSocket = clientSocket;
		this.map = map;
	}

	@Override
	public void run(){
		super.run();
		
		List<Socket> so_list = null;
		List<String> st_list = null;
		
		try {
			while(true) {
				//클라이언트에서 보낸것 확인 recv
				BufferedReader br = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
				String msg = br.readLine();	//실직적으로 받는 부분
		
//				System.out.println("클라이언트로부터 받은 메세지 : "+ msg);
								
				// 방법 1
				System.out.println(map.get(clientSocket) + ": " + msg);						
				for(Socket socket: map.keySet()) {
					if(clientSocket != socket) {
						PrintWriter pw = new PrintWriter(socket.getOutputStream());
						pw.println(map.get(socket) + ": " + msg);
						pw.flush();
					}
				}
				
				// 방법 2
				Iterator<Socket> ita = map.keySet().iterator();
				while(ita.hasNext()) {
					Socket key = ita.next();
					if(clientSocket != key) {
						System.out.println(map.get(key) + ": " + msg);
					}
				}			
				
				//send
				Iterator<Socket> it = map.keySet().iterator();
				
				while(it.hasNext()) {
					Socket key = it.next();
					so_list.add(key);
					
					String val = map.get(key);
					st_list.add(val);
					
				}
				
				for (int i = 0; i < so_list.size(); i++) {
					Socket s = so_list.get(i);
					
					if(s != clientSocket) {
						PrintWriter pw = new PrintWriter(s.getOutputStream());
						pw.println(st_list.get(i) + ":" + msg);
						pw.flush();
					}
				}
				
				Thread.sleep(500);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
}
