package com.example.demo.video2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelVideoVO2;

@Repository
public class EdelVideoDAO2 
{
	@Autowired
	private EdelVideoXMLMapper2 videoMapper;
	
	public int insert(EdelVideoVO2 vo) {
		return videoMapper.insertVideo(vo);
	}
	
	public List<EdelVideoVO2> getVideoList(){
		return videoMapper.getVideoList();
	}
	
	public EdelVideoVO2 selectById(int video_num) {
		return videoMapper.getVideoById(video_num);
	}
	
	public int delete(int video_num) {
		return videoMapper.deleteVideo(video_num);
	}
	
	public EdelVideoVO2 videoUpdate(int video_num) {
		return videoMapper.updateVideo(video_num);
		
	}

	
}
