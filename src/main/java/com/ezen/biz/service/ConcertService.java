package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ConcertVO;

public interface ConcertService {

	List<ConcertVO> concertList();
	
	ConcertVO concertDetail(ConcertVO vo);

}