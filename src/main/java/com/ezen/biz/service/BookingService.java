package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Booking_Total_entVO;

public interface BookingService {
	//���� ������ insert
	void insertBooking(BookingVO vo);
	
	//���� ������ seat
	List<String> selectTheater(BookingVO vo);
	
	//���� �ο��� ���� Ȯ��
	int checkHead(BookingVO vo);
	
	//ȸ���� ���� ����Ʈ
	List<Booking_Total_entVO> bookingMember(BookingVO vo);
	
	//���� ����
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