package com.project.grocery.dao;

import java.util.List;

import com.project.grocery.vo.OrderTableVO;
import com.project.grocery.vo.OrderVO;
import com.project.grocery.vo.OrderlistVO;
import com.project.grocery.vo.ProductVO;

public interface ListMapper { //구매정보 조회용 매퍼

	public List<OrderTableVO> orderTable(String acc_id) throws Exception; //ORD_TB 검색
	
	public List<OrderlistVO> orderList(List<Integer> numList) throws Exception; //ORD_CON_TB + PRO_TB 검색

	public List<OrderVO> orderTotal(int ord_id) throws Exception; //ORD_CON_TB 검색

	public List<ProductVO> proTotal() throws Exception; //Product 검색

	public List<OrderTableVO> adminOrder() throws Exception; //ORD_TB 전체
}
