package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.Total_entVO;



public interface Total_entService {
	
	List<Total_entVO> total_entList(Total_entVO vo);
	
	Total_entVO total_entDetail(Total_entVO vo);
	
	List<Total_entVO> totalList();
	
	void updatetotalent(Total_entVO vo);
	
	void inserttotalent(Total_entVO vo);
	
	void deletetotalent(Total_entVO vo);
}