package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import oracle.jdbc.driver.OracleDriver;

// DAO : Data Access Object
// 저장된 데이터에 접근하여 (데이터베이스에 접근하여)
// 조회, 추가, 수정, 삭제 등을 수행하는 객체
// 각 기능은 함수로 구현한다
// DB에 접근할 수 있는 JDBC요소가 포함되어야 한다

public class StudentDAO {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private String className = OracleDriver.class.getName();
	
	public StudentDAO() throws Exception {
		Class.forName(className);
	}
	
	// 접속 확인
	public String test() throws SQLException {
		String result = null;
		String sql = "select banner from v$version";

		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			result = rs.getString("banner");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return result;
	}
	
	// 전체 목록 불러오기 (이름 순)
	public ArrayList<StudentDTO> selectAll() throws SQLException {
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		String sql = "select * from student order by name";
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			StudentDTO dto = new StudentDTO();
			
			dto.setAge(rs.getInt("age"));
			dto.setGender(rs.getString("gender"));
			dto.setName(rs.getString("name"));
			
			list.add(dto);
		}
		
		return list;
	}
	
	// 추가
	public int insert(StudentDTO dto) throws SQLException {
		int row = 0;
		String sql = "insert into student values('%s', %d, '%s')";
		sql = String.format(sql, dto.getName(), dto.getAge(), dto.getGender());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		
		// ResultSet executeQuery(String sql) { ... }	// select
		// int executeUpdate(String sql) { ... } 		// insert, update, delete
		
		return row;
	}
	
	public int delete(String name) throws SQLException {
		int row = 0;
		String sql = "delete student where name='%s'";
		sql = String.format(sql, name);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
		
		// JDBC에서는 auto commit이 기본이다
		// SQLDeveloper에서는 commit 혹은 rollback을 해야 트랜잭션이 종료된다
		
		return row;
	}
	
	public StudentDTO selectOne(String name) throws SQLException {
		StudentDTO dto = null;
		String sql = "select * from student where name='%s'";
		sql = String.format(sql, name);
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			dto = new StudentDTO();
			
			dto.setAge(rs.getInt("age"));
			dto.setGender(rs.getString("gender"));
			dto.setName(rs.getString("name"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return dto;
	}
	
	public int update(StudentDTO dto) throws SQLException {
		int row = 0;
		String sql = "update student set " + 
						"age=%d, gender='%s'"  + 
						"where name='%s'";
		sql = String.format(sql, dto.getAge(), dto.getGender(), dto.getName());
		
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.createStatement();
		row = stmt.executeUpdate(sql);
		
		return row;
	}
}
