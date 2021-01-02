package com.control.service;

import com.control.dao.FreeCommunityDAO;
import com.control.dao.LetterDAO;
import com.control.vo.LetterVO;

public class LetterService {

	LetterDAO dao;
	
	public String write(LetterVO vo) {
		dao = new LetterDAO();
		dao.sendLetter(vo);
		return "write success";
	}
	
	public String delete(int no) {
		dao=new LetterDAO();
		dao.delete(no);		
		return "";
		
	}
}
