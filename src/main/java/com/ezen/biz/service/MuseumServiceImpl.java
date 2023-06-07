package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.MuseumDAO;
import com.ezen.biz.dto.MuseumVO;

@Service
public class MuseumServiceImpl implements MuseumService {
	
	@Autowired
	private MuseumDAO museumDao;

	@Override
	public List<MuseumVO> museumList() {
		return museumDao.museumList();
	}

	@Override
	public MuseumVO museumDetail(MuseumVO vo) {
		return museumDao.museumDetail(vo);
	}

}
