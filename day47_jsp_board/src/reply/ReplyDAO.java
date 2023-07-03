package reply;

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

public class ReplyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ReplyDAO instance = new ReplyDAO();
	
	private ReplyDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static ReplyDAO getInstance() {
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
	
	public List<ReplyDTO> select(int board) {
		ArrayList<ReplyDTO> list = new ArrayList<>();
		String sql = "select M.userId, R.* from reply R " + 
						"join board_member M " + 
						"on M.idx = R.writer " + 
						"where board=? order by R.idx desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = mapping(rs);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public int insert(ReplyDTO dto) {
		int row = 0;
		String sql = "insert into reply(board, writer, content, ipaddr, userAgent) " + 
						"values(?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard());
			pstmt.setInt(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIpaddr());
			pstmt.setString(5, dto.getUserAgent());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close(); } 	 catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		try { if(conn != null) 	conn.close(); }  catch(Exception e) {}
	}
	
	public ReplyDTO mapping(ResultSet rs) throws SQLException {
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBoard(rs.getInt("board"));
		dto.setContent(rs.getString("content"));
		dto.setIdx(rs.getInt("idx"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setUserAgent(rs.getString("userAgent"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setWriter(rs.getInt("writer"));
		dto.setUserId(rs.getString("userId"));
		
		return dto;
	}
	
	
}
