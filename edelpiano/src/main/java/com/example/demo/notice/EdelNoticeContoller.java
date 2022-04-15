package com.example.demo.notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.replyNotice.EdelReplyNoDAO;
import com.example.demo.vo.EdelNoticeVO;

@Controller
@RequestMapping("/notice")
public class EdelNoticeContoller 
{
	@Autowired
	private EdelReplyNoDAO dao2;
	
	@Autowired
	private EdelNoticeDAO dao;
	
	@GetMapping("/")
	public String index() {
		return "Spring boot MyBatis Test";
	}
	
	
	@GetMapping("/list")
	public String NoticeList(Model model) {
		model.addAttribute("list", dao.getNoticeList());
		model.addAttribute("reply", dao2.getReplyList());
		return "Edel_Notice_Form";
	}
	
	@GetMapping("/noWrite")
	public String NoticeWrite() {
		return "Edel_NoticeWrite_Form";
	}
	
	@PostMapping("/noWrite")
	@ResponseBody
	public String NoticeWr(EdelNoticeVO vo) {
		return String.format("{\"ok\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/detail/{num}")
	public String NoticeDetail(@PathVariable("num")int num, Model model) 
	{
		model.addAttribute("n", dao.selectById(num));
		model.addAttribute("reply", dao2.getDetailList(num));
		return "Edel_NoticeDetail_Form";
	}
	
	@GetMapping("/delete/{num}")
	public String delete(@PathVariable("num")int num) {
		dao.delete(num);
		return "redirect:/notice/list";
	}
	
	@GetMapping("/update/{num}")
	public String Noticeup(@PathVariable("num")int num, Model model) {
		model.addAttribute("n", dao.selectById(num));
		
		return "Edel_NoticeUpdate_Form";
	}
	
	@PostMapping("/update2")
	@ResponseBody
	public String NoticeUpdate(EdelNoticeVO vo) {
		return String.format("{\"updated\":%b}", dao.noticeUpdate(vo));
	}

}