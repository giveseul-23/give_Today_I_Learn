package thread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class CreateName extends Thread{
	Scanner sc = new Scanner(System.in);
	Socket clientSocket;
	String name;
	public CreateName(Socket clientSocket) {
		this.clientSocket = clientSocket;
	}

	@Override
	public void run() {
		super.run();
		
		try {
			while(true) {
				
				BufferedReader br = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
				name = br.readLine();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public String returnname() {
		return name;
	}
	
}
