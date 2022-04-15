package com.example.demo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.replyBoard.EdelReplyBoDAO;
import com.example.demo.vo.EdelBoardVO;

@Controller
@RequestMapping("/edelboard")
public class EdelBoardController 
{
	@Autowired
	private EdelBoardDAO dao;
	
	@Autowired
	private EdelReplyBoDAO dao2;
	
	@GetMapping("/list")
	public String listtest(Model model) {
		model.addAttribute("list", dao.getBoardList());
		model.addAttribute("reply", dao2.getReplyList());
		return "Edel_BoardList_Form";
	}
	
	@GetMapping("/detail/{num}")
	public String boardDetail(@PathVariable("num")int num, Model model) 
	{
		model.addAttribute("detail", dao.selectByDetail(num));
		model.addAttribute("reply", dao2.selectById(num));
		return "Edel_BoardDt_Form";
	}
	
	@GetMapping("/update/{num}")
	public String boardUpdate(@PathVariable("num")int num, Model model) {
		model.addAttribute("detail", dao.selectByDetail(num));
		return "Edel_BoardUpdate_Form";
	}
	
	@PostMapping("/bdupdate")
	@ResponseBody
	public String boardUpdate(EdelBoardVO vo) {
		return String.format("{\"updated\":%b}", dao.boardUpdate(vo));
	}

	@GetMapping("/write")
	public String EdelBoardWrite() {
		return "Edel_BoardWrite_Form";
	}
	
	@PostMapping("/write")
	@ResponseBody
	public String NoticeWr(EdelBoardVO vo) {
		return String.format("{\"writeOk\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/secret/{num}")
	public String secret() {
		return "Edel_BoardSecret_Form";
	}
	
	@GetMapping("/delete/{num}")
	public String delete(@PathVariable("num")int num) {
		dao.delete(num);
		return "redirect:/edelboard/list";
	}
	
}
