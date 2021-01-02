package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.dao.UserDAO;
import com.control.vo.UserVO;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	 public void getjoin() throws Exception {

	 }
	
	@RequestMapping(value = "/joinDB", method = RequestMethod.POST)
	 public String getjoinDB(
			 @RequestParam String id ,
			 @RequestParam String pw,
			 @RequestParam String name,
			 @RequestParam String phone,
			 @RequestParam String email,
			 @RequestParam String nickname,
			 Model model			 
			 ) throws Exception {
		
		String messege="";	
		
		UserVO CVO=new UserVO(id, pw, name, phone, email, nickname);
		UserDAO CDAO=new UserDAO();
		String result = CDAO.Join(CVO);
		
		if(result=="join") {				
			messege="Join seccess";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("nickname", nickname);
			model.addAttribute("messege",messege);
			return "user/joinDB";
		}
		else if(result=="sameid") {

			messege="Join fail:sameid exists";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("nickname", nickname);
			model.addAttribute("messege",messege);
			return "user/join";
		}
		else {
			messege="Join fail"+result;
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("name", name);
			model.addAttribute("nickname", nickname);
			model.addAttribute("messege",messege);
			return "user/join";
			
		}
		
	 }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	 public void getlogin() throws Exception {
		
	 }
	
	@RequestMapping(value = "/loginDB", method = RequestMethod.POST)
	 public String getloginDB( @RequestParam ("id") String id,
			   @RequestParam ("pw") String pw, Model model) throws Exception {
		
		String messege="";
		
		UserVO CVO=new UserVO(id, pw);
		UserDAO CDAO=new UserDAO();
		String nickname =CDAO.Login(CVO);
		if(nickname!=null) {
			messege="login success";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			model.addAttribute("nickname", nickname);
			model.addAttribute("messege",messege);
			return "user/loginDB";
		}
		else {
			messege="login fail";
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);			
			model.addAttribute("nickname", nickname);
			model.addAttribute("messege",messege);
			return "user/login";
		}			
	 }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String getlogout() throws Exception {

		
		return "user/logout";
	 }
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	 public void getidCheck() throws Exception {

	 }
	
	@RequestMapping(value = "/nicknameCheck", method = RequestMethod.GET)
	 public void getnicknameCheck() throws Exception {

	 }
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	 public void getmypage() throws Exception {
		
	 }
	
	@RequestMapping(value = "/my/changeinfo", method = RequestMethod.GET)
	 public void getmychangeinfo() throws Exception {
		
	 }
	
	@RequestMapping(value = "/my/changeinfoDB", method = RequestMethod.POST)
	 public String getmychangeinfoDB(
			 @RequestParam ("id") String id,
			   @RequestParam ("pw") String pw,
			   @RequestParam ("phone") String phone,
			   @RequestParam ("jobtype") String jobtype,
			   Model model
			   ) throws Exception {
		
		UserVO vo = new UserVO(id,pw);
		UserDAO dao =new UserDAO();
		
		System.out.println("a"+jobtype+"a");
		
		if(jobtype.equals("pw")){
			String result = dao.updatePassword(vo);
			model.addAttribute("result",result);
			System.out.println("a"+jobtype+"a");
			
			return "user/my/changeinfoDB";
			
		}
		else if(jobtype=="phone") {
			String result = dao.updatePhone(vo);
			model.addAttribute("result",result);
			return "user/my/changeinfoDB";
		}
		
		return "user/my/changeinfoDB";
		
		
	 }
	
	@RequestMapping(value = "/my/mylist", method = RequestMethod.GET)
	 public void getmymylist() throws Exception {
		
	 }
	
	@RequestMapping(value = "/my/mycomment", method = RequestMethod.GET)
	 public void getmymycomment() throws Exception {
		
	 }
}
