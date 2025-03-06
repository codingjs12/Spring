package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.file.entity.Img;
import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Comment;

@Service
public class BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	// get, select
	// add, insert
	// edit, update
	// remove, delete
	
	public HashMap<String, Object> getBoardList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Board> list =  boardMapper.selectBoardList(map);
			int count = boardMapper.selectBoardCnt(map);

			resultMap.put("count", count);
			resultMap.put("list", list); 
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	public HashMap<String, Object> addBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		boardMapper.insertBoard(map);
		System.out.println("key ==>" + map);
		
		resultMap.put("boardNo", map.get("boardNo"));
		resultMap.put("result", "success");
		
		return resultMap;
	}

	public HashMap<String, Object> getBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		if(map.get("option").equals("SELECT")) {
			boardMapper.updateCnt(map);
		}
		Board info = boardMapper.selectBoard(map);
		List<Comment> cmtList = boardMapper.selectCmtList(map);
		
		List<Img> fileList = boardMapper.selectFileList(map);
		
		resultMap.put("fileList", fileList);
		resultMap.put("cmtList", cmtList);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		boardMapper.updateBoard(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> boardRemove(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		boardMapper.deleteBoard(map);
		resultMap.put("result", "success");

		return resultMap;
	}

	public HashMap<String, Object> boardRemoveList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		boardMapper.deleteBoardList(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> addComment(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		boardMapper.insertComment(map);
		
		resultMap.put("result", "success");
		
		
		return resultMap;
	}

	public HashMap<String, Object> addBoardImg(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		boardMapper.insertBoardFile(map);
		resultMap.put("result", "success");
		return resultMap;
		
	}
}