package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.TheaterVO;


@Repository
public class TheaterDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<TheaterVO> theaterList() {
		
		return mybatis.selectList("ThMapper.theaterList");
	}
	
	public TheaterVO theaterDetail(TheaterVO vo) {
		
		return mybatis.selectOne("ThMapper.theaterDetail",vo);
	}
}
