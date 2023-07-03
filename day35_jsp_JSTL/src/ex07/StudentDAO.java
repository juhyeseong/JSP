package ex07;

import java.sql.Connection;
import java.sql.DriverManager;
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
	
	public ArrayList<StudentDTO> search(String param) throws SQLException {
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		String sql = "select * from student "
					+ "where name like '%%%s%%' "
					+ "order by name";
		sql = String.format(sql, param);
		
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
}
