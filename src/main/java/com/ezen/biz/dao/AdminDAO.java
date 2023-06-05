package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.AdminVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//관리자 유무 확인(a_id)
	public String adminCheck(String a_id) {
		return mybatis.selectOne("AdminMapper.adminCheck", a_id);
	}
	
	//관리자 정보 조회
	public AdminVO getAdmin(String a_id) {
		return mybatis.selectOne("AdminMapper.getAdmin", a_id);
	}
	

}
