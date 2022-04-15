package com.example.demo.replyNotice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelReplyNoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Repository
public class EdelReplyNoDAO 
{
	@Autowired
	private EdelReplyNoXMLMapper reply2Mapper;
	
	public int insert(EdelReplyNoVO vo) {
		return reply2Mapper.insertReply(vo);
	}
	
	public List<EdelReplyNoVO> getReplyList(){
		return reply2Mapper.getReplyList();
	}
	
	public List<EdelReplyNoVO> getDetailList(int num){
		return reply2Mapper.getDetailList(num);
	}
	
	public EdelReplyNoVO selectById(int num) {
		return reply2Mapper.getUserById(num);
	}
	
	public int delete(int num) {
		return reply2Mapper.deleteReply(num);
	}
	
	public int noticeUpdate(EdelReplyNoVO vo) {
		return reply2Mapper.updateReply(vo);
	}

	public PageInfo<EdelReplyNoVO> getNoticeList(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<EdelReplyNoVO> pageInfo = new PageInfo<>(reply2Mapper.getReplyList());
		return pageInfo;
	}

}
