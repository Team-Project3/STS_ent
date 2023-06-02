package com.ezen.biz.dao;

import java.util.List;

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
	
	public List<ThboardVO> list(){
		
		System.out.println(mybatis.selectList("ThMapper.list"));
		
		return mybatis.selectList("ThboardMapper.list");
	}
	
	public List<ThboardVO> seatList(int thnum_seq){
		
		return mybatis.selectList("ThboardMapper.seatList",thnum_seq);
	}
}
