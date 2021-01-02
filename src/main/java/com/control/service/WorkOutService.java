package com.control.service;

import com.control.dao.WorkOutDAO;
import com.control.vo.WorkOutVO;

public class WorkOutService {
	WorkOutDAO dao;
	
	public String write(WorkOutVO vo) {
		dao = new WorkOutDAO();
		dao.insertWorkOut(vo);
		return "write success";
	}
	
	public String viewsup(int no) {
		dao=new WorkOutDAO();
		dao.viewsup(no);		
		return "";		
		
	}
}
