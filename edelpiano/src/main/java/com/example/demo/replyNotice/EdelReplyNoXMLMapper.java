package com.example.demo.replyNotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelReplyNoVO;

@Mapper
public interface EdelReplyNoXMLMapper 
{
	int insertReply(EdelReplyNoVO vo);
	int addAndGetKey(EdelReplyNoVO vo);
	EdelReplyNoVO getUserById(int num);
	List<EdelReplyNoVO> getReplyList();
	int updateReply(EdelReplyNoVO vo);
	int deleteReply(int num);
	EdelReplyNoVO findWithoutId(EdelReplyNoVO vo);
	List<EdelReplyNoVO> getDetailList(int num);
}
