package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.CartDAO;
import com.team.zip.model.vo.CartVO;

@Service
public class CartService {
	
	@Autowired
	CartDAO cdao;
	
	public void insertCart(int member_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", member_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
		
		cdao.insertCart(member_no, prod_no, counts);
	}
	
	public List<CartVO> getCartList(int cart_no) {
		return cdao.getCartList(cart_no);
	}
	
	public CartVO getProdList(int cart_no, int prod_no) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		
		return cdao.getProdList(cart_no, prod_no);
	}
	
	public void updateProdCnt(int cart_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
	
		cdao.updateProdCnt(cart_no, prod_no, counts);
	}
	
	public void updateCounts(int cart_no, int prod_no, int counts) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		map.put("counts", counts);
	
		cdao.updateCounts(cart_no, prod_no, counts);
	}
	
	public int getListCnt(int cart_no) {
		return cdao.getListCnt(cart_no);
	}
	
	public void deleteCartProd(int cart_no ,int prod_no) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_no", cart_no);
		map.put("prod_no", prod_no);
		
		cdao.deleteCartProd(cart_no, prod_no);
	}
	
}
