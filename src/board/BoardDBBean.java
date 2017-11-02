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
	      Context envCtx = (Context) initCtx.lookup( "java:comp/env" );
	      DataSource ds = (DataSource) envCtx.lookup( "jdbc/kh" );
	      return ds.getConnection();
	   }
	   
	   public int getCount() {
		   int count = 0;
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   try{
			   con = getConnection();
			   String sql = "select count(*) from band_board";
				//String sql = "select count(*) from band_board where value=?";
				pstmt = con.prepareStatement( sql );
				//pstmt.setInt(1, value);
				rs = pstmt.executeQuery();
				if( rs.next() ) {
					count = rs.getInt( 1 );
				}
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
			return count;
	   }
	   
	   public ArrayList<BoardDataBean> getArticles(int start, int end) {
		   ArrayList<BoardDataBean> articles = null;
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   try{
			   con = getConnection();
			   String sql = "select m_id, a_id, num, value, subject, reg_date, readcount, content, r "
			   		+ "from (select m_id, a_id, num, value, subject, reg_date, readcount, content, rownum r "
			   		+ "from (select m_id, a_id, num, value, subject, reg_date, readcount, content "
			   		+ "from band_board order by num desc)) where r >= ? and r <= ?";
			   
			   pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, start);
			   pstmt.setInt(2, end);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   articles = new ArrayList<BoardDataBean> (end - start + 1);
				   do {
					   BoardDataBean article = new BoardDataBean();
					   article.setM_id(rs.getString("m_id"));
					   article.setA_id(rs.getString("a_id"));
					   article.setNum(rs.getInt("num"));
					   article.setValue(rs.getInt("value"));
					   article.setSubject(rs.getString("subject"));
					   article.setReg_date( rs.getTimestamp( "reg_date" ) );
					   article.setReadcount(rs.getInt("readcount"));
					   article.setContent(rs.getString("content"));
					   
					   articles.add(article);
				   } while(rs.next());
			   }
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
			return articles;
	   }
	   
	   public BoardDataBean getArticle(int num) {
		   BoardDataBean article = null;
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   try{
			   con = getConnection();
			   String sql = "select * from band_board where num=?";
			   pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, num);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   article = new BoardDataBean();
				   article.setM_id(rs.getString("m_id"));
				   article.setA_id(rs.getString("a_id"));
				   article.setNum(rs.getInt("num"));
				   article.setValue(rs.getInt("value"));
				   article.setSubject(rs.getString("subject"));
				   article.setReg_date(rs.getTimestamp("reg_date"));
				   article.setReadcount(rs.getInt("readcount"));
				   article.setContent(rs.getString("content"));
			   }
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
			return article;
	   }
	   
	   public void addCount(int num) {
		   Connection con = null;
		   PreparedStatement pstmt = null;
		   
		   try{
			   con = getConnection();
				String sql = "update band_board set "
						+ "readcount=readcount+1 where num=?";
				pstmt = con.prepareStatement( sql );
				pstmt.setInt( 1, num );
				pstmt.executeUpdate();			
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
				pstmt = con.prepareStatement( sql );
				pstmt.setString( 1, id );
				rs = pstmt.executeQuery();
				if( rs.next() ) {
					result = 1;
				} else {
					pstmt.close();
					rs.close();
					sql = "select * from band_admin where a_id=?";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()) {
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
					if( rs != null ) rs.close();
					if( pstmt != null ) pstmt.close();
					if( con != null ) con.close();				
				} catch( SQLException e ) {
					e.printStackTrace();
				}
			}			
		   return result;
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
}
