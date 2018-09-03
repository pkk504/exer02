package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Date;

public class Message {
	public int addData(String code, String sender, String  receiver, String content ,Date senddate) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into message(code,sender,receiver,content,senddate) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, sender);
			ps.setString(3, receiver);
			ps.setString(4, content);
			ps.setDate(5, senddate );
		
			
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}

}
