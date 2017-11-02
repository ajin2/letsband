package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LogonDBBean {
private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {// singleton pattern
		return instance;
	}
	
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/kh");
		return ds.getConnection();
	}
	
	public int check(String id) {
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "select * from Band_member where m_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int insertMember(LogonDataBean memberDto) {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into Band_member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDto.getM_id());
			pstmt.setString(2, memberDto.getPasswd());
			pstmt.setString(3, memberDto.getName());
			pstmt.setString(4,memberDto.getEmail());
			pstmt.setTimestamp(5, memberDto.getReg_date());
			pstmt.setString(6, memberDto.getPostcode());
			pstmt.setString(7, memberDto.getAddress());
			pstmt.setString(8, memberDto.getDetail_add());
			
			result = pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int check(String id, String passwd) {
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "select * from Band_member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("m_id").equals(id)) {
					if(rs.getString("passwd").equals(passwd)) {
						result = 1;
					} else {
						result = -1;
					}
				} 
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int passwdcheck(String id, String name, String email) {
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "select * from Band_member where name=? and email=? and m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("name").equals(name) && 
				   rs.getString("email").equals(email) && 
				   rs.getString("m_id").equals(id)) {
					
					result = 1;
				} else {
					result = -1;
				}
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int idcheck(String name, String email) {
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "select * from Band_member where name=? and email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("name").equals(name)) {
					if(rs.getString("email").equals(email)) {
						result = 1;
					} else {
						result = -1;
					}
				} 
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public LogonDataBean getMember(String id) {
		LogonDataBean memberDto = null;
		
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "select * from Band_member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDto = new LogonDataBean();
				memberDto.setM_id(rs.getString("m_id"));
				memberDto.setPasswd(rs.getString("passwd"));
				memberDto.setName(rs.getString("name"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setReg_date(rs.getTimestamp("reg_date"));
				memberDto.setPostcode(rs.getString("postcode"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setDetail_add(rs.getString("detail_add"));
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDto;
	}
	
	public LogonDataBean idgetMember(String name, String email) {
		LogonDataBean memberDto = null;
		
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "select * from Band_member where name=? and email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDto = new LogonDataBean();
				memberDto.setM_id(rs.getString("m_id"));
				memberDto.setPasswd(rs.getString("passwd"));
				memberDto.setName(rs.getString("name"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setReg_date(rs.getTimestamp("reg_date"));
				memberDto.setPostcode(rs.getString("postcode"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setDetail_add(rs.getString("detail_add"));
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDto;
	}
	
	public int updatePasswd(String id, String passwd) {
		
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update Band_member set passwd=? where m_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int updateMember(LogonDataBean memberDto) {
			
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = getConnection();
				String sql = "update Band_member set passwd=?, email=?, postcode=?, address=?, detail_add=? where m_id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, memberDto.getPasswd());
				pstmt.setString(2, memberDto.getEmail());
				pstmt.setString(3, memberDto.getPostcode());
				pstmt.setString(4, memberDto.getAddress());
				pstmt.setString(5, memberDto.getDetail_add());
				pstmt.setString(6, memberDto.getM_id());
				
				result = pstmt.executeUpdate();
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
			return result;
		}
	
	public int deleteMember(String id) {
		int result = 0;
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from Band_member where m_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
