package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ThboardVO;

public interface ThboardService {

	ThboardVO seatinfo(ThboardVO vo);
	
	List<ThboardVO> list();
	
	List<ThboardVO> seatList(int thnum_seq);

}