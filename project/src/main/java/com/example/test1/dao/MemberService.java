package com.example.test1.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.MemberMapper;
import com.example.test1.model.Member;

@Service
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	HttpSession session;
	
	
	public HashMap<String, Object> memberLogin(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Member member = memberMapper.getMember(map);
		
		if(member != null) {
			System.out.println("성공!");
			session.setAttribute("sessionId", member.getUserId());
			session.setAttribute("sessionName", member.getUserName());
			session.setAttribute("sessionStatus", member.getStatus());
			session.setMaxInactiveInterval(60 * 60 ); // 60 x 60초
			
			
//			session.invalidate(); 전부 날림
//			session.removeAttribute("sessionId"); 1개씩 삭제
			
			
			resultMap.put("member", member);
			resultMap.put("result", "success");
		} else {
			System.out.println("실패");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	public HashMap<String, Object> memberAdd(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		int num = memberMapper.insertMember(map);
		
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> checkMember(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Member member = memberMapper.checkMember(map);
		if(member == null) {
			System.out.println("사용가능한 아이디");
			resultMap.put("result", "success");
		} else {
			System.out.println("중복");
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
	public HashMap<String, Object> getMember(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Member member = memberMapper.checkMember(map);
		
		if(member != null) {
			resultMap.put("member", member);
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}


	public HashMap<String, Object> removeMemberList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		memberMapper.removeMemberList(map);
		resultMap.put("result", "success");
		return resultMap;
	}


	public HashMap<String, Object> editMember(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		memberMapper.updateMember(map);
		resultMap.put("result", "success");
		return resultMap;
		
	}

	

	
}