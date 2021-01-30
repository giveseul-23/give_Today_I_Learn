package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
	
	private List<ShopVO> cartList;
	//카트에 담긴 전체 품목 가격 합계 금액
	private int total;
	
	public Cart() {
		cartList = new ArrayList<ShopVO>();
	}
	
	public int getTotal() {
		return total;
	}
	
	public List<ShopVO> getCartList() {
		return cartList;
	}
	
	/*내가 혼자 풀지 못한 부분*/
	public void addCart(String p_num, ShopDAO dao) {
		ShopVO vo = findProduct(p_num);
		if(vo == null) {
			vo = dao.selOne(p_num);
			vo.setQuant(1);
			cartList.add(vo);
			total += vo.getP_saleprice();
		}else {
			vo.setQuant(vo.getQuant() + 1);
			total = total + vo.getP_saleprice();
		}
	}
	
	//카트에 동일 품목있는지 찾기
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		Iterator<ShopVO> ite = cartList.iterator();
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				vo = listVO;
				break;
			}
		}
		
		return vo;
	}
	
	//카트에서 수량 수정
	public String editQuant(String p_num, int su) {
		String str = "";
		ShopVO vo = findProduct(p_num);
		
		if(vo != null) {
			total = total - vo.getTotalprice();
			vo.setQuant(su);
			total = total + vo.getTotalprice();
		}else {
			str = "존재하는 목록이 없습니다.";
		}
		
		return str;
	}
	
	//카트에서 목록 삭제
	public String remove(String p_num) {
		String str = "";
		ShopVO vo = findProduct(p_num);
		
		if(vo != null) {
			cartList.remove(vo);
			total = total - vo.getTotalprice();
		}else {
			str = "존재하는 목록이 없습니다.";
		}
		
		return str;
	}
	
}
