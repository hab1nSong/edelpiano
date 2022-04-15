package com.example.demo.video3;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.EdelVideoVO3;

@Mapper
public interface EdelVideoXMLMapper3 
{
	int insertVideo(EdelVideoVO3 vo);
	int addAndGetKey(EdelVideoVO3 vo);
	EdelVideoVO3 getVideoById(int video_num);
	List<EdelVideoVO3> getVideoList();
	EdelVideoVO3 updateVideo(int video_num);
	int deleteVideo(int video_num);
	EdelVideoVO3 findWithoutId(EdelVideoVO3 vo);
}
