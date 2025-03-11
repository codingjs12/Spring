package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Member;

@Mapper
public interface MemberMapper {

	Member getMember(HashMap<String, Object> map);

	int insertMember(HashMap<String, Object> map);

	Member checkMember(HashMap<String, Object> map);

	void removeMemberList(HashMap<String, Object> map);

	void updateMember(HashMap<String, Object> map);

	
}
