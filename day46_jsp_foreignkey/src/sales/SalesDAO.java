package sales;

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

public class SalesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static SalesDAO instance = new SalesDAO();
	
	private SalesDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static SalesDAO getInstance() {
		return instance;
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
		} finally { close(); }
		
		return banner;
	}
	
	public List<SalesDTO> selectAll() {
		ArrayList<SalesDTO> list = new ArrayList<SalesDTO>();
		String sql = "select " + 
						"sales.idx, " + 
						"product.name, " + 
						"product.price, " + 
						"sales.sdate, " + 
						"sales.cnt " + 
						"from sales " + 
						"join product " + 
							"on sales.idx = product.idx " + 
						"order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SalesDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public int insert(SalesDTO dto) {
		int row = 0;
		String sql = "insert into sales(product, cnt) values(?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProduct());
			pstmt.setInt(2, dto.getCnt());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close(); } catch (Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
		try { if(conn != null) 	conn.close(); } catch (Exception e) {}
	}
	
	public SalesDTO mapping(ResultSet rs) throws SQLException {
		SalesDTO dto = new SalesDTO();
		
		dto.setIdx(rs.getInt(1));
		dto.setName(rs.getString(2));
		dto.setPrice(rs.getInt(3));
		dto.setSdate(rs.getDate(4));
		dto.setCnt(rs.getInt(5));
		
		return dto;
	}
}
