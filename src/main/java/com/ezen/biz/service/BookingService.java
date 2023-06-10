package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MuseumVO;

public interface BookingService {
	//���� ������ insert
	void insertBooking(BookingVO vo);
	
	//���� ������ seat
	List<String> selectTheater(BookingVO vo);
	
	//���� �ο��� ���� Ȯ��
	int checkHead(BookingVO vo);
		
}