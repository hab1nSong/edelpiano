package com.example.demo.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelVO;

@Mapper
public interface EdelUserXMLMapper 
{
	int insertUser(EdelVO vo);
	int addAndGetKey(EdelVO vo);
	EdelVO getUserById(int num);
	List<EdelVO> getUserList();
	int updateUser(EdelVO vo);
	int deleteUser(int num);
	EdelVO findWithoutId(EdelVO vo);
	EdelVO getUser(EdelVO vo);
}

