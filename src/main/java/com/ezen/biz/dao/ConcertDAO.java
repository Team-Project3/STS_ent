package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ConcertVO;

@Repository
public class ConcertDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ConcertVO> concertList() {
		return mybatis.selectList("ConcertMapper.concertList");
	}
	
	public ConcertVO concertDetail(ConcertVO vo) {
		return mybatis.selectOne("ConcertMapper.concertDetail",vo);
	}
	
	public List<ConcertVO> AllList() {
		return mybatis.selectList("ConcertMapper.List");
	}
	
	public List<ConcertVO> categoryList(String category) {
		return mybatis.selectList("ConcertMapper.categoryList",category);
	}
	
	public void updatetotalent(ConcertVO vo) {
		mybatis.update("ConcertMapper.updatetotalent",vo);
	}
	
	public void inserttotalent(ConcertVO vo) {
		mybatis.insert("ConcertMapper.inserttotalent",vo);
	}
}
