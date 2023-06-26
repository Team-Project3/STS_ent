package com.ezen.biz.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.Booking_Total_entVO;

@Repository
public class BookingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// ���� ������ insert
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingMapper.insertBooking", vo);

	}

	// ���� ������ seat
	public List<String> selectTheater(BookingVO vo) {
		return mybatis.selectList("BookingMapper.selectTheater", vo);
	}

	// ���� �ο��� ���� Ȯ��
	public int checkHead(BookingVO vo) {
		try {
			return mybatis.selectOne("BookingMapper.checkHead", vo);
		} catch (NullPointerException e) {
			return 0;
		}

	}

	// ȸ���� ���� ����Ʈ
	public List<Booking_Total_entVO> bookingMember(BookingVO vo) {
		return mybatis.selectList("BookingMapper.bookingMember", vo);
	}

	// ���� ����
	public void deleteBooking(BookingVO vo) {
		mybatis.delete("BookingMapper.deleteBooking", vo);
	}

	public List<Booking_Total_entVO> bookingList() {
		return mybatis.selectList("BookingMapper.bookingList");
	}

	public List<Booking_Total_entVO> bookingListcategory(String category) {
		return mybatis.selectList("BookingMapper.bookingListcategory", category);
	}

	public BookingVO bookingdetail(BookingVO vo) {
		return mybatis.selectOne("BookingMapper.bookingdetail", vo);
	}

	public void updatebooking(BookingVO vo) {
		mybatis.update("BookingMapper.updatebooking", vo);
	}
	
	public void adeletebooking(BookingVO vo) {
		mybatis.delete("BookingMapper.adeletebooking",vo);
	}
	
	public void deleteBookingfromid(String id) {
		mybatis.delete("BookingMapper.deleteBookingfromid",id);
	}
	
	public int sumprice(int month,int year) {
		return mybatis.selectOne("BookingMapper.sumprice",Map.of("month", month, "year", year));
	}
	
	public int sumheadcategory(int category,int month,int year) {
		return mybatis.selectOne("BookingMapper.sumheadcategory",Map.of("category",category,"month", month, "year", year));
	}
	
	public int sumheadtotal(int month,int year) {
		return mybatis.selectOne("BookingMapper.sumheadtotal",Map.of("month", month, "year", year));
	}
}
