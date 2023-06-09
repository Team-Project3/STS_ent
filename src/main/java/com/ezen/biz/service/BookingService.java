package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MuseumVO;

public interface BookingService {
	//예약 데이터 insert
	void insertBooking(BookingVO vo);
	
	//예약 데이터 seat
	List<String> selectTheater(BookingVO vo);
	
	//예약 인원수 제한 확인
	int checkHead(BookingVO vo);
		
}