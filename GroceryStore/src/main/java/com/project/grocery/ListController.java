package com.project.grocery;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.grocery.dao.ListRepository;
import com.project.grocery.vo.OrderTableVO;
import com.project.grocery.vo.OrderVO;
import com.project.grocery.vo.OrderlistVO;
import com.project.grocery.vo.ProductVO;

@Controller
public class ListController {//구매정보 조회용 컨트롤러

	@Autowired
	ListRepository repository;
	
	@RequestMapping("/list")//구매정보 조회 페이지로 이동
	public String login(HttpSession session, Model model) {
		String acc_id  = (String) session.getAttribute("loginId"); //세션 아이디 추출
		System.out.println(acc_id);
		List<OrderTableVO> orList = repository.orderTable(acc_id); //ORD_TB 검색
		List<Integer> numList = new ArrayList<>(); //정수 어레이리스트 선언
		
		for(int i=0; i<orList.size(); i++){ // ORD_TB에서 가져온 기본키로 ORD_CON_TB의 기본키 비교 검색을 위해 정수 어레이 리스트로 변환
			numList.add(orList.get(i).getOrd_id());
		}
		
		List<OrderlistVO> result  = repository.orderList(numList); //정수 어레이리스트로 ORD_CON_TB 검색
		
		model.addAttribute("loginId", acc_id); // 세션 아이디
		model.addAttribute("orList", orList); // ORD_TB
		model.addAttribute("ordInfo", result); // ORD_CON_TB + PRO_TB 조인 결과값
		
		return "list";
	}
	
	@RequestMapping("cal")
	public @ResponseBody int cal(int ord_id){ //계산용 AJAX
		
		List<OrderVO> orderTotal = repository.orderTotal(ord_id); //주문정보 조회
		List<ProductVO> proTotal = repository.proTotal(); //상품정보 조회
		
		
		int total = 0; //합계 변수
		
		for(OrderVO ord : orderTotal){
			for(ProductVO pro : proTotal){
				if(ord.getPro_id().equals(pro.getPro_id())){
					if(pro.getPro_saleprice() != 0){
						total += (ord.getBas_num() * pro.getPro_saleprice());
					} else {
						total += (ord.getBas_num()* pro.getPro_price());
					}
				}
			}
		}
		
		// 주문할때 당시 계산금액이 아닌 현재 가격 정보 기준 계산이라 상이할 수 있음
		
		return total;
	}
}
