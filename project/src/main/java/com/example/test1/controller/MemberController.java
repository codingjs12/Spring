package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.MemberService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/member/login.do")
	public String login(Model model) throws Exception {
		
		return "/member/member-login";
	}
	
	@RequestMapping("/member/add.do")
	public String add(Model model) throws Exception {
		
		return "/member/member-add";
	}
	
	@RequestMapping("/member/pwd.do")
	public String pwd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/member/pwd-search";
	}
	
	@RequestMapping("/member/pwd-change.do")
	public String change(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/member/pwd-change";
	}
	
	@RequestMapping(value = "/member/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = memberService.memberLogin(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/member/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = memberService.memberAdd(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/member/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = memberService.checkMember(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/member/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = memberService.getMember(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/member/change-pwd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String change(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = memberService.editMember(map);
		
		return new Gson().toJson(resultMap);
	}
	

	
	@RequestMapping(value = "/member/remove-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		String json = map.get("selectList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap = memberService.removeMemberList(map);
		
		return new Gson().toJson(resultMap);
	}
}
