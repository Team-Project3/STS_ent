package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.OrderVO;

@Repository
public class OrderDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertOrder(OrderVO vo) {
		mybatis.insert("OrderMapper.insertOrder",vo);
	}
	
	public void deleteOrder(int oseq) {
		mybatis.delete("OrderMapper.deleteOrder",oseq);
	}
	
	public OrderVO getOrder(String id) {
		return mybatis.selectOne("OrderMapper.getOrder",id);
	}
}
