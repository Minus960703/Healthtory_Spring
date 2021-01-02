package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.FreeCommentVO;

public class FreeCommentDAO {

	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	FreeCommentVO vo;
	public List<FreeCommentVO> list;
	
	public String insertFreeComment(FreeCommentVO vo) {
		
		String sql = "insert into Freecomment(Freeno, id, nickname, text, signdate)"
						+ " values(?, ?, ?, ?, NOW())";
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getFreeno());
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
	public void setIdFreeComment(String id) {
		list = null;
		list = new ArrayList<FreeCommentVO>();
		String sql = "select no, Freeno, id, nickname, text, signdate"
					+" from freecomment"
					+" where id='"+id+"'";
		rs = null;
		
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new FreeCommentVO();
				vo.setNo(rs.getInt("no"));
				vo.setFreeno(rs.getString("Freeno"));
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
	
	public void setFreeCommunityFreeComment(int Freeno) {
		list = null;
		list = new ArrayList<FreeCommentVO>();
		
		String sql ="select no, Freeno, id, nickname, text, signdate from freecomment "
				+ " where Freeno = "+Freeno+" order by signdate desc" ;	
		rs = null;
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new FreeCommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setFreeno(rs.getString("Freeno"));
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
