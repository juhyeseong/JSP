package sales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.driver.OracleDriver;

public class SalesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private	String user = "c##itbank";
	private String password = "it";
	
	private	String className = OracleDriver.class.getName();
	
	public SalesDAO() {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<SalesDTO> selectAll() {
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		String sql = "select * from sales order by idx";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SalesDTO dto = new SalesDTO();
				
				dto.setCnt(rs.getInt("cnt"));
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setStatus(rs.getInt("status"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public int add(SalesDTO dto) {
		int row = 0;
		String sql = "insert into sales (name, price, cnt) values (?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setInt(3, dto.getCnt());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
	}
	
	public int changeStatus(String idx) {
		int row = 0;
		String sql = "update sales set status = decode(status, 1, 0, 0, 1) where idx=?";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
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
