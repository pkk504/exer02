package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * mybatis 를 통해서 DB 처리를 할때는, Connection 제어를 직업 안한다.
 * mybatis 제어객체만 만들어서 사용하면 된다.
 * 
 */


public class BatisDao {
	SqlSessionFactory factory;
	public BatisDao() throws IOException {
		SqlSessionFactoryBuilder builder =new SqlSessionFactoryBuilder();
		InputStream is =Resources.getResourceAsStream("mybatis-config.xml");
		factory =builder.build(is);
	
	}
	
	public int addboard(Map param) {
		SqlSession sql=factory.openSession(); //JDBC의 Connect과정이랑 비슷함.
		try {
		int r=sql.insert("board.addBoard",param);
		if(r==1)
			sql.commit();
		return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	
	}
	public List<Map> getAllresult(){
		SqlSession sql = factory.openSession();
		try {
			List<Map> p =sql.selectList("board.getAllBoard");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		
	}
	
	public String getNodata() {
		SqlSession sql = factory.openSession();
		try {
			String p = sql.selectOne("board.getNo");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	/*
	
	 
	 
	public List<Map> getAllResult(){ //07.jsp
		SqlSession sql=factory.openSession(); //JDBC의 Connect과정이랑 비슷함.
		try {
			//select statement는 두가지 방식으로 호출을 한다.
			//selecOne (기대값이 있거나 없거나) =>resultType 
			//selectList(기대하는 데이터의 개수가 여러개) =>List<resultType>
			List<Map> p=sql.selectList("baseresult.getAllDataUsingMap");
			//selectList 로 쓰는 경우엔, 이게 데이터가 없다면 size 0짜리 List를 반환
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	 
	 public int addBaseResult(Map param) {
		SqlSession sql=factory.openSession(); //JDBC의 Connect과정이랑 비슷함.
		try {
		int r=sql.insert("baseresult.addDataUsingMap",param);
		if(r==1)
			sql.commit();
		return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
	}
	
	
	
	
	
	public Map getOneResult(String s){ //07.jsp
		SqlSession sql=factory.openSession(); //JDBC의 Connect과정이랑 비슷함.
		try {
			//select statement는 두가지 방식으로 호출을 한다.
			//selecOne (기대값이 있거나 없거나) =>resultType 
			//selectList(기대하는 데이터의 개수가 여러개) =>List<resultType>
			Map p=sql.selectOne("baseresult.getOneDataUsingMap");
			//selectOne 로 쓰는 경우엔, 이게 데이터가 없다면 null을 반환
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int addTrash(String data) {
		SqlSession sql=factory.openSession(); //JDBC의 Connect과정이랑 비슷함.
		try {
		int r=sql.insert("baseresult.addTrash",data);
		if(r==1)
			sql.commit();
		return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
