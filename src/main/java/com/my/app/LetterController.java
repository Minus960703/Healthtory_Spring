package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.service.FreeCommunityService;
import com.control.service.LetterService;
import com.control.vo.FreeCommunityVO;
import com.control.vo.LetterVO;


@Controller
@RequestMapping("/letter/*")
public class LetterController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getlist() throws Exception {

	 }
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public void getwrite() throws Exception {

	 }
	
	@RequestMapping(value = "/writeDB", method = RequestMethod.POST)
	public String getwriteDB(@RequestParam ("Tonickname") String Tonickname,
			 				@RequestParam ("text") String text,
			 				@RequestParam ("Fromid") String Fromid,
			 				@RequestParam ("Fromnickname") String Fromnickname,
			 				Model model) throws Exception {
		
		LetterVO vo = new LetterVO();
		vo.setTonickname(Tonickname);
		vo.setText(text);
		vo.setFromid(Fromid);
		vo.setFromnickname(Fromnickname);
		
		LetterService service = new LetterService();
		service.write(vo);
		
		model.addAttribute("Tonickname", Tonickname);
		model.addAttribute("text", text);		
		model.addAttribute("Fromid", Fromid);
		model.addAttribute("Fromnickname", Fromnickname);
		
		return "letter/writeDB";
		
	}
	
	@RequestMapping(value = "/nicknameCheck", method = RequestMethod.GET)
	 public void getnicknameCheck() throws Exception {

	 }
	
	@RequestMapping(value = "/viewReceive", method = RequestMethod.GET)
	 public String getviewReceive(@RequestParam ("no") String no,Model model) throws Exception {
		LetterService service = new LetterService();
		
		model.addAttribute("no",no);
		
		return "letter/viewReceive";

	 }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public String getdelete(@RequestParam ("no") String no, Model model) throws Exception {
		LetterService service = new LetterService();
		service.delete(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "letter/delete";
	 }
	
	@RequestMapping(value = "/viewSend", method = RequestMethod.GET)
	 public String getviewSend(@RequestParam ("no") String no,Model model) throws Exception {
		LetterService service = new LetterService();
		
		model.addAttribute("no",no);
		
		return "letter/viewSend";

	 }
}
