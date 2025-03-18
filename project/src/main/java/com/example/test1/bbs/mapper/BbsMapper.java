package com.example.test1.bbs.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.bbs.model.Bbs;

@Mapper
public interface BbsMapper {

	List<Bbs> selectBbsList(HashMap<String, Object> map);

	void addBbs(HashMap<String, Object> map);

	void deleteBbs(HashMap<String, Object> map);

	void updateBbs(HashMap<String, Object> map);

	Bbs selectBbs(HashMap<String, Object> map);

	int selectBbsCnt(HashMap<String, Object> map);

	void insertFile(HashMap<String, Object> map);
	
}
