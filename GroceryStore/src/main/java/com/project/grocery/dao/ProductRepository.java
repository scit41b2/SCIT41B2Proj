package com.project.grocery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.grocery.vo.BasketVO;
import com.project.grocery.vo.BasketlistVO;
import com.project.grocery.vo.OrderVO;
import com.project.grocery.vo.ProductVO;

@Repository
public class ProductRepository {
	
	@Autowired
	SqlSession session;
	//id앞의 type으로 종류별 물품리스트
	public List<ProductVO> selectProduct(String type){
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		List<ProductVO> result = null;
		try {
			result = mapper.selectProduct(type);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에서 물품 수량 넣기
	@SuppressWarnings("null")
	public int add(String acc_id, String pro_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		BasketVO basket = new BasketVO();
		int resultnum = 0;
		basket.setAcc_id(acc_id);
		basket.setPro_id(pro_id);
		
		try {
			basket = mapper.checkBasket(basket);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(basket==null) {
			basket = new BasketVO();
			basket.setAcc_id(acc_id);
			basket.setPro_id(pro_id);
			resultnum=1;
			basket.setBas_num(resultnum);
			try {
				mapper.createBasket(basket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resultnum = basket.getBas_num()+1;
			basket.setBas_num(resultnum);
			try {
				mapper.updateBasket(basket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return resultnum;
	}

	//장바구니에서 물품 수량 빼기
	public int minus(String acc_id, String pro_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		BasketVO basket = new BasketVO();
		int resultnum = 0;
		basket.setAcc_id(acc_id);
		basket.setPro_id(pro_id);
		
		try {
			basket = mapper.checkBasket(basket);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(basket.getBas_num()<=1) {
			resultnum=0;
			try {
				mapper.deleteBasket(basket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resultnum = basket.getBas_num()-1;
			basket.setBas_num(resultnum);
			try {
				mapper.updateBasket(basket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return resultnum;
	}
	
	//장바구니의 물품 총 개수
	public int check(String acc_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.totalBasket(acc_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//장바구니 리스트
	public List<BasketlistVO> basketList(String acc_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		List<BasketlistVO> result = null;
		try {
			result = mapper.basketList(acc_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//장바구니 물품의 총 가격
	public int basketPrice(String acc_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.basketPrice(acc_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//장바구리 리셋
	public int basketReset(String acc_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.basketReset(acc_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


	//물품구매시 재고 변경
	public int updateProduct(BasketlistVO item) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.updateProduct(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int saleProduct(BasketlistVO item) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = -1;
		try {
			mapper.saleProduct(item);
			result = mapper.checkProduct(item);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int rollbackProduct(BasketlistVO item_cache) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.rollbackProduct(item_cache);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//주문서 아이디 체크
	public int checkOrderseq() {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.checkOrderseq();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//주문서 만들기
	public int createOrder(OrderVO order) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.createOrder(order);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
		
	//주문서 입력
	public int insertOrder(OrderVO order) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.insertOrder(order);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
		
	//주문서 확인
	public int confirmOrder(int ord_id) {
		ProductMapper mapper = session.getMapper(ProductMapper.class);
		int result = 0;
		try {
			result = mapper.confirmOrder(ord_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


}
