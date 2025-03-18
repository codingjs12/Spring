package com.example.test1.bbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.bbs.dao.BbsService;
import com.example.test1.common.Common;
import com.google.gson.Gson;

@Controller
public class BbsController {
	
	@Autowired
	BbsService bbsService;
	
	@RequestMapping("/bbs/list.do")
	String list(Model model) throws Exception{
		
		return "/bbs/bbs-list";
	}
	
	@RequestMapping("/bbs/add.do")
	String add(Model model) throws Exception{
		
		return "/bbs/bbs-add";
	}
	
	@RequestMapping("/bbs/view.do")
	String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/bbs/bbs-view";
	}
	
	@RequestMapping("/bbs/edit.do")
	String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/bbs/bbs-edit";
	}
	
	@RequestMapping(value = "/bbs/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = bbsService.getBbsList(map); 
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = bbsService.addBbs(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bbsRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = bbsService.removeBbs(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = bbsService.getBbs(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = bbsService.editBbs(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/bbs/fileUpload.dox")
	public String result(@RequestParam("file1") List<MultipartFile> files, @RequestParam("bbsNum") int bbsNum,
			HttpServletRequest request, HttpServletResponse response, Model model) {

		String url = null;
		String path = "c:\\img";
		try {
			for (MultipartFile multi : files) {
				// String uploadpath = request.getServletContext().getRealPath(path);
				String uploadpath = path;
				String originFilename = multi.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				long size = multi.getSize();
				String saveFileName = Common.genSaveFileName(extName);

				System.out.println("uploadpath : " + uploadpath);
				System.out.println("originFilename : " + originFilename);
				System.out.println("extensionName : " + extName);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);
				String path2 = System.getProperty("user.dir");
				System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
				if (!multi.isEmpty()) {
					File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
					multi.transferTo(file);

					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("filename", saveFileName);
					map.put("path", "../img/" + saveFileName);
					map.put("originFilename", originFilename);
					map.put("extName", extName); // 확장자
					map.put("size", size);
					map.put("bbsNum", bbsNum);
					// insert 쿼리 실행
					bbsService.addImg(map);
				}
			}

			return "redirect:/bbs/list.do";
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:/bbs/list.do";
	}

}
