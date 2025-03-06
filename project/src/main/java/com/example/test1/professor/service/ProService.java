package com.example.test1.professor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.professor.entity.Professor;
import com.example.test1.professor.mapper.ProMapper;

@Service
public class ProService {
	
	@Autowired
	ProMapper proMapper;

	public HashMap<String, Object> getProList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Professor> list =proMapper.selectProList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return resultMap;
	}

}
