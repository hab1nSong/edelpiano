package com.example.demo.replyBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelReplyBoVO;

@Mapper
public interface EdelReplyBoXMLMapper 
{
	int insertReply(EdelReplyBoVO vo);
	int addAndGetKey(EdelReplyBoVO vo);
	List<EdelReplyBoVO> getUserById(int num);
	List<EdelReplyBoVO> getReplyList();
	int updateReply(EdelReplyBoVO vo);
	int deleteReply(int num);
	EdelReplyBoVO findWithoutId(EdelReplyBoVO vo);
	List<EdelReplyBoVO> getDetailList();
}
