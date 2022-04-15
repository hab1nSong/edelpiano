package com.example.demo.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;

import com.example.demo.vo.EdelNoticeVO;

@Mapper
public interface EdelNoticeXMLMapper 
{
	int insertUser(EdelNoticeVO vo);
	int addAndGetKey(EdelNoticeVO vo);
	EdelNoticeVO getUserById(int num);
	List<EdelNoticeVO> getNoticeList();
	int updateNotice(EdelNoticeVO vo);
	int deleteUser(int num);
	EdelNoticeVO findWithoutId(EdelNoticeVO vo);
	List<EdelNoticeVO> getDetailList();
	int viewCount(int num);
	List<EdelNoticeVO> getNoticeListPage(Pageable pageable);
}

