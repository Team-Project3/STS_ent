package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BookingVO;

@Repository
public class BookingDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//예약 데이터 insert
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingMapper.insertBooking",vo);
	}
	
	//예약 데이터 seat
	public List<String> selectTheater(BookingVO vo) {
		return mybatis.selectList("BookingMapper.selectTheater",vo);
	}
	
	//예약 인원수 제한 확인
	public int checkHead(BookingVO vo)  {
		try {
			return mybatis.selectOne("BookingMapper.checkHead", vo);
		} catch (NullPointerException e) {
			return 0;
		}
		
	}
	
}
