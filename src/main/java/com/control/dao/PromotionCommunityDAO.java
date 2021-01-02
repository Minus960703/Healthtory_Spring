package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.PromotionCommunityVO;

public class PromotionCommunityDAO {

	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	PromotionCommunityVO vo;
	public List<PromotionCommunityVO> list;
	
	//전체 출력
	public void setallList(String sort,String desc) {
		list = null;
		list = new ArrayList<PromotionCommunityVO>();	
		String sql ="select no, id, title, text, signdate, likenum, dislikenum, views, nickname, sumnail" + 
				" from promotioncommunity " +				
				" order by no desc";
		rs = null;
		
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);			
			ResultSet rs=pstmt.executeQuery();
			vo=null;
			 
			while(rs.next()) {
				vo=new PromotionCommunityVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setId(rs.getString("id"));				
				vo.setTitle(rs.getString("title"));				
				vo.setText(rs.getString("text"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setLikenum(rs.getInt("likenum"));
				vo.setDislikenum(rs.getInt("dislikenum"));
				vo.setViews(rs.getInt("views"));
				vo.setNickname(rs.getString("nickname"));
				vo.setSumnail(rs.getString("sumnail"));
				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//검색용 - 전체
		public void setallList(String word,String sort,String desc) {
			list = null;
			list = new ArrayList<PromotionCommunityVO>();
				
			String sql = "select no, id, title, text, signdate, likenum, dislikenum, views, nickname, sumnail"
					+ " from promotioncommunity"
					+ " where (nickname like '%" + word + "%')"
					+ " or (title like '%" + word + "%')"
					+ " order by no desc";
					
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
					
				while(rs.next()) {
					vo=new PromotionCommunityVO();				
					vo.setNo(rs.getInt("no"));				
					vo.setId(rs.getString("id"));				
					vo.setTitle(rs.getString("title"));				
					vo.setText(rs.getString("text"));
					vo.setSigndate(rs.getDate("signdate"));
					vo.setLikenum(rs.getInt("likenum"));
					vo.setDislikenum(rs.getInt("dislikenum"));
					vo.setViews(rs.getInt("views"));
					vo.setNickname(rs.getString("nickname"));
					vo.setSumnail(rs.getString("sumnail"));
					list.add(vo);
				}
				
				rs.close();
				con.close();
								
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("select error");
			}
			
		}
	
		//Ranking
		public void setRankingList(String sort,String desc) {
			list = null;
			list = new ArrayList<PromotionCommunityVO>();	
			String sql ="select no, id, title, text, signdate, views, nickname, sumnail" + 
					" from promotioncommunity " +				
					" order by text";
			rs = null;
			
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);			
				ResultSet rs=pstmt.executeQuery();
				vo=null;
				 
				while(rs.next()) {
					vo=new PromotionCommunityVO();				
					vo.setNo(rs.getInt("no"));				
					vo.setId(rs.getString("id"));				
					vo.setTitle(rs.getString("title"));				
					vo.setText(rs.getString("text"));
					vo.setSigndate(rs.getDate("signdate"));
					vo.setViews(rs.getInt("views"));
					vo.setNickname(rs.getString("nickname"));
					vo.setSumnail(rs.getString("sumnail"));
					list.add(vo);
				}
				rs.close();
				con.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	//writing
	public String insertPromotionCommunity(PromotionCommunityVO vo) {
		
		String sql = "insert into promotioncommunity(id, nickname, title, text, signdate, sumnail) "
				+ " values(?, ?, ?, ?, NOW(), ?)";
		
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getText());
			pstmt.setString(5, vo.getSumnail());
			int r = pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
			return "insert success";
			
		} catch (Exception e) {
			// TODO: handle exception\
			e.printStackTrace();
			return "insert error";
		}
	}
	
	//하나 보여주기
	public void setonePromotionCommunity(int no) {
		list = null;
		list = new ArrayList<PromotionCommunityVO>();
		String sql = "select no, id, nickname, text, title, signdate, views from promotioncommunity where no="+no+"";		
		rs=null;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new PromotionCommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setText(rs.getString("text"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
		}
	}
	
	//아이디
	public String setIdPromotionCommunity(String id) {
		list = null;
		list = new ArrayList<PromotionCommunityVO>();
		String sql = "select no, id, nickname, text, title, signdate, views from promotioncommunity where id='"+id+"' order by no desc";		
		rs=null;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new PromotionCommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setText(rs.getString("text"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			rs.close();			
			con.close();
			
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
			return "error";
		}
	}
	
	//삭제
	public void delete(int no) {
		String sql ="delete from promotioncommunity" + 				 					
				" where no="+no+"";					
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			int rs=pstmt.executeUpdate();
			pstmt.close();
			con.close();		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	//조회수 증가
	public String viewsup(int no) {
		 String sql = "update promotioncommunity set views=views+1 where no=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setInt(1,no);								
					int r = pstmt.executeUpdate();				
					pstmt.close();
					con.close();
					return "success";		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
	}
	
}
