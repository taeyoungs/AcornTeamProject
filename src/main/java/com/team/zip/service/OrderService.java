package com.team.zip.service;

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
}
