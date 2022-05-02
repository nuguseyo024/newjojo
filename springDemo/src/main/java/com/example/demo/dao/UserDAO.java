package com.example.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.UserXMLMapper;
import com.example.demo.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private UserXMLMapper userMapper;
	
	// 회원가입
	public int join(UserVO userVO) {
		return userMapper.join(userVO);
	}
	
	// 로그인
	public UserVO login(UserVO userVO) {
		return userMapper.login(userVO);
	}
	
	// 회원 정보 
	public UserVO userInfo(String user_id) {
		return userMapper.userInfo(user_id);
	}
	
	// 회원 정보 수정
	public boolean userEdit(UserVO userVO) {
		return userMapper.userEdit(userVO);
	}
	
	// 회원 탈퇴
	public boolean userOut(String user_id) {
		return userMapper.userOut(user_id);
	}
	

}
