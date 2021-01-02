package com.control.service;

import com.control.dao.ScreenCommentDAO;
import com.control.dao.UserDAO;
import com.control.vo.ScreenCommentVO;

public class ScreenCommentService {

	ScreenCommentDAO dao;
	UserDAO udao;
	
	public String write(ScreenCommentVO vo) {
		dao = new ScreenCommentDAO();
		dao.insertScreenComment(vo);
		return "";
	}
}
