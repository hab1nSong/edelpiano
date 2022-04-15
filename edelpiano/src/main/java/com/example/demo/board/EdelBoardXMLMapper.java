package com.example.demo.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;

import com.example.demo.vo.EdelBoardVO;

@Mapper
public interface EdelBoardXMLMapper 
{
	int insertUser(EdelBoardVO vo);
	int addAndGetKey(EdelBoardVO vo);
	EdelBoardVO getUserById(int num);
	List<EdelBoardVO> getBoardList();
	int updateBoard(EdelBoardVO vo);
	int deleteUser(int num);
	EdelBoardVO findWithoutId(EdelBoardVO vo);
	List<EdelBoardVO> getDetailList();
	int viewCount(int num);
	List<EdelBoardVO> getNoticeListPage(Pageable pageable);
}

