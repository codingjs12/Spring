package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service
public class BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	/*
		get, select
		add, insert
		edit, update
		remove, delete
	*/
	
	public HashMap<String, Object> getBoardList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			List<Board> list = boardMapper.selectBoardList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			
		} catch(Exception e) {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

}
