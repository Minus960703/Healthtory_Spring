package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.ScreenCommentVO;

public class ScreenCommentDAO {

	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	ScreenCommentVO vo;
	public List<ScreenCommentVO> list;
	
	public String insertScreenComment(ScreenCommentVO vo) {
		
		String sql = "insert into Screencomment(Screenno, id, nickname, text, signdate)"
						+ " values(?, ?, ?, ?, NOW())";
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getScreenno());
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
	public void setIdScreenComment(String id) {
		list = null;
		list = new ArrayList<ScreenCommentVO>();
		String sql = "select no, Screenno, id, nickname, text, signdate"
					+" from Screencomment"
					+" where id='"+id+"'";
		rs = null;
		
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new ScreenCommentVO();
				vo.setNo(rs.getInt("no"));
				vo.setScreenno(rs.getString("Screenno"));
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
	
	public void setScreenCommunityScreenComment(int Screenno) {
		list = null;
		list = new ArrayList<ScreenCommentVO>();
		
		String sql ="select no, Screenno, id, nickname, text, signdate from Screencomment "
				+ " where Screenno = "+Screenno+" order by signdate desc";	
		rs = null;
				
		try {
			con = Connector.getCon();
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			vo = null;
			
			while(rs.next()) {
				vo = new ScreenCommentVO();				
				vo.setNo(rs.getInt("no"));				
				vo.setScreenno(rs.getString("Screenno"));
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
