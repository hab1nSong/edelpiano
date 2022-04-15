package com.example.demo.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelOrderVO;

@Mapper
public interface EdelOrderXMLMapper 
{
	int insertUser(EdelOrderVO vo);
	int addAndGetKey(EdelOrderVO vo);
	EdelOrderVO getUserById(int num);
	List<EdelOrderVO> getUserList();
	int updateOrder(EdelOrderVO vo);
	int deleteUser(int num);
	EdelOrderVO findWithoutId(EdelOrderVO vo);
	List<EdelOrderVO> getDetailList();
}
