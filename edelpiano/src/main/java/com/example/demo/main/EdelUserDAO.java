package com.example.demo.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelVO;

@Repository
public class EdelUserDAO 
{
	@Autowired
	private EdelUserXMLMapper userMapper;
	
	public int insert(EdelVO vo) {
		return userMapper.insertUser(vo);
	}
	
	public List<EdelVO> getNoticeList(){
		return userMapper.getUserList();
	}
	
	public EdelVO selectById(int num) {
		return userMapper.getUserById(num);
	}
	
	public int delete(int num) {
		return userMapper.deleteUser(num);
	}
	
	public int noticeUpdate(EdelVO vo) {
		return userMapper.updateUser(vo);
	}

	public EdelVO login(EdelVO vo) {
		return userMapper.getUser(vo);
	}
}
