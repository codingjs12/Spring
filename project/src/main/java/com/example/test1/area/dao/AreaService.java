package com.example.test1.area.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.area.mapper.AreaMapper;
import com.example.test1.area.model.Area;

@Service
public class AreaService {
	
	@Autowired
	AreaMapper areaMapper;

	public HashMap<String, Object> getSiList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Area> siList = areaMapper.selectSiList(map);
		resultMap.put("siList", siList);
		resultMap.put("result", "success");
		return resultMap;
	}

	public HashMap<String, Object> getGuList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Area> guList = areaMapper.selectGuList(map);
		resultMap.put("guList", guList);
		resultMap.put("result", "success");
		return resultMap;
	}
	
	public HashMap<String, Object> getDongList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Area> dongList = areaMapper.selectDongList(map);
		resultMap.put("dongList", dongList);
		resultMap.put("result", "success");
		return resultMap;
	}

}
