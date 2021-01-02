package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.PromotionCommentVO;

public class PromotionCommentDAO {

	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	PromotionCommentVO vo;
	public List<PromotionCommentVO> list;
	
	public String insertPromotionComment(PromotionCommentVO vo) {
		
		String sql = "insert into Promotioncomment(Promotionno, id, nickname, text, signdate)"
						+ " values(?, ?, ?, ?, NOW())";
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getPromotionno());
				pstmt.setString(2, vo.getId());
				pstmt.setString(3, vo.getNickname());
				pstmt.setString(4, vo.getText());
				int r = pstmt.executeUpdate();
				pstmt.close();
				con.close();
				
				return "success";
				
			} catch (SQLException e) {
			// TODO: handle exception
				e.printStackTrace();
				return "error";
		}
	}
	public void setIdPromotionComment(String id) {
		list = null;
		list = new ArrayList<PromotionCommentVO>();
		String sql = "select no, Promotionno, id, nickname, text, signdate"
					+" from Promotioncomment"
					+" where id='"+id+"'";
		rs = null;
		
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new PromotionCommentVO();
				vo.setNo(rs.getInt("no"));
				vo.setPromotionno(rs.getString("Promotionno"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setText(rs.getString("text"));
				vo.setSigndate(rs.getDate("signdate"));
				
				list.add(vo);
			}
			rs.close();
			con.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void setPromotionCommunityPromotionComment(int Promotionno) {
		list = null;
		list = new ArrayList<PromotionCommentVO>();
		
		String sql ="select no, Promotionno, id, nickname, text, signdate from Promotioncomment "
				+ " where Promotionno = "+Promotionno+" order by signdate desc";	
		rs = null;
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new PromotionCommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setPromotionno(rs.getString("Promotionno"));
				vo.setId(rs.getString("id"));	
				vo.setNickname(rs.getString("nickname"));			
				vo.setText(rs.getString("text"));
				vo.setSigndate(rs.getDate("signdate"));	

				list.add(vo);
			}
			rs.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
