package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.OrderDAO;
import com.ezen.biz.dto.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public void insertOrder(OrderVO vo) {
		 orderDAO.insertOrder(vo);

	}

	@Override
	public void deleteOrder(int oseq) {
		orderDAO.deleteOrder(oseq);

	}

	@Override
	public OrderVO getOrder(int oseq) {
		// TODO Auto-generated method stub
		return orderDAO.getOrder(oseq);
	}

}
