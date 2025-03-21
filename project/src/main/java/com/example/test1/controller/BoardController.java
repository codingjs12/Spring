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

import com.example.test1.dao.BoardService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/list.do") 
    public String login(Model model) throws Exception{
        return "/board/board-list"; 
    }
	
	@RequestMapping("/board/add.do") 
    public String add(Model model) throws Exception{

        return "/board/board-add"; 
    }
	
	@RequestMapping("/board/view.do") 
    public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board/board-view"; 
    }
	
	@RequestMapping("/board/edit.do") 
    public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board/board-edit"; 
    }
	
	// 게시글 목록
	@RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String memberList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = boardService.getBoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 추가
	@RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = boardService.addBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "/board/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = boardService.getBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 수정
	@RequestMapping(value = "/board/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = boardService.editBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = boardService.boardRemove(map);
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 여러개 삭제
	@RequestMapping(value = "/board/remove-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		String json = map.get("selectList").toString(); 
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		
		System.out.println(map);
		resultMap = boardService.boardRemoveList(map);
		return new Gson().toJson(resultMap);
	}
	
	
	// 게시글 여러개 삭제
	@RequestMapping(value = "/board/cmt-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cmtAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = boardService.addComment(map);
		
		return new Gson().toJson(resultMap);
	}
}
