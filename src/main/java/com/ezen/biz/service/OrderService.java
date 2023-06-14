package com.ezen.biz.service;

import com.ezen.biz.dto.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO vo);

	void deleteOrder(int oseq);

	OrderVO getOrder(int oseq);
}