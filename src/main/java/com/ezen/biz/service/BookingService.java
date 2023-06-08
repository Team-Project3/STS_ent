package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;

public interface BookingService {

	void insertBooking(BookingVO vo);
	
	List<String> selectTheater(BookingVO vo);
}