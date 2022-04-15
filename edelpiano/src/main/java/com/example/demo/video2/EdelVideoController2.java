package com.example.demo.video2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.EdelVideoVO2;

@Controller
@RequestMapping("/concours")
public class EdelVideoController2 
{
	@Autowired
	private EdelVideoDAO2 dao;
	
	@GetMapping("/")
	public String index() {
		return "Spring boot MyBatis Test";
	}
	
	@GetMapping("/detail/{video_num}")
	public String VideoTest(@PathVariable("video_num")int video_num, Model model) {
		model.addAttribute("video", dao.selectById(video_num));
		return "Edel_ctConcoursDetail_Form";
	}
	
	@GetMapping("list")
	public String vlogList(Model model) {
		model.addAttribute("list", dao.getVideoList());
		return "Edel_ctConcoursList_Form";
	}
	
	@GetMapping("/ccWrite")
	public String concoursWriteForm() {
		return "Edel_ctConcoursWrite_Form";
	}
	
	@PostMapping("/ccWrite")
	@ResponseBody
	public String concoursWrite(EdelVideoVO2 vo) {
		return String.format("{\"writeOK\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/delete/{video_num}")
	public String delete(@PathVariable("video_num")int video_num) {
		dao.delete(video_num);
		return "redirect:/concours/list";
	}
}
