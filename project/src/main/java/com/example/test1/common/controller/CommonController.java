package com.example.test1.common.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.common.dao.CommonService;
import com.google.gson.Gson;

@Controller
public class CommonController {
	@Autowired
	CommonService commonService;
	
	@RequestMapping("/map.do")
	public String map(Model model) throws Exception{
		return "/map";
	}

	@RequestMapping("/date.do")
	public String date(Model model) throws Exception{
		return "/calender";
	}
	
	@RequestMapping("/swiper.do")
	public String swiper(Model model) throws Exception{
		return "/swiper";
	}
	
	
	@RequestMapping(value = "/menu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String menu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = commonService.getMenuList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/payment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String pay(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = commonService.getPay(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	
	
	

}
