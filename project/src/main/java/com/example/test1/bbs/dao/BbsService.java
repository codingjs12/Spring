package com.example.test1.bbs.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.bbs.mapper.BbsMapper;
import com.example.test1.bbs.model.Bbs;

@Service
public class BbsService {
	
	@Autowired
	BbsMapper bbsMapper;

	public HashMap<String, Object> getBbsList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Bbs> list = bbsMapper.selectBbsList(map);
		int count = bbsMapper.selectBbsCnt(map);
		resultMap.put("list", list);
		resultMap.put("count", count);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	public HashMap<String, Object> addBbs(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
	
		bbsMapper.addBbs(map);
		
		resultMap.put("bbsNum", map.get("bbsNum"));
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> removeBbs(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		bbsMapper.deleteBbs(map);
		
		
		resultMap.put("result", "success");
		return resultMap;
	}
	
	public HashMap<String, Object> editBbs(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		bbsMapper.updateBbs(map);
		
		
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> getBbs(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Bbs info = bbsMapper.selectBbs(map);
		
		resultMap.put("info", info);
		resultMap.put("result", "success");
		
		return resultMap;		
	}

	public HashMap<String, Object> addImg(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		bbsMapper.insertFile(map);
		resultMap.put("result", "success");
		return resultMap;
	}
	
	

}
