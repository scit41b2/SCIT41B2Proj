package com.project.grocery;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.grocery.dao.ProductRepository;
import com.project.grocery.vo.BasketlistVO;
import com.project.grocery.vo.OrderVO;

@Controller
public class BasketController {

	@Autowired
	ProductRepository repository;
	
	//수량 추가
	@RequestMapping("/add")
	@ResponseBody
	public int add(String pro_id, HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		int result  = repository.add(acc_id,pro_id);
		return result;
	}
	
	//수량 빼기
	@RequestMapping("/minus")
	@ResponseBody
	public int minus(String pro_id, HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		int result  = repository.minus(acc_id,pro_id);
		return result;
	}
	
	//장바구니에 있는 총 수량 개수
	@RequestMapping("/check")
	@ResponseBody
	public int check(HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		if(acc_id==null) return 0;
		int result  = repository.check(acc_id);
		return result;
	}
	
	//장바구니 리스트 및 총 가격
	@RequestMapping("/basket")
	public String basket(Model model, HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		List<BasketlistVO> result  = repository.basketList(acc_id);
		int totalprice = repository.basketPrice(acc_id);
		model.addAttribute("list",result);
		model.addAttribute("totalprice", totalprice);
		return "basket";
	}
	
	//장바구니 총 가격
	@RequestMapping("/basketPrice")
	@ResponseBody
	public int basketPrice(Model model, HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		int totalprice = repository.basketPrice(acc_id);
		model.addAttribute("totalprice", totalprice);
		return totalprice;
	}
	
	//구매 처리
	@RequestMapping("/purchase")
	public String purchase(Model model, HttpSession session) {
		String acc_id  = (String) session.getAttribute("loginId");
		String acc_name  = (String) session.getAttribute("loginName");
		String acc_address  = (String) session.getAttribute("loginAdd");
		String message = "";
		
		//재고확인 및 확보
		List<BasketlistVO> result = repository.basketList(acc_id);
		List<BasketlistVO> rollback = new ArrayList<>();
		for(BasketlistVO item:result) {
			int cal = repository.saleProduct(item);
			rollback.add(item);
			if(cal<0) {
				for(BasketlistVO item_cache:rollback) {
					repository.rollbackProduct(item_cache);
				}
				message = item.getPro_name()+"의 재고가 부족합니다";
				model.addAttribute("message",message);
				return "purchase";
			}
			
		}

		repository.basketReset(acc_id);
		
		//주문서 만들기
		//1.주문서 시퀀스 번호 체크
		int ord_id = repository.checkOrderseq();
		//2.주문서 생성
		OrderVO temp = new OrderVO();
		temp.setOrd_id(ord_id);
		temp.setAcc_id(acc_id);
		repository.createOrder(temp);
		//3.주문 리스트 넣기
		for(BasketlistVO item : result) {
			temp.setPro_id(item.getPro_id());
			temp.setBas_num(item.getBas_num());
			repository.insertOrder(temp);
		}

		message = "구매처리되었습니다";
		model.addAttribute("message",message);
		
		return "purchase";
	}
}
