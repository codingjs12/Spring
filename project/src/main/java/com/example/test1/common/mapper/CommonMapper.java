package com.example.test1.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.common.model.Menu;

@Mapper
public interface CommonMapper {

	List<Menu> selectMenuList(HashMap<String, Object> map);
	

}
