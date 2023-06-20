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
	
	//콘서트 리스트
	public List<Total_entVO> concertList() {
		return mybatis.selectList("ConcertMapper.concertList");
	}
	
	//콘서트 디테일
	public Total_entVO concertDetail(Total_entVO vo) {
		return mybatis.selectOne("ConcertMapper.concertDetail",vo);
	}
	
	//연극 리스트
	public List<Total_entVO> theaterList() {
		
		return mybatis.selectList("ThMapper.theaterList");
	}
	
	//연극 디테일
	public Total_entVO theaterDetail(Total_entVO vo) {
		
		return mybatis.selectOne("ThMapper.theaterDetail",vo);
	}
	
	//전시회 리스트
	public List<Total_entVO> museumList() {
		return mybatis.selectList("MuseumMapper.museumList");
	}
	
	//전시회 디테일
	public Total_entVO museumDetail(Total_entVO vo) {
		return mybatis.selectOne("MuseumMapper.museumDetail",vo);
	}
	
	//관리자 : 모든 공연 리스트
	public List<Total_entVO> AllList() {
		return mybatis.selectList("ConcertMapper.List");
	}
	
	//관리자 : 카테고리별 공연 리스트 --합치기 가능
	public List<Total_entVO> categoryList(String category) {
		return mybatis.selectList("ConcertMapper.categoryList",category);
	}
	
	//관리자 : 공연 수정
	public void updatetotalent(Total_entVO vo) {
		mybatis.update("ConcertMapper.updatetotalent",vo);
	}
	
	//관리자 : 공연 추가
	public void inserttotalent(Total_entVO vo) {
		mybatis.insert("ConcertMapper.inserttotalent",vo);
	}
	
	//관리자 : 공연 삭제
	public void deletetotalent(Total_entVO vo) {
		mybatis.delete("ConcertMapper.deletetotalent",vo);
	}
}
