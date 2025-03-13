package com.example.test1.common.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.common.mapper.CommonMapper;
import com.example.test1.common.model.Menu;

@Service
public class CommonService {
	@Autowired
	CommonMapper commonMapper;

	public HashMap<String, Object> getMenuList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		map.put("depth", 1);
		List<Menu> mainList = commonMapper.selectMenuList(map);
		
		map.put("depth", 2);
		List<Menu> subList = commonMapper.selectMenuList(map);
		
		resultMap.put("mainList", mainList);
		resultMap.put("subList", subList);
		
		return resultMap;
	}

}
