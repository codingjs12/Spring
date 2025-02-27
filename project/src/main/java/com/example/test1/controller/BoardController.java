package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/list.do")
	public String list(Model model) throws Exception {
		
		return "/board/board-list";
	}
	
	//게시글 목록
	@RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = boardService.getBoardList(map);
		
		return new Gson().toJson(resultMap);
	}

}
