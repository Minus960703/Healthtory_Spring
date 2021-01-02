package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.service.FreeCommentService;
import com.control.service.FreeCommunityService;
import com.control.vo.FreeCommentVO;
import com.control.vo.FreeCommunityVO;


@Controller
@RequestMapping("/freecommunity/*")
public class FreeCommunityController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getlist(@RequestParam (value="pg", required=false, defaultValue="1") String pg)throws Exception {
			
	 }
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public void getwrite() throws Exception {

	 }
	
	@RequestMapping(value = "/writeDB", method = RequestMethod.POST)
	public String getwriteDB(@RequestParam ("title") String title,
			 				@RequestParam ("text") String text,
			 				@RequestParam ("id") String id,
			 				@RequestParam ("nickname") String nickname,
			 				Model model) throws Exception {
		
		FreeCommunityVO vo = new FreeCommunityVO();
		vo.setTitle(title);
		vo.setText(text);
		vo.setId(id);
		vo.setNickname(nickname);
		
		FreeCommunityService service = new FreeCommunityService();
		service.write(vo);
		
		model.addAttribute("title", title);
		model.addAttribute("text",  text);		
		model.addAttribute("id",id);
		model.addAttribute("nickname", nickname);
		
		return "freecommunity/writeDB";
		
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public String getview(@RequestParam ("no") String no,Model model) throws Exception {
		FreeCommunityService service = new FreeCommunityService();
		service.viewsup(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "freecommunity/view";

	 }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public String getdelete(@RequestParam ("no") String no, Model model) throws Exception {
		FreeCommunityService service = new FreeCommunityService();
		service.delete(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "freecommunity/delete";
	 }
	
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	 public void geComment()throws Exception {
			
	 }
	
	@RequestMapping(value = "/commentDB", method = RequestMethod.GET)
	 public String geCommentDB(
			 @RequestParam ("comment_text") String text,
			 @RequestParam ("id") String id,
			 @RequestParam ("nickname") String nickname,
			 @RequestParam ("no") String no,			 
			 Model model)throws Exception {
		
		 FreeCommentService service=new FreeCommentService();
		 FreeCommentVO vo = new FreeCommentVO();
		 vo.setText(text);
		 vo.setId(id);
		 vo.setNickname(nickname);
		 vo.setFreeno(no);
		 service.write(vo);
		 
		 return "/freecommunity/commentDB";
	 }
}
