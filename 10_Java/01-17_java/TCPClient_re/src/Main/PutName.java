package Main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

public class PutName extends Thread{
	Socket socket;
	
	public PutName(Socket socket) {
		this.socket = socket;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		try {
			
				BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
				String tance = br.readLine();
				System.out.println(tance);
				
				Thread.sleep(300);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
