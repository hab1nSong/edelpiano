package com.example.demo.video3;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelVideoVO3;

@Repository
public class EdelVideoDAO3 
{
	@Autowired
	private EdelVideoXMLMapper3 videoMapper;
	
	public int insert(EdelVideoVO3 vo) {
		return videoMapper.insertVideo(vo);
	}
	
	public List<EdelVideoVO3> getVideoList(){
		return videoMapper.getVideoList();
	}
	
	public EdelVideoVO3 selectById(int video_num) {
		return videoMapper.getVideoById(video_num);
	}
	
	public int delete(int video_num) {
		return videoMapper.deleteVideo(video_num);
	}
	
	public EdelVideoVO3 videoUpdate(int video_num) {
		return videoMapper.updateVideo(video_num);
		
	}

}
