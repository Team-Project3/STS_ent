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
	
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingMapper.insertBooking",vo);
	}
	
	public List<String> selectTheater(BookingVO vo) {
		
		return mybatis.selectList("BookingMapper.selectTheater",vo);
	}
}
