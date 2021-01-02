package com.control.service;

import com.control.dao.FreeCommunityDAO;
import com.control.vo.FreeCommunityVO;

public class FreeCommunityService {

	FreeCommunityDAO dao;
	
	public String write(FreeCommunityVO vo) {
		dao = new FreeCommunityDAO();
		dao.insertFreeCommunity(vo);
		return "write success";
	}
	
	public String viewsup(int no) {
		dao=new FreeCommunityDAO();
		dao.viewsup(no);		
		return "";		
		
	}
	
	public String delete(int no) {
		dao=new FreeCommunityDAO();
		dao.delete(no);		
		return "";
		
	}
	
}
