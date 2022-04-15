package com.example.demo.order;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.vo.EdelOrderVO;

@Controller
@RequestMapping("/order")
public class EdelOrderController 
{
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	private EdelOrderDAO dao;
	
	@GetMapping("/")
	public String index() {
		return "Spring boot MyBatis Test";
	}
	
	@GetMapping("/cart")
	public String Cart() {
		return "Edel_OrderCart_Form";
	}
	
	@PostMapping("/cart")
	@ResponseBody
	public String cartList(Model model) {
		model.addAttribute("order", dao.getUserList());
		return "Edel_OrderCart_Form";
	}
	
	@GetMapping("/add")
	public String insertUser() {
		return "Edel_OrderAdd_Form";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public String EdelorderAdd(EdelOrderVO vo) {
		return String.format("{\"ok\":%b}", dao.insert(vo));
	}
	
	@GetMapping("/list")
	public String orderList(Model model) {
		model.addAttribute("list", dao.getUserList());
		return "Edel_OrderList_Form";
	}
	
	@GetMapping("/detail/{num}")
	public String detail(@PathVariable("num")int num, Model model) {
		model.addAttribute("order", dao.selectById(num));
		return "Edel_OrderDetail_Form";
	}
	
	@GetMapping("/delete/{num}")
	public String delete(@PathVariable("num")int num) {
		dao.delete(num);
		return "redirect:/order/list";
	}
	
	@GetMapping("/addlist")
	public String OrderAddlist() {
		return "Edel_OrderAddlist_Form";
	}
	
	@GetMapping("/file")
	public String file_upload_form() {
		return "Edel_OrderFile_Form";
	}
	
	@PostMapping("/file")
	@ResponseBody
	public String file_upload(@RequestParam("files")MultipartFile[] mfiles,
			HttpServletRequest request, @RequestParam("author") String author) {
		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("/WEB-INF/upload"); // 절대 경로 값을 가져옴
	try {	
		for(int i=0;i<mfiles.length;i++) {
			mfiles[i].transferTo(
					new File(savePath+"/"+mfiles[i].getOriginalFilename()));
	/* MultipartFile 주요 메소드
	String cType = mfiles[i].getContentType();
	String pName = mfiles[i].getName();
	Resource res = mfiles[i].getResource();
	long fSize = mfiles[i].getSize();
	boolean empty = mfiles[i].isEmpty();
	*/
	}
		String msg = String.format("파일(%d)개 저장성공(작성자:%s)", mfiles.length,author);
		return msg;
	} catch (Exception e) {
		e.printStackTrace();
		return "파일 저장 실패:";
		}
	} 
	
	@GetMapping("file/{file}")
	public ResponseEntity<Resource> download(HttpServletRequest request,
			@PathVariable String file){
		Resource resource = resourceLoader.getResource("WEB-INF/upload/"+file);
		System.out.println("파일명:"+resource.getFilename());
		String contentType = null;
	try {
		contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
	} catch (IOException e) {
		e.printStackTrace();
	}
	if(contentType == null) {
		contentType = "application/octet-stream";
	}
	return ResponseEntity.ok()
	.contentType(MediaType.parseMediaType(contentType))
	.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
	.body(resource);
	}
	
	@GetMapping("/update/{num}")
	public String orderUpdate(@PathVariable("num")int num, Model model) {
		model.addAttribute("order", dao.selectById(num));
		return "Edel_OrderUpdate_Form";
	}
	
	@PostMapping("/update2")
	@ResponseBody
	public String OrderUpdate2(EdelOrderVO vo) {
		return String.format("{\"updated\":%b}", dao.orderUpdate(vo));
	}
}
