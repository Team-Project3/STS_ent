package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ConcertDAO;
import com.ezen.biz.dto.ConcertVO;

@Service
public class ConcertServiceImpl implements ConcertService {

	@Autowired
	private ConcertDAO concertDAO;

	@Override
	public List<ConcertVO> concertList() {
		return concertDAO.concertList();
	}

	@Override
	public ConcertVO concertDetail(ConcertVO vo) {
		return concertDAO.concertDetail(vo);
	}

	@Override
	public List<ConcertVO> AllList() {
		// TODO Auto-generated method stub
		return concertDAO.AllList();
	}

	@Override
	public List<ConcertVO> categoryList(String category) {
		// TODO Auto-generated method stub
		return concertDAO.categoryList(category);
	}

	@Override
	public void updatetotalent(ConcertVO vo) {
		// TODO Auto-generated method stub
		concertDAO.updatetotalent(vo);
	}

}
