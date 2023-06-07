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
	
	//����ȸ ����Ʈ
	public List<MuseumVO> museumList() {
		return mybatis.selectList("MuseumMapper.museumList");
	}
	
	//����ȸ ������
	public MuseumVO museumDetail(MuseumVO vo) {
		return mybatis.selectOne("MuseumMapper.museumDetail",vo);
	}
	
}
