package com.example.test1.area.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.area.dao.AreaService;
import com.google.gson.Gson;

@Controller
public class AreaController {
	
	@Autowired
	AreaService areaService;
	
	@RequestMapping("/area.do")
	public String area(Model model) throws Exception {
		
		return "/area/area";
	}
	
	@RequestMapping(value = "area/si.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String getSiList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = areaService.getSiList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "area/gu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String getGuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = areaService.getGuList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "area/dong.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String getDongList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = areaService.getDongList(map);
		
		return new Gson().toJson(resultMap);
	}

}
