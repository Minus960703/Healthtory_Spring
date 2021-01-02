package com.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.control.connector.Connector;

import com.control.vo.WorkOutVO;

public class WorkOutDAO {
	private Connection con;
	PreparedStatement pstmt;
	public ResultSet rs;
	WorkOutVO vo;
	public List<WorkOutVO> list;
	
	public String insertWorkOut(WorkOutVO vo) {
		
		String sql = "insert into workoutboard(`name`, part, partName, url, `explain`, signdate)"
						+ " values(?, ?, ?, ?, ?, NOW())";
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getPart());
				pstmt.setString(3, vo.getPartName());
				pstmt.setString(4, vo.getUrl());
				pstmt.setString(5, vo.getExplain());
				
				pstmt.executeUpdate();

				
				pstmt.close();
				
				con.close();
				return "success";
				
			} catch (SQLException e) {
			// TODO: handle exception
				e.printStackTrace();
				return "error";
		}
	}//insertWorkOut 종료
	
	//전체 게시물 출력 - 부위별 X
	public String selectAllWorkOut() {
			list = null;
			list = new ArrayList<WorkOutVO>();
			String sql = "select no, `name`, part, partName, views, url, `explain` from workoutboard order by no desc";
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				
				while(rs.next()) {
					vo = new WorkOutVO();
					vo.setNo(rs.getInt("no"));
					vo.setName(rs.getString("name"));
					vo.setPart(rs.getString("part"));
					vo.setPartName(rs.getString("partName"));
					vo.setViews(rs.getInt("views"));
					vo.setUrl(rs.getString("url"));
					vo.setExplain(rs.getString("explain"));
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
		}//selectAllWorkOut 종료
	
	//전체 게시물 출력 - 부위별 O
	public String selectAllWorkOut(String part) {
			list = null;
			list = new ArrayList<WorkOutVO>();
			String sql = "select no, `name`, part, partName, views, url, `explain` from workoutboard where part='"+part+"' order by no desc";
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				
				while(rs.next()) {
					vo = new WorkOutVO();
					vo.setNo(rs.getInt("no"));
					vo.setName(rs.getString("name"));
					vo.setPart(rs.getString("part"));
					vo.setPartName(rs.getString("partName"));
					vo.setViews(rs.getInt("views"));
					vo.setUrl(rs.getString("url"));
					vo.setExplain(rs.getString("explain"));
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
		}//selectAllWorkOut 종료 - 부위별 O
	
	//1개의  게시물 출력 - view용
	public String selectOneWorkOut(int no) {
			list = null;
			list = new ArrayList<WorkOutVO>();
			String sql = "select no, `name`, part, views, url, `explain` from workoutboard where no="+no;
			rs = null;
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				System.out.println(sql);
				while(rs.next()) {
					vo = new WorkOutVO();
					vo.setNo(rs.getInt("no"));
					vo.setName(rs.getString("name"));
					vo.setPart(rs.getString("part"));
					vo.setViews(rs.getInt("views"));
					vo.setUrl(rs.getString("url"));
					vo.setExplain(rs.getString("explain"));
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
		}//selectOneWorkOut 종료
		
		//검색 
		public String searchWorkOut(String word) {
			list = null;
			list = new ArrayList<WorkOutVO>();
			String sql = "select no, `name`, part, partName, views, url, `explain` from workoutboard "
						+ " where (`name` like '%" + word + "%')"
						+ " or (partName like '%" + word + "%')"
						+ " or (`explain`like '%" + word + "%')"
						+ " order by no desc";
			rs = null;
			System.out.println(sql);
			try {
				con = Connector.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				vo = null;
				
				while(rs.next()) {
					vo = new WorkOutVO();
					vo.setNo(rs.getInt("no"));
					vo.setName(rs.getString("name"));
					vo.setPart(rs.getString("part"));
					vo.setPartName(rs.getString("partName"));
					vo.setViews(rs.getInt("views"));
					vo.setUrl(rs.getString("url"));
					vo.setExplain(rs.getString("explain"));
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
		}//selectWorkOut 종료
		
	//조회수 증가
		public String viewsup(int no) {
			 String sql = "update workoutboard set views=views+1 where no=?";		 
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
		}//viewsup 종료
}
