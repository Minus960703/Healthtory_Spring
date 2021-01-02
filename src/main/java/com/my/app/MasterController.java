package com.my.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.control.service.WorkOutService;
import com.control.vo.WorkOutVO;

@Controller
@RequestMapping("/master/*")
public class MasterController {

	TransText transText=new TransText();
	
	@RequestMapping(value = "/addWorkOut", method = RequestMethod.GET)
	 public void getAddWorkOut() throws Exception {

	 }
	
	@RequestMapping(value = "/addWorkOutDB", method = RequestMethod.POST)
	 public String getAddWorkOutDB(@RequestParam ("name") String name,
				@RequestParam ("part") String part,
				@RequestParam ("url") String url,
				@RequestParam ("explain") String explain,
				Model model) throws Exception {
		String partName;
		partName=transText.whatPart(part);
		
		WorkOutVO vo=new WorkOutVO();
		vo.setName(name);
		vo.setPart(part);
		vo.setPartName(partName);
		
		url=url.replace("watch?v=", "embed/");
		vo.setUrl(url);
		
		vo.setExplain(explain);
		
		WorkOutService service=new WorkOutService();
		service.write(vo);
		
		model.addAttribute("name", name);
		model.addAttribute("part",  part);		
		model.addAttribute("url",url);
		model.addAttribute("explain", explain);
		
		return "master/addWorkOutDB";
	 }
}
