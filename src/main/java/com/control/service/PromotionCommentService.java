package com.control.service;

import com.control.dao.PromotionCommentDAO;
import com.control.dao.UserDAO;
import com.control.vo.PromotionCommentVO;

public class PromotionCommentService {

	PromotionCommentDAO dao;
	UserDAO udao;
	
	public String write(PromotionCommentVO vo) {
		dao = new PromotionCommentDAO();
		dao.insertPromotionComment(vo);
		return "";
	}
}
