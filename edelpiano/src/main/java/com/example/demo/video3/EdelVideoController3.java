package com.example.demo.video3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.EdelVideoVO3;

@Controller
@RequestMapping("/edelmusic")
public class EdelVideoController3 
{
	@Autowired
	private EdelVideoDAO3 dao;
	
	@GetMapping("/")
	public String index() {
		return "Spring boot MyBatis Test";
	}
	
	@GetMapping("/detail/{video_num}")
	public String VideoTest(@PathVariable("video_num")int video_num, Model model) {
		model.addAttribute("video", dao.selectById(video_num));
		return "Edel_ctMusicDetail_Form";
	}
	
	@GetMapping("list")
	public String vlogList(Model model) {
		model.addAttribute("list", dao.getVideoList());
		return "Edel_ctMusicList_Form";
	}
	
	@GetMapping("/ccWrite")
	public String concoursWriteForm() {
		return "Edel_ctMusicWrite_Form";
	}
	
	@PostMapping("/ccWrite")
	@ResponseBody
	public String concoursWrite(EdelVideoVO3 vo) {
		return String.format("{\"writeOK\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/delete/{video_num}")
	public String delete(@PathVariable("video_num")int video_num) {
		dao.delete(video_num);
		return "redirect:/edelmusic/list";
	}
}
