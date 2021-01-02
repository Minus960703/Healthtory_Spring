package com.control.service;

import com.control.dao.PromotionCommunityDAO;
import com.control.vo.PromotionCommunityVO;

public class PromotionCommunityService {

	PromotionCommunityDAO dao;
	
	public String write(PromotionCommunityVO vo) {
		dao = new PromotionCommunityDAO();
		dao.insertPromotionCommunity(vo);
		return "write success";
	}
	
	public String viewsup(int no) {
		dao=new PromotionCommunityDAO();
		dao.viewsup(no);		
		return "";		
		
	}
	
	public String delete(int no) {
		dao=new PromotionCommunityDAO();
		dao.delete(no);		
		return "";
		
	}
	
}
