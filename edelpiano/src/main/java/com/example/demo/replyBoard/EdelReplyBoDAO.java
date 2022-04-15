package com.example.demo.replyBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelReplyBoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Repository
public class EdelReplyBoDAO 
{
	@Autowired
	private EdelReplyBoXMLMapper replyMapper;
	
	public int insert(EdelReplyBoVO vo) {
		return replyMapper.insertReply(vo);
	}
	
	public List<EdelReplyBoVO> getReplyList(){
		return replyMapper.getReplyList();
	}
	
	public List<EdelReplyBoVO> selectById(int num) {
		return replyMapper.getUserById(num);
	}
	
	public int delete(int num) {
		return replyMapper.deleteReply(num);
	}
	
	public int noticeUpdate(EdelReplyBoVO vo) {
		return replyMapper.updateReply(vo);
	}

	public PageInfo<EdelReplyBoVO> getNoticeList(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<EdelReplyBoVO> pageInfo = new PageInfo<>(replyMapper.getReplyList());
		return pageInfo;
	}

	public PageInfo<EdelReplyBoVO> getReplyList(int pg, int i) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<EdelReplyBoVO> getDetailList() {
		return replyMapper.getDetailList();
	}
}
