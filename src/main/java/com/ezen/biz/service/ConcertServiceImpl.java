package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.Total_entDAO;
import com.ezen.biz.dto.Total_entVO;

@Service
public class ConcertServiceImpl implements ConcertService {

	@Autowired
	private Total_entDAO concertDAO;

	@Override
	public List<Total_entVO> concertList() {
		return concertDAO.concertList();
	}

	@Override
	public Total_entVO concertDetail(Total_entVO vo) {
		return concertDAO.concertDetail(vo);
	}

	@Override
	public List<Total_entVO> AllList() {
		// TODO Auto-generated method stub
		return concertDAO.AllList();
	}

	@Override
	public List<Total_entVO> categoryList(String category) {
		// TODO Auto-generated method stub
		return concertDAO.categoryList(category);
	}

	@Override
	public void updatetotalent(Total_entVO vo) {
		// TODO Auto-generated method stub
		concertDAO.updatetotalent(vo);
	}

	@Override
	public void inserttotalent(Total_entVO vo) {
		// TODO Auto-generated method stub
		concertDAO.inserttotalent(vo);
	}

	@Override
	public void deletetotalent(Total_entVO vo) {
		// TODO Auto-generated method stub
		concertDAO.deletetotalent(vo);
	}

}
