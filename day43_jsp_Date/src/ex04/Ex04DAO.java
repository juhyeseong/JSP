package ex04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Ex04DAO {
	private Connection conn;
	private	PreparedStatement pstmt;
	private	ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static Ex04DAO instance = new Ex04DAO();
	
	public static Ex04DAO getInstance() {
		return instance;
	}
	
	public Ex04DAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				banner = rs.getString("banner");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		return banner;
	}
	
	public java.sql.Date getDate(String parameter) {
		java.sql.Date date = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date parseDate = sdf.parse(parameter);
			long time = parseDate.getTime();
			date = new java.sql.Date(time);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}
	
	public ArrayList<Ex04DTO> selectAll() {
		ArrayList<Ex04DTO> list = new ArrayList<Ex04DTO>();
		String sql = "select title, sdate, edate, edate - sdate + 1 as days from schedule2 order by sdate";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Ex04DTO dto = new Ex04DTO();
				
				dto.setEdate(rs.getDate("edate"));
				dto.setSdate(rs.getDate("sdate"));
				dto.setTitle(rs.getString("title"));
				dto.setDays(rs.getInt("days"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		
		return list;
	}
	
	public int insert(Ex04DTO dto) {
		int row = 0;
		String sql = "insert into schedule2 values(?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setDate(2, dto.getSdate());
			pstmt.setDate(3, dto.getEdate());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		return row;
	}
}
