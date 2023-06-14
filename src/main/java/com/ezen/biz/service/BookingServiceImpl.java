package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.BookingDAO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.totalbookVO;

@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	@Override
	public void insertBooking(BookingVO vo) {
		bookingDAO.insertBooking(vo);
	}

	@Override
	public List<String> selectTheater(BookingVO vo) {
		return bookingDAO.selectTheater(vo);
	}

	@Override
	public int checkHead(BookingVO vo) {
		return bookingDAO.checkHead(vo);
	}
	
	@Override	//회원별 예약 리스트
	public List<totalbookVO> bookingMember(BookingVO vo) {
		return bookingDAO.bookingMember(vo);
	}
}
