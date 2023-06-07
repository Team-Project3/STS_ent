package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.TheaterVO;

public interface TheaterService {

	List<TheaterVO> theaterList();
	
	TheaterVO theaterDetail(TheaterVO vo);

}