package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.OrderDAO;
import com.team.zip.model.vo.OrderVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	public void insertOne(OrderVO ovo){
		dao.insertOne(ovo);
	}
	
	public void insertOneDetail(OrderVO ovo) {
		dao.insertOneDetail(ovo);
	}
	
	public List<OrderVO> orderRecent() {
		return dao.orderRecent();
	}
	
	public void blankCart(int num) {
		dao.blankCart(num);
	}
}
