package com.example.demo.video;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelVideoVO;

@Mapper
public interface EdelVideoXMLMapper 
{
	int insertVideo(EdelVideoVO vo);
	int addAndGetKey(EdelVideoVO vo);
	EdelVideoVO getVideoById(int video_num);
	List<EdelVideoVO> getVideoList();
	EdelVideoVO updateVideo(int num);
	int deleteVideo(int video_num);
	EdelVideoVO findWithoutId(EdelVideoVO vo);
}
