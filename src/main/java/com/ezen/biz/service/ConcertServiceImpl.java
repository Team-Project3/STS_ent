package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ConcertDAO;
import com.ezen.biz.dao.TheaterDAO;
import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.dto.TheaterVO;
@Service
public class ConcertServiceImpl implements ConcertService {

	@Autowired
	private ConcertDAO concertDAO;

	@Override
	public List<ConcertVO> concertList() {
		// TODO Auto-generated method stub
		return concertDAO.concertList();
	}

	@Override
	public ConcertVO concertDetail(ConcertVO vo) {
		// TODO Auto-generated method stub
		return concertDAO.concertDetail(vo);
	}

}
