package com.example.demo.video2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelVideoVO2;

@Mapper
public interface EdelVideoXMLMapper2 
{
	int insertVideo(EdelVideoVO2 vo);
	int addAndGetKey(EdelVideoVO2 vo);
	EdelVideoVO2 getVideoById(int video_num);
	List<EdelVideoVO2> getVideoList();
	EdelVideoVO2 updateVideo(int video_num);
	int deleteVideo(int video_num);
	EdelVideoVO2 findWithoutId(EdelVideoVO2 vo);
}
