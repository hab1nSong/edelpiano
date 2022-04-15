package com.example.demo.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelOrderVO;

@Repository
public class EdelOrderDAO 
{
	@Autowired
	private EdelOrderXMLMapper orderMapper;
	
	public int insert(EdelOrderVO vo) {
		return orderMapper.insertUser(vo);
	}
	
	public List<EdelOrderVO> getUserList(){
		return orderMapper.getUserList();
	}
	
	public List<EdelOrderVO> getDetailList(){
		return orderMapper.getDetailList();
	}

	public EdelOrderVO selectById(int num) {
		return orderMapper.getUserById(num);
	}

	public int delete(int num) {
		return orderMapper.deleteUser(num);
	}
	
	public int orderUpdate(EdelOrderVO vo) {
		return orderMapper.updateOrder(vo);
	}
}
