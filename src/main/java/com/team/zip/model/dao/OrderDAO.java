package com.team.zip.model.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.OrderVO;

@Repository
public class OrderDAO extends SqlSessionDaoSupport {
	
	public void insertOne(OrderVO ovo) {
		getSqlSession().insert("order.orderOne", ovo);
	}
	
	public void insertOneDetail(OrderVO ovo) {
		getSqlSession().insert("order.orderOneDetail", ovo);
	}
}
