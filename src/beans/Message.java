package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
	
	
	public List<Map<String,Object>> receive(String id) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn =DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from message where receiver = ? order by senddate desc,content desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			List<Map<String,Object>> ret=new ArrayList<>();
			if(rs.next()) {
				do {
				Map<String,Object> one = new LinkedHashMap<>();
				one.put("code", rs.getString("code"));
				one.put("sender", rs.getString("sender"));
				one.put("receiver", rs.getString("receiver"));
				one.put("content", rs.getString("content"));
				one.put("senddate", rs.getDate("senddate"));
				one.put("receivedate", rs.getDate("receivedate"));
				ret.add(one);
				}while(rs.next());
			}else {
				ret=null;
			}
			conn.close();
			return ret;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	
	public int addreceivedate(String receiver) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		sdf.format(new Date(System.currentTimeMillis()));
				
		     
		 
		 
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "update message set receivedate = ? where receiver= ? and receivedate is null"; 
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1,new Date(System.currentTimeMillis()));
			ps.setString(2, receiver);
			
			
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패했내유");
			return -1;
		}
	}
	
	
	
	
	
	

	
	
	

}
