package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MuseumVO;

@Repository
public class MuseumDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//전시회 리스트
	public List<MuseumVO> museumList() {
		return mybatis.selectList("MuseumMapper.museumList");
	}
	
	//전시회 디테일
	public MuseumVO museumDetail(MuseumVO vo) {
		return mybatis.selectOne("MuseumMapper.museumDetail",vo);
	}
	
}
