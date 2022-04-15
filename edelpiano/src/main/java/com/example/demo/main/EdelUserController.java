package com.example.demo.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.notice.EdelNoticeDAO;
import com.example.demo.order.EdelOrderDAO;
import com.example.demo.svc.EdelUserSVC;
import com.example.demo.video.EdelVideoDAO;
import com.example.demo.vo.EdelVO;

@Controller
@RequestMapping("/edel")
public class EdelUserController 
{
	
   @Autowired
   private EdelVideoDAO dao2;
   
   @Autowired
   private EdelNoticeDAO dao3;
   
   @Autowired
   private EdelOrderDAO dao4;
   
   @Autowired
   private EdelUserDAO dao;
   
   @Autowired
   private EdelUserSVC svc;
   
   @GetMapping("/main")
   public String mainPage(Model model) {
	   model.addAttribute("list", dao2.getVideoList());
	   model.addAttribute("notice", dao3.getNoticeList());
	   model.addAttribute("order", dao4.getUserList());
	   return "Edel_Main_Form";
   }
   
   @GetMapping("/")
   public String index() {
      return null;
   }
   
   @GetMapping("/signup")
   public String EdelSignup1() {
	   return "Edel_SignUp_Form";
   }
   
   @PostMapping("/signup")
   @ResponseBody
   public String EdelSignup(EdelVO vo) {
	   return String.format("{\"ok\":%b}", dao.insert(vo));
   }
   
  
   /* 한 행을 추가하고 저장된 자동증가 필드의 값을 가져오는 예*/
   /*
   @GetMapping("user/add/getkey")
   public int insertAndGetKey() {
      EdelVO vo = new EdelVO(0,"trump","trump123","010-3910-2540","trump@gmail.com");
      int rows = dao.addAndGetKey(vo);
      int generatedKey = vo.getNum();
      return generatedKey;
   }
   
   @GetMapping("user/{num}")
   public Map<String,Object> getEdelVO(@PathVariable int num) 
   {
	   Map<String,Object> map = new HashMap<>();
	   EdelVO vo = dao.selectById(num);
	   map.put("num", vo.getNum());
	   map.put("name", vo.getId());
	   map.put("phone", vo.getPhone());
	   map.put("email", vo.getEmail());
	   
       return map;
   }*/
   
   @GetMapping("/login")
   public String EdelLogin() {
	   return "Edel_Login_Form";
   }
   
   @PostMapping("/login")
   @ResponseBody
   public String login(EdelVO vo) {
	   
	   return String.format("{\"ok\":%b}", svc.login(vo));
   }
   
   @GetMapping("/map")
   public String EdelMap() {
	   return "Edel_Map";
   }
   
   /*
   @GetMapping("user/list")
   public String getUserList() 
   {
      return dao.getUserList().toString();
   }
   
   
   @GetMapping("user/update/{num}")
   public int updateUser(@PathVariable("num") int num) {
      return dao.update(new EdelVO(num,null,"010-3671-2105",null,"updated@gmail.com"));
   }
   
   @GetMapping("user/delete/{num}")
   public String deleteUser(@PathVariable("num")int num) {
      dao.delete(num);
      return null;
   }*/
   
}