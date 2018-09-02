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

public class BaseResultDAO {

	// BaseResult 테이블에 연동하여 처리할 디비작업을 메서드로 구현해두자.
	
	
	//예를 들어, 전체 데이터 중에 랭킹 1위 데이터를 추출하는 메서드
	public Map<String,Object> getRankTopData() {
String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		
		String user="dev";
		String password="alcls504"; 
	
		try {
			Connection conn= 	DriverManager.getConnection(url, user, password);
			String sql =  "select*from baseresult order by tried asc,elapsed asc" ;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs=  ps.executeQuery(); 
			
			Map ret;
			if(rs.next()) {
				ret=new LinkedHashMap<>();
				ret.put("serial", rs.getString("serial"));
				ret.put("player", rs.getString("player"));
				ret.put("tried", rs.getString("tried"));
				ret.put("elapsed", rs.getString("elapsed"));
				ret.put("logdate", rs.getString("logdate"));
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
	
	
	//예를 들어, 전체 데이터 중에 랭킹 1위 데이터를 추출하는 메서드
	public List<Map<String,Object>> getAllDatas() {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";
				
				
			
				try {
					Connection conn= 	DriverManager.getConnection(dburl, dbuser, dbpassword);
					String sql =  "select*from baseresult order by tried asc,elapsed asc" ;
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs=  ps.executeQuery(); 
					List<Map<String,Object>> ret;
					
					if(rs.next()) {
						ret= new ArrayList<>();
						do {
							Map<String,Object> one = new LinkedHashMap<>();
						one.put("serial", rs.getString("serial"));
						one.put("player", rs.getString("player"));
						one.put("tried", rs.getString("tried"));
						one.put("elapsed", rs.getString("elapsed"));
						one.put("logdate", rs.getString("logdate"));
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
	
	//예를 들어, 데이터 하나를 추가하는 메서드
	public int addData(Map param/*String serial,String user, int cnt, double elapsed, Date now*/) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into baseresult values(?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, (String)param.get("serial"));
			ps.setString(2,(String)param.get("user"));
			ps.setInt(3, (int)param.get("tried"));
			ps.setDouble(4, (double)param.get("elapsed"));
			ps.setDate(5, (Date)param.get("logdate"));
			int n = ps.executeUpdate(); // send → receive 작업을 함.

			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int addData(String serial, String user, int cnt, double elapsed, Date logdate) {
		String dburl = "jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		String dbuser = "dev";
		String dbpassword = "alcls504";
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into baseresult values(?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			ps.setString(2, user);
			ps.setInt(3, cnt);
			ps.setDouble(4, elapsed);
			ps.setDate(5, logdate);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
			
	
	
	
	
	
	
	
	
	
	
}
