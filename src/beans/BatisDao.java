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
 * mybatis �� ���ؼ� DB ó���� �Ҷ���, Connection ��� ���� ���Ѵ�.
 * mybatis ���ü�� ���� ����ϸ� �ȴ�.
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
		SqlSession sql=factory.openSession(); //JDBC�� Connect�����̶� �����.
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
			sql.commit();
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map getondata(int no) {
		SqlSession sql = factory.openSession();
		try {
			/*sql.selectOne("board.getOnData",no);*/
			return sql.selectOne("board.getOnData",no);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int goodUp(int no) {
		SqlSession sql =factory.openSession();
		try{
		int r=	sql.update("board.incGood",no);
		
			System.out.println(r);
		sql.commit();
		return r; 
		}catch(Exception e) {
			e.printStackTrace();
			
			System.out.println("����");
			return -1;
		}
		
		
	}
	
	public int addgoodlog(Map map) {
		SqlSession sql =factory.openSession();
		try {
			int r = sql.insert("board.addDataUsingMap",map);
			if(r==1)
				sql.commit();
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public int uplogby(String ii) {
		
		SqlSession sql =factory.openSession();
		try {
			
				
			int	a =sql.selectOne("board.getSomeDataByActor",ii);
				
			return a;
				
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	

	
	
	/*
	
	 
	 
	public List<Map> getAllResult(){ //07.jsp
		SqlSession sql=factory.openSession(); //JDBC�� Connect�����̶� �����.
		try {
			//select statement�� �ΰ��� ������� ȣ���� �Ѵ�.
			//selecOne (��밪�� �ְų� ���ų�) =>resultType 
			//selectList(����ϴ� �������� ������ ������) =>List<resultType>
			List<Map> p=sql.selectList("baseresult.getAllDataUsingMap");
			//selectList �� ���� ��쿣, �̰� �����Ͱ� ���ٸ� size 0¥�� List�� ��ȯ
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	 
	 public int addBaseResult(Map param) {
		SqlSession sql=factory.openSession(); //JDBC�� Connect�����̶� �����.
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
		SqlSession sql=factory.openSession(); //JDBC�� Connect�����̶� �����.
		try {
			//select statement�� �ΰ��� ������� ȣ���� �Ѵ�.
			//selecOne (��밪�� �ְų� ���ų�) =>resultType 
			//selectList(����ϴ� �������� ������ ������) =>List<resultType>
			Map p=sql.selectOne("baseresult.getOneDataUsingMap");
			//selectOne �� ���� ��쿣, �̰� �����Ͱ� ���ٸ� null�� ��ȯ
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int addTrash(String data) {
		SqlSession sql=factory.openSession(); //JDBC�� Connect�����̶� �����.
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
