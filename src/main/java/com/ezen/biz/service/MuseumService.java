package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MuseumVO;

public interface MuseumService {
	
	//����ȸ ����Ʈ
	List<MuseumVO> museumList();
	
	//����ȸ ������
	MuseumVO museumDetail(MuseumVO vo);

}
