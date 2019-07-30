package com.team.zip.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.CartVO;

@Repository
public class CartDAO extends SqlSessionDaoSupport {
	
	public void insertCart(int member_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", member_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
	
		getSqlSession().insert("cart.insertCart", map);
	}
	
	public List<CartVO> getCartList(int cart_no) {
		return getSqlSession().selectList("cart.getCartList", cart_no);
	}
	
	public CartVO getProdList(int cart_no, int prod_no) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		
		return getSqlSession().selectOne("cart.getProdList", map);
	}
	
	public void updateProdCnt(int cart_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
	
		getSqlSession().update("cart.updateProdCnt", map);
	}
	
	public void updateCounts(int cart_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
	
		getSqlSession().update("cart.updateCounts", map);
	}
	
	public int getListCnt(int cart_no) {
		return getSqlSession().selectOne("cart.getListCnt", cart_no);
	}
	
	public void deleteCartProd(int cart_no ,int prod_no) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		
		getSqlSession().delete("cart.deleteCartProd", map);
	}
	
	public CartVO getProd(int cart_no, int prod_no) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		
		return getSqlSession().selectOne("cart.getProd", map);
	}

}
