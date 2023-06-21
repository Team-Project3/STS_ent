package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.Total_entDAO;
import com.ezen.biz.dto.Total_entVO;

@Service
public class Total_entServiceImpl implements Total_entService {

	@Autowired
	private Total_entDAO total_entDAO;

	@Override
	public List<Total_entVO> total_entList(Total_entVO vo) {
		return total_entDAO.total_entList(vo);
	}

	@Override
	public Total_entVO total_entDetail(Total_entVO vo) {
		return total_entDAO.total_entDetail(vo);
	}

	@Override
	public List<Total_entVO> totalList() {
		return total_entDAO.totalList();
	}

	@Override
	public void updatetotalent(Total_entVO vo) {
		total_entDAO.updatetotalent(vo);
	}

	@Override
	public void inserttotalent(Total_entVO vo) {
		total_entDAO.inserttotalent(vo);
	}

	@Override
	public void deletetotalent(Total_entVO vo) {
		total_entDAO.deletetotalent(vo);
	}
}