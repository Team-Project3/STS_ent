package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ThboardDAO;
import com.ezen.biz.dto.ThboardVO;

@Service
public class ThboardServiceImpl implements ThboardService {

	@Autowired
	private ThboardDAO thboardDAO;

	@Override
	public ThboardVO seatinfo(ThboardVO vo) {

		return thboardDAO.seatinfo(vo);
	}

	@Override
	public List<ThboardVO> list() {
		
		System.out.println(thboardDAO.list());
		
		return thboardDAO.list();
	}

}
