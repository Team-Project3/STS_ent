package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.Total_entVO;

@Repository
public class Total_entDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//공연 카테고리별 리스트
	public List<Total_entVO> total_entList(Total_entVO vo) {
		return mybatis.selectList("Total_entMapper.total_entList",vo);
	}
	
	//공연 디테일
	public Total_entVO total_entDetail(Total_entVO vo) {
		return mybatis.selectOne("Total_entMapper.total_entDetail",vo);
	}
	
	//관리자 : 모든 공연 리스트
	public List<Total_entVO> totalList() {
		return mybatis.selectList("Total_entMapper.totalList");
	}
	
	//관리자 : 공연 수정
	public void updatetotalent(Total_entVO vo) {
		mybatis.update("Total_entMapper.updatetotalent",vo);
	}
	
	//관리자 : 공연 추가
	public void inserttotalent(Total_entVO vo) {
		mybatis.insert("Total_entMapper.inserttotalent",vo);
	}
	
	//관리자 : 공연 삭제
	public void deletetotalent(Total_entVO vo) {
		mybatis.delete("Total_entMapper.deletetotalent",vo);
	}
}
