package com.example.demo.replyNotice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.EdelReplyNoVO;

@Controller
@RequestMapping("/")
public class EdelReplyNoController
{
	@Autowired
	private EdelReplyNoDAO dao;
	
	@GetMapping("/")
	public String index() {
		return "Spring boot MyBatis Test";
	}
	
	@PostMapping("/replywrite")
	@ResponseBody
	public String NoticeWr(EdelReplyNoVO vo) {
		return String.format("{\"ok\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/delete/{num}")
	public String delete(@PathVariable("num")int num) {
		dao.delete(num);
		return "redirect:/notice/list";
	}
	
	@PostMapping("/update2")
	@ResponseBody
	public String NoticeUpdate(EdelReplyNoVO vo) {
		return String.format("{\"updated\":%b}", dao.noticeUpdate(vo));
	}
}