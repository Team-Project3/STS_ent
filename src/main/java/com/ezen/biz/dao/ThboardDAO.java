package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ThboardVO;

@Repository
public class ThboardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ThboardVO seatinfo(ThboardVO vo) {
		return mybatis.selectOne("ThMapper.seatinfo",vo);
	}
}
