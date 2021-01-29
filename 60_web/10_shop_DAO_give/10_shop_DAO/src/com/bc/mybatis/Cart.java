package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//장바구니(카트) 역할 클래스
public class Cart {
	private List<ShopVO> list; //카트에 담긴 제품 목록
	private int total; //카트에 담긴 전체 품목 가격 합계 금액
	
	public Cart() {
		list = new ArrayList<ShopVO>();
	}
	
	//장바구니 리스트
	public List<ShopVO> getList() {
		return list;
	}
	//토탈값 - 임의대로 토탈값을 변경할수 없음 지금 set이 없음
	public int getTotal() {
		return total;
	}

	/** 장바구니에 담기 요청 처리(카트에 제품 추가)
	 *  list에 없으면 제품추가
	 *  list에 동일한 제품이 있으면 수량 1개 증가 처리
	 */
	public void addProduct(String p_num, ShopDAO dao) {
		//카트에 제품이 있는지 확인
		ShopVO vo = findProduct(p_num);
		if (vo == null) { //카트에 없음
			vo = dao.selectOne(p_num); //p_num 사용 DB에서 조회해서 VO 생성
			vo.setQuant(1); //카트에 담을 물건 준비(단일품목 금액 계산완료)
			list.add(vo); //카트에 담기
			total += vo.getP_saleprice(); //카트total 재계산(제품하나 가격 추가)
		} else { //카트에 있음 : 수량 1 증가 -> 카트 total 재계산
			vo.setQuant(vo.getQuant() + 1);
			//total 재계산 : 기존금액 + 새로추가된 제품 1개 가격
			total = total + vo.getP_saleprice();
		}
	}
	
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		Iterator<ShopVO> ite = list.iterator();
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				vo = listVO;
				break;
			}
		}
		
		return vo;
	}
	
	//카트에서 제품 삭제(꺼내기)
	public void delProduct(String p_num) {
		ShopVO vo = findProduct(p_num);
		if(vo != null){
			list.remove(vo); // null이 아니면 해당 객체를 삭제함
			
			//카트 합계금액에서 제품 금액을 빼기
			total  = total - vo.getTotalprice(); //품목 갯수만큼의 토탈금액을 뺀다.
		}
	}
	
	//제품수량 변경처리
	public void setQuant(String p_num, int su) {
		ShopVO vo = findProduct(p_num);
		
		System.out.println("전 : " + vo.getP_saleprice());
		
		if(vo == null) return;  //없으면 아예 작업하지 않음 
		
		//0. 카트에 있는지 확인(있으면 작업하고, 없으면 종료)
		/* MY
		if(vo != null) {
			
			//1. 카트합계금액 수정 : 기존 품목 금액 빼기
			delProduct(p_num);
			//System.out.println("후1 : " + list.toString()); //확인용
			
			//2. 제품 수량 변경 
			vo.setQuant(su); 
			list.add(vo);
			//System.out.println("후2 : " + list.toString()); //확인용
			
			//3. 카트 합계금액 변경 : 합계금액에 변경된 품목합계금액 더하기 
			total += vo.getTotalprice();
			
		}
		*/
		
		
		/*teacher*/
		//1. 카트합계금액 수정 : 기존 품목 금액 빼기
		total = total - vo.getTotalprice();
		
		//2. 제품 수량 변경 
		vo.setQuant(su);
		
		//3. 카트 합계금액 변경 : 합계금액에 변경된 품목합계금액 더하기 
		total = total + vo.getTotalprice();
	}
	
	
	//제품수량 변경처리2
		public void setQuant2(String p_num, int su) {
			ShopVO vo = findProduct(p_num);
			if(vo == null) return;  //없으면 아예 작업하지 않음 
			
			//새로 구입할 수량과 기존에 있는 수량 계산
			int gapCnt = su - vo.getQuant();
			
			vo.setQuant(su); //수량변경, 품목합계 재계산
			
			//카트 합계금액에 차이나는 금액 더하기
			total = total + (gapCnt * vo.getP_saleprice());
		}
}














