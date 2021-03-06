package board;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
		return instance;
	}

	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/kh");
		return ds.getConnection();
	}

	// value gather=1, share=2
	public int getCount(int value) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			//String sql = "select count(*) from band_board";
			String sql = "select count(*) from band_board where value=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, value);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	public int getReplyCount(int num) {
		int replyCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select (select count(*) from band_reply where num=?) + "
					+ "(select count(*) from Band_board b, Band_reply r, Band_rreply rr "
					+ "where b.num = ? and b.num = r.num and r.re_num = rr.re_num) "
					+ "replycount from dual";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				replyCount = rs.getInt(1);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return replyCount;
	}

	
	public ArrayList<BoardDataBean> getArticles(int start, int end, int value) {
		ArrayList<BoardDataBean> articles = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select m_id, a_id, num, value, subject, reg_date, readcount, content, location, r "
					+ "from (select m_id, a_id, num, value, subject, reg_date, readcount, content, location, rownum r "
					+ "from (select m_id, a_id, num, value, subject, reg_date, readcount, content, location "
					+ "from band_board where value=? order by num desc)) where r >= ? and r <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, value);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articles = new ArrayList<BoardDataBean>(end - start + 1);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setM_id(rs.getString("m_id"));
					article.setA_id(rs.getString("a_id"));
					article.setNum(rs.getInt("num"));
					article.setValue(rs.getInt("value"));
					article.setSubject(rs.getString("subject"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					article.setLocation(rs.getString("location"));
					//article.setReplyCount(getReplyCount(rs.getInt("num")));
					
					articles.add(article);
				} while (rs.next());
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return articles;
	}

	public BoardDataBean getArticle(int num) {
		BoardDataBean article = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select * from band_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setM_id(rs.getString("m_id"));
				article.setA_id(rs.getString("a_id"));
				article.setNum(rs.getInt("num"));
				article.setValue(rs.getInt("value"));
				article.setSubject(rs.getString("subject"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setLocation(rs.getString("location"));
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return article;
	}

	public void addCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();
			String sql = "update band_board set " + "readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 사용자가인지 아닌지 판단하는 Query Method
	public int check(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from band_member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				pstmt.close();
				rs.close();
				sql = "select * from band_admin where a_id=?";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertArticle(BoardDataBean boardDto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			int num = boardDto.getNum();
			String sql = null;
			if(num == 0) {
				sql = "select max(num) from band_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			sql = "insert into band_board(m_id, a_id, num, value, subject, reg_date, "
					+ "content, location) values(?, ?, band_board_seq.NEXTVAL,?, ?, ?, ?, ?)";
			
			pstmt.close();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDto.getM_id());
			pstmt.setString(2, boardDto.getA_id());
			pstmt.setInt(3, boardDto.getValue());
			pstmt.setString(4, boardDto.getSubject());
			pstmt.setTimestamp(5, boardDto.getReg_date());
			pstmt.setString(6, boardDto.getContent());
			pstmt.setString(7, boardDto.getLocation());
			
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}		
		return result;
	}
	
	/*public int insertFile(FileDataBean fileDto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			int num = boardDto.getNum();
			String sql = null;
			if(num == 0) {
				sql = "select max( num ) from band_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			sql = "insert into band_board(m_id, a_id, num, subject, reg_date "
					+ "content) value(?, ?, band_board_seq.NEXTVAL, "
					+ "?, ?, ?, ?)";
			
			pstmt.close();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  boardDto.getM_id());
			pstmt.setString(2, boardDto.getM_id());
			pstmt.setString(3, boardDto.getSubject());
			pstmt.setTimestamp(4, boardDto.getReg_date());
			pstmt.setString(5, boardDto.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}		
		
		return result;
	}	
	*/
	public int deleteArticle(int num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "delete from band_board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}			
		return result;
	}
	
	public int updateArticle(BoardDataBean boardDto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update band_board set subject=?, content=?, "
					+ "location=? where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, boardDto.getSubject());
			pstmt.setString( 2, boardDto.getContent());
			pstmt.setString( 3, boardDto.getLocation());
			pstmt.setInt( 4, boardDto.getNum());
			
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();				
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int insertReply(ReplyDataBean replyDto) {
		int result = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into Band_reply(m_id, a_id, num, re_num, reg_date, reply) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, replyDto.getM_id());
			pstmt.setString(2, replyDto.getA_id());
			pstmt.setInt(3, replyDto.getNum());
			pstmt.setInt(4,replyDto.getRe_num());
			pstmt.setTimestamp(5, replyDto.getReg_date());
			pstmt.setString(6, replyDto.getReply());
			
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

	public int getRe_Num() {
		int re_num = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select MAX(re_num) from Band_reply";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				re_num = rs.getInt("MAX(re_num)");
			} 
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return re_num;
	}
	
	public int getReplyOX(int num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select count(*) from Band_reply where num in ("
						+ "select num from Band_board where num=?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if(rs.getInt("count(*)") > 0) {
					result = 1;
				} else {
					result = 0;
				}
			} 
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<ReplyDataBean> getReply(int num) {
		ArrayList<ReplyDataBean> replys = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			String sql = "select * from Band_reply where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				replys = new ArrayList<ReplyDataBean>();
				do {
					ReplyDataBean reply = new ReplyDataBean();
					reply = new ReplyDataBean();
					reply.setM_id(rs.getString("m_id"));
					reply.setA_id(rs.getString("a_id"));
					reply.setNum(rs.getInt("num"));
					reply.setReg_date(rs.getTimestamp("reg_date"));
					reply.setReply(rs.getString("reply"));

					replys.add(reply);
				} while (rs.next());
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return replys;
	}
	
}
