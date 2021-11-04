package com.project.grocery.dao;

import java.util.List;

import com.project.grocery.vo.BasketVO;
import com.project.grocery.vo.BasketlistVO;
import com.project.grocery.vo.ProductVO;

public interface ProductMapper {
	//id앞의 type으로 종류별 물품리스트
	public List<ProductVO> selectProduct(String type) throws Exception;

	//장바구니에 물품 체크
	public BasketVO checkBasket(BasketVO basket) throws Exception;

	//장바구니에 물품 새로 넣기
	public int createBasket(BasketVO basket) throws Exception;
	
	//장바구니에 이미 있는 물품 수량 변경
	public int updateBasket(BasketVO basket) throws Exception;

	//장바구니의 물품 총 개수
	public int totalBasket(String acc_id) throws Exception;

	//장바구니 리스트
	public List<BasketlistVO> basketList(String acc_id) throws Exception;

	//장바구니 물품의 총 가격
	public int basketPrice(String acc_id) throws Exception;

	//장바구니 속 물품 삭제
	public void deleteBasket(BasketVO basket) throws Exception;

	//장바구리 리셋
	public int basketReset(String acc_id) throws Exception;

	//물품구매시 재고 변경
	public int updateProduct(BasketlistVO item) throws Exception;

	//물품판매
	public int saleProduct(BasketlistVO item);
	
	//물품판매취소
	public int rollbackProduct(BasketlistVO item);

	//물품재고 체크
	public int checkProduct(BasketlistVO item);
}
