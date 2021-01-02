package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;
import com.control.vo.LetterVO;
import com.control.vo.ScreenCommunityVO;

public class LetterDAO {
	
	private Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	LetterVO vo;
	public List<LetterVO> list;
	
	//보낸 쪽지 출력
		public String selectSendLetter(String nickname) {
			list = null;
			list = new ArrayList<LetterVO>();
			String sql = "select no, Fromid, Fromnickname, Tonickname, text, signdate from Letter "
					+ " where Fromnickname = '"+nickname+"' order by no desc";
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				
				while(rs.next()) {
					vo = new LetterVO();
					vo.setNo(rs.getInt("no"));
					vo.setFromid(rs.getString("Fromid"));
					vo.setFromnickname(rs.getString("Fromnickname"));
					vo.setTonickname(rs.getString("Tonickname"));
					vo.setText(rs.getString("text"));
					vo.setSigndate(rs.getDate("signdate"));
					
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
		
		public String selectReceiveLetter(String nickname) {
			list = null;
			list = new ArrayList<LetterVO>();
			String sql = "select no, Fromid, Fromnickname, Tonickname, text, signdate from Letter "
					+ " where Tonickname = '"+nickname+"' order by no desc";
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				
				while(rs.next()) {
					vo = new LetterVO();
					vo.setNo(rs.getInt("no"));
					vo.setFromid(rs.getString("Fromid"));
					vo.setFromnickname(rs.getString("Fromnickname"));
					vo.setTonickname(rs.getString("Tonickname"));
					vo.setText(rs.getString("text"));
					vo.setSigndate(rs.getDate("signdate"));
					
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
	
		public String sendLetter(LetterVO vo){
			
			String sql = "insert into Letter(Fromid, Fromnickname, Tonickname, text, signdate) "
					+ " values(?, ?, ?, ?, NOW())";
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getFromid());
				pstmt.setString(2, vo.getFromnickname());
				pstmt.setString(3, vo.getTonickname());
				pstmt.setString(4, vo.getText());
				int r = pstmt.executeUpdate();
				pstmt.close();
				con.close();
				
				return "send success";
				
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
				return "send fail";
			}
		}
		
		//하나 보여주기
		public void setoneLetter(int no) {
			list = null;
			list = new ArrayList<LetterVO>();
			String sql = "select no, Fromid, Fromnickname, Tonickname, text, signdate from Letter "
					+ " where no = "+no+"";		
			rs=null;
			try {
				con = Connector.getCon();
				pstmt= con.prepareStatement(sql);
				rs =pstmt.executeQuery();
				vo=null;
				
				while(rs.next()) {
					vo = new LetterVO();
					vo.setNo(rs.getInt("no"));
					vo.setFromid(rs.getString("Fromid"));
					vo.setFromnickname(rs.getString("Fromnickname"));
					vo.setTonickname(rs.getString("Tonickname"));
					vo.setText(rs.getString("text"));
					vo.setSigndate(rs.getDate("signdate"));
					
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
		
		//삭제
		public void delete(int no) {
			String sql ="delete from letter" + 				 					
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
}
