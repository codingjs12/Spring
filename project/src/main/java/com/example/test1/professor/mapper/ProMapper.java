package com.example.test1.professor.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.professor.entity.Professor;

@Mapper
public interface ProMapper {

	List<Professor> selectProList(HashMap<String, Object> map);

}
