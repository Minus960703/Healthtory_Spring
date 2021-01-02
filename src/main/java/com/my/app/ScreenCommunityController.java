package com.my.app;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import java.sql.Date;
import java.util.UUID;

import javax.swing.text.html.HTMLEditorKit.Parser;
import org.aspectj.lang.annotation.Pointcut;
import org.json.simple.JSONObject;
import org.apache.commons.io.FileUtils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.control.dao.ScreenCommunityDAO;
import com.control.service.FreeCommentService;
import com.control.service.ScreenCommentService;
import com.control.service.ScreenCommunityService;
import com.control.vo.FreeCommentVO;
import com.control.vo.ScreenCommentVO;
import com.control.vo.ScreenCommunityVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.persistence.Entity;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Controller
@RequestMapping("/screencommunity/*")
public class ScreenCommunityController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getlist(@RequestParam (value="pg", required=false, defaultValue="1") String pg)throws Exception {
		
	 }
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	 public void getwrite() throws Exception {

	 }
	
	@RequestMapping(value = "/writeDB", method = RequestMethod.POST)
	public String getwriteDB(@RequestParam ("title") String title,
			 				@RequestParam ("editordata") String editordata,
			 				@RequestParam ("id") String id,
			 				@RequestParam ("nickname") String nickname,
			 				@RequestParam ("sumnail") String sumnail,
			 				Model model) throws Exception {
		
		ScreenCommunityVO vo = new ScreenCommunityVO();
		if(sumnail.equals("null")){
			sumnail="/resources/image/screencommunity/icon.jpg";
		}
		vo.setTitle(title);
		vo.setText(editordata);
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setSumnail(sumnail);
		
		ScreenCommunityService service = new ScreenCommunityService();
		service.write(vo);
		
		model.addAttribute("title", title);
		model.addAttribute("text",  editordata);		
		model.addAttribute("id",id);
		model.addAttribute("nickname", nickname);
		
		return "screencommunity/writeDB";
		
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	 public String getview(@RequestParam ("no") String no,Model model) throws Exception {
		ScreenCommunityService service = new ScreenCommunityService();
		service.viewsup(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "screencommunity/view";

	 }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public String getdelete(@RequestParam ("no") String no,Model model) throws Exception {
		ScreenCommunityService service = new ScreenCommunityService();
		service.delete(Integer.parseInt(no));
		
		model.addAttribute("no",no);
		
		return "screencommunity/delete";
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
		
		 ScreenCommentService service=new ScreenCommentService();
		 ScreenCommentVO vo = new ScreenCommentVO();
		 vo.setText(text);
		 vo.setId(id);
		 vo.setNickname(nickname);
		 vo.setScreenno(no);
		 service.write(vo);
		 
		 return "/screencommunity/commentDB";
			
	 }
	
	@RequestMapping(value="image", produces = "application/json" , method= {RequestMethod.POST})
	@ResponseBody
	 public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		JSONObject jsonObject = new JSONObject();
		Gson gson= new Gson();

		String fileRoot = "C:\\Users\\YUHAN\\Desktop\\Healthory\\src\\main\\webapp\\resources\\image\\screencommunity\\";
		String root="/resources/image/screencommunity/";
		String originalFileName = file.getOriginalFilename();	
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	
				
		String savedFileName = UUID.randomUUID() + extension;	
		
		File targetFile = new File(fileRoot + savedFileName);	
	
		System.out.println(originalFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	
			jsonObject.put("url", root+savedFileName);
			jsonObject.put("responseCode", "success");
			System.out.println(""+jsonObject.get("url"));			
			System.out.println("success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	
			jsonObject.put("url", "error");
			jsonObject.put("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
    }	
}
