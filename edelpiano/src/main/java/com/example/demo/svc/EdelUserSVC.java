package com.example.demo.svc;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.main.EdelUserDAO;
import com.example.demo.vo.EdelVO;

@Service
public class EdelUserSVC
{
	@Autowired
	private HttpSession session;
	
	@Autowired
	private EdelUserDAO dao;
	
	public boolean login(EdelVO vo) 
	{
		EdelVO v = dao.login(vo);
		if(v!=null) {
			session.setAttribute("id", v.getId());
			return true;
		}
		else {
			return false;
		}
	}
	

}
