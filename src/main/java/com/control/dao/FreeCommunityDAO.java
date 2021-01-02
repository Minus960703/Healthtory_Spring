package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.FreeCommunityVO;

public class FreeCommunityDAO {

	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	FreeCommunityVO vo;
	public List<FreeCommunityVO> list;
	
	//전체 게시물 출력
	public String selectFreeCommunity() {
		list = null;
		list = new ArrayList<FreeCommunityVO>();
		String sql = "select no, id, nickname, title, signdate, likenum, views from freecommunity order by no desc";
		rs = null;
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new FreeCommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setLikenum(rs.getInt("likenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			
			rs.close();
			con.close();
			
			return "select success";
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("select error");
			return "select error";
		}
	}
	
	//상원이의 검색
	public String selectFreeCommunity(String word) {
		list = null;
		list = new ArrayList<FreeCommunityVO>();
		String sql = "select no, id, nickname, title, signdate, likenum, views from freecommunity "
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
				vo = new FreeCommunityVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setSigndate(rs.getDate("signdate"));
				vo.setLikenum(rs.getInt("likenum"));
				vo.setViews(rs.getInt("views"));
				list.add(vo);
			}
			
			rs.close();
			con.close();
			
			return "select success";
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("select error");
			return "select error";
		}
	}
	
	//writing
	public String insertFreeCommunity(FreeCommunityVO vo) {
		
		String sql = "insert into freecommunity(id, nickname, title, text, signdate) "
				+ " values(?, ?, ?, ?, NOW())";
		
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getText());
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
	public String setoneCommunity(int no) {
		list = null;
		list = new ArrayList<FreeCommunityVO>();
		String sql = "select no, id, nickname, text, title, signdate, views from freecommunity where no="+no+"";		
		rs=null;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new FreeCommunityVO();
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
	
	//아이디
	public String setIdFreeCommunity(String id) {
		list = null;
		list = new ArrayList<FreeCommunityVO>();
		String sql = "select no, id, nickname, text, title, signdate, views from freecommunity where id='"+id+"' order by no desc";		
		rs=null;
		try {
			con = Connector.getCon();
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			vo=null;
			
			while(rs.next()) {
				vo=new FreeCommunityVO();
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
		String sql ="delete from freecommunity" + 				 					
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
		 String sql = "update freecommunity set views=views+1 where no=?";		 
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
