package com.example.demo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelBoardVO;

@Repository
public class EdelBoardDAO 
{
	@Autowired
	private EdelBoardXMLMapper boardMapper;
	
	public int insert(EdelBoardVO vo) {
		return boardMapper.insertUser(vo);
	}
	
	public List<EdelBoardVO> getBoardList(){
		return boardMapper.getBoardList();
	}
	
	public EdelBoardVO selectByDetail(int num) {
		return boardMapper.getUserById(num);
	}
	
	public EdelBoardVO selectById(int num) {
		return boardMapper.getUserById(num);
	}
	
	public int delete(int num) {
		return boardMapper.deleteUser(num);
	}
	
	public int boardUpdate(EdelBoardVO vo) {
		return boardMapper.updateBoard(vo);
	}
	
	public int viewCount(int num) {
		return boardMapper.viewCount(num);
	}
	

	public List<EdelBoardVO> getNoticeListPage(Pageable pageable) {
			return boardMapper.getNoticeListPage(pageable);
	}
	   
	   
	 
}
