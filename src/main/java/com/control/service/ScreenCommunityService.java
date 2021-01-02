package com.control.service;

import com.control.dao.ScreenCommunityDAO;
import com.control.vo.ScreenCommunityVO;

public class ScreenCommunityService {

	ScreenCommunityDAO dao;
	
	public String write(ScreenCommunityVO vo) {
		dao = new ScreenCommunityDAO();
		dao.insertScreenCommunity(vo);
		return "write success";
	}
	
	public String viewsup(int no) {
		dao=new ScreenCommunityDAO();
		dao.viewsup(no);		
		return "";		
		
	}
	
	public String delete(int no) {
		dao=new ScreenCommunityDAO();
		dao.delete(no);		
		return "";
		
	}
	
}
