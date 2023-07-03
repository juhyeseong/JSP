package phonebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PhoneBookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static PhoneBookDAO instance = new PhoneBookDAO();
	
	public static PhoneBookDAO getInstance() {
		return instance;
	}
	
	private PhoneBookDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("DAO 생성자 예외 발생 : " + e);
		}
	}
	
	public PhoneBookDTO mapping(ResultSet rs) throws SQLException {
		PhoneBookDTO dto = new PhoneBookDTO();
		
		dto.setFavorites(rs.getInt("favorites"));
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPhoneNumber(rs.getString("phoneNumber"));
		
		return dto;
	}
	
	public void close() {
		 try { if(rs != null)     	rs.close();  	} catch (Exception e) { } 
		 try { if(pstmt != null)  	pstmt.close();  } catch (Exception e) { } 
		 try { if(conn != null)   	conn.close();  	} catch (Exception e) { } 
	}
	
	public List<PhoneBookDTO> selectAll() {
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		String sql = "select * from phonebook order by favorites desc, idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PhoneBookDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public int add(String name, String phoneNumber) {
		int row = 0;
		String sql = "insert into " + 
				 		"phonebook(name, phoneNumber) " + 
				 		"values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phoneNumber);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally { close(); }
		
		
		return row;
	}
	
	public PhoneBookDTO selectOne(int idx) {
		PhoneBookDTO dto = null;
		String sql = "select * from phonebook where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = mapping(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return dto;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete phonebook where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally { close(); }
		
		
		return row;
	}
	
	public int update(PhoneBookDTO dto) {
		int row = 0;
		String sql = "update phonebook set " + 
				"name=?, phonenumber=? " + 
				"where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhoneNumber());
			pstmt.setInt(3, dto.getIdx());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally { close(); }
		
		
		return row;
	}
	
	public int chageFavorites(int idx) {
		int row = 0;
		String sql = "update phonebook set favorites = decode(favorites, 1, 0, 0, 1) where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally { close(); }
		
		
		return row;
	}
	
	public List<PhoneBookDTO> search(String search) {
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		String sql = "select * from phonebook where name like '%%%s%%' "
				+ "order by favorites desc, idx";
		sql = String.format(sql, search);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PhoneBookDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
}
