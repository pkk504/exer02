package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Account {

	// BaseResult 테이블에 연동하여 처리할 디비작업을 메서드로 구현해두자.
	
	
	//예를 들어, 전체 데이터 중에 랭킹 1위 데이터를 추출하는 메서드

	
	//예를 들어, 전체 데이터 중에 랭킹 1위 데이터를 추출하는 메서드
	public List<Map<String,Object>> getAllDatas() {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";
				
				
			
				try {
					Connection conn= 	DriverManager.getConnection(dburl, dbuser, dbpassword);
					String sql =  "select*from account" ;
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs=  ps.executeQuery(); 
					List<Map<String,Object>> ret;
					
					if(rs.next()) {
						ret= new ArrayList<>();
						do {
							Map<String,Object> one = new LinkedHashMap<>();
						one.put("id", rs.getString("id"));
						one.put("pass", rs.getString("pass"));
						one.put("name", rs.getString("name"));
						one.put("gender", rs.getString("gender"));
						
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
	

	
	public int addData(String id, String pass, String name, String gender) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into account values(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setString(4, gender);
			
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			
			return -1;
		}
	}
	
	public int addupData(String pass1, String id) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "update account set pass = ? where id=?"; 
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pass1);
			ps.setString(2, id);
			
			
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
			
	
	
	
