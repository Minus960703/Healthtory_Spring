package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.service.WorkOutService;

@Controller
@RequestMapping("/workout/*")
public class WorkoutController {
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList() throws Exception {

	 }
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public String getView(@RequestParam ("no") String no,Model model) throws Exception {
		WorkOutService service=new WorkOutService();
		
		service.viewsup(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "workout/view";
	 }
}
