package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.Total_entVO;



public interface ConcertService {

	List<Total_entVO> concertList();
	
	Total_entVO concertDetail(Total_entVO vo);

	List<Total_entVO> AllList();
	
	List<Total_entVO> categoryList(String category);
	
	void updatetotalent(Total_entVO vo);
	
	void inserttotalent(Total_entVO vo);
	
	void deletetotalent(Total_entVO vo);
}