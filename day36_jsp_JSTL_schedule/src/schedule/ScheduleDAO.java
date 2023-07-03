package schedule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.driver.OracleDriver;

public class ScheduleDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private	String password = "it";
	
	private String className = OracleDriver.class.getName();
	
	public ScheduleDAO() {
		try {
			Class.forName(className);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ScheduleDTO> selectAll() {
		ArrayList<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
		String sql = "select * from schedule order by idx";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int row = 0;
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setMemo(rs.getString("memo"));
				dto.setSdate(rs.getString("sdate"));
				dto.setTitle(rs.getString("title"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public int add(ScheduleDTO dto) {
		int row = 0;
		String sql = "insert into schedule(sdate, title, memo) values(?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSdate());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getMemo());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete schedule where idx=?";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close();		}	catch(Exception e) {}
		try { if(pstmt != null) pstmt.close();		}	catch(Exception e) {}
		try { if(conn != null) 	conn.close();		}	catch(Exception e) {}
	}
}
