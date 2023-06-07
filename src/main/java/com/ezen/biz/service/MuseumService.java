package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MuseumVO;

public interface MuseumService {
	
	//전시회 리스트
	List<MuseumVO> museumList();
	
	//전시회 디테일
	MuseumVO museumDetail(MuseumVO vo);

}
