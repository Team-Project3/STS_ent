package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Booking_Total_entVO;

public interface BookingService {
	//예약 데이터 insert
	void insertBooking(BookingVO vo);
	
	//예약 데이터 seat
	List<String> selectTheater(BookingVO vo);
	
	//예약 인원수 제한 확인
	int checkHead(BookingVO vo);
	
	//회원별 예약 리스트
	List<Booking_Total_entVO> bookingMember(BookingVO vo);
	
	//예약 삭제
	void deleteBooking(BookingVO vo);
	
	List<Booking_Total_entVO> bookingList();
	
	List<Booking_Total_entVO> bookingListcategory(String category);
	
	BookingVO bookingdetail(BookingVO vo);
	
	void updatebooking(BookingVO vo);
	
	void adeletebooking(BookingVO vo);
		
	int sumprice(int month,int year);
	
	int sumheadcategory(int category,int month,int year);
	
	int sumheadtotal(int month,int year);
}