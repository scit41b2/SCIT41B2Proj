package com.project.grocery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.grocery.vo.OrderTableVO;
import com.project.grocery.vo.OrderVO;
import com.project.grocery.vo.OrderlistVO;
import com.project.grocery.vo.ProductVO;

@Repository
public class ListRepository {//구매정보 조회용 DAO
	
	@Autowired
	SqlSession session;


	public List<OrderTableVO> orderTable(String acc_id) { //ORD_TB 검색
		ListMapper mapper = session.getMapper(ListMapper.class);
		List<OrderTableVO> result = null;
		try {
			result = mapper.orderTable(acc_id);
		} catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<OrderlistVO> orderList(List<Integer> numList) { //ORD_CON_TB + PRO_TB 검색
		ListMapper mapper = session.getMapper(ListMapper.class);
		List<OrderlistVO> result = null;
		try {
			result = mapper.orderList(numList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<OrderVO> orderTotal(int ord_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		List<OrderVO> result = null;
		try {
			result = mapper.orderTotal(ord_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<ProductVO> proTotal() {
		ListMapper mapper = session.getMapper(ListMapper.class);
		List<ProductVO> result = null;
		try {
			result = mapper.proTotal();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

}
