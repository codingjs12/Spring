package com.example.test1.professor.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.professor.service.ProService;
import com.google.gson.Gson;

@Controller
public class ProController {
	
	@Autowired
	ProService proService;
	
	@GetMapping("/pro/list.do")
	public String list() {
		
		return "/pro/pro-list";
	}
	@PostMapping("/pro/list.dox")
	@ResponseBody
	public String list(Model model, @RequestParam HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = proService.getProList(map);
		return new Gson().toJson(resultMap);
	}

}
