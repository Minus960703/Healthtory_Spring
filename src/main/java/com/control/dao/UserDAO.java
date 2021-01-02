package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.control.connector.Connector;
import com.control.vo.UserVO;

public class UserDAO {

	private Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public String Login(UserVO CVO) {
		String sql = "select id, password, nickname, grade from user where id = '" + CVO.getId() + "'";
		Connector conn = new Connector();
		con = conn.getCon();
		rs = null;
		
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				if(rs.getString("password").equals(CVO.getPassword())) {
					String nickname = rs.getString("nickname");
					String grade = rs.getString("grade");
					rs.close();
					con.close();
					return nickname;
				}
				else {
					rs.close();
					con.close();
					return null;
				}
			}
			else {
				rs.close();
				con.close();
				return null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	};
	
public String Join(UserVO CVO) {
		
		String sql ="select id from user where id='" + CVO.getId() + "'";
		Connector conn = new Connector();
		con = conn.getCon();
		rs = null;
		
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {				
					return "sameid";
				}		
			else {
				sql="insert into user(id, password, name, phone, email, nickname) values(?, ?, ?, ?, ?, ?)";
				
				pstmt= con.prepareStatement(sql);				
				pstmt.setString(1, CVO.getId());
				pstmt.setString(2, CVO.getPassword());
				pstmt.setString(3, CVO.getName());
				pstmt.setString(4, CVO.getPhone());
				pstmt.setString(5, CVO.getEmail());
				pstmt.setString(6, CVO.getNickname());
				int r=pstmt.executeUpdate();
				return "join";				
			}		

		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}		
	
	}

	public String checkid(String id) {

		Connector conn=new Connector();
	    con=conn.getCon();
	    rs = null;
	    
	    String sql ="select id from user where id='"+id+"'";
	    
	    try {
	       Statement stmt= con.createStatement();         
	       rs = stmt.executeQuery(sql);         
	
	       if(rs.next()) {                     
	             return "yes";
	          }
	       else {
	          return "no";
	          
	       }
	       
	    } catch (SQLException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	       return "error";   
	    }      

	 }
	
	public String checknickname(String nickname) {

		Connector conn=new Connector();
	    con=conn.getCon();
	    rs = null;
	    
	    String sql ="select nickname from user where nickname='"+nickname+"'";
	    
	    try {
	       Statement stmt= con.createStatement();         
	       rs = stmt.executeQuery(sql);         
	
	       if(rs.next()) {                     
	             return "yes";
	          }
	       else {
	          return "no";
	          
	       }
	       
	    } catch (SQLException e) {
	       // TODO Auto-generated catch block
	       e.printStackTrace();
	       return "error";   
	    }      

	 }
	
	public String updatePassword(UserVO vo) {
		 String sql = "update user set password=? where id=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, vo.getPassword()); 
					pstmt.setString(2,vo.getId());			
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
	
	public String updatePhone(UserVO vo) {
		 String sql = "update user set phone=? where id=?";		 
			try {				
					con = Connector.getCon();
					pstmt= con.prepareStatement(sql);	
					pstmt.setString(1, vo.getPhone()); 
					pstmt.setString(2,vo.getId());			
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
