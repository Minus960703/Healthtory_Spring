package com.control.service;

import com.control.dao.FreeCommentDAO;
import com.control.dao.UserDAO;
import com.control.vo.FreeCommentVO;

public class FreeCommentService {

	FreeCommentDAO dao;
	UserDAO udao;
	
	public String write(FreeCommentVO vo) {
		dao = new FreeCommentDAO();
		dao.insertFreeComment(vo);
		return "";
	}
}
