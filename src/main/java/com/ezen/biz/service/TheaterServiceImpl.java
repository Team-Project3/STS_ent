package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.TheaterDAO;
import com.ezen.biz.dto.TheaterVO;
@Service
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	private TheaterDAO theaterDAO;
	
	@Override
	public List<TheaterVO> theaterList() {
		// TODO Auto-generated method stub
		return theaterDAO.theaterList();
	}

	@Override
	public TheaterVO theaterDetail(TheaterVO vo) {
		// TODO Auto-generated method stub
		return theaterDAO.theaterDetail(vo);
	}

}
