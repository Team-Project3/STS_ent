package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ConcertVO;



public interface ConcertService {

	List<ConcertVO> concertList();
	
	ConcertVO concertDetail(ConcertVO vo);

	List<ConcertVO> AllList();
	
	List<ConcertVO> categoryList(String category);
	
	void updatetotalent(ConcertVO vo);
	
	void inserttotalent(ConcertVO vo);
	
	void deletetotalent(ConcertVO vo);
}