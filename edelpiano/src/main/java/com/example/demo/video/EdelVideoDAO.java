package com.example.demo.video;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelVideoVO;

@Repository
public class EdelVideoDAO 
{
	@Autowired
	private EdelVideoXMLMapper videoMapper;
	
	public int insert(EdelVideoVO vo) {
		return videoMapper.insertVideo(vo);
	}
	
	public List<EdelVideoVO> getVideoList(){
		return videoMapper.getVideoList();
	}
	
	public EdelVideoVO selectById(int video_num) {
		return videoMapper.getVideoById(video_num);
	}
	
	public int delete(int video_num) {
		return videoMapper.deleteVideo(video_num);
	}
	
	public EdelVideoVO videoUpdate(int num) {
		return videoMapper.updateVideo(num);
		
	}

	
}
