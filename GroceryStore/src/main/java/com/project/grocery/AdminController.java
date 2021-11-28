package com.project.grocery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.grocery.dao.ProductRepository;
import com.project.grocery.vo.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	ProductRepository repository;
	
	//상품추가 화면 제공
	@RequestMapping("/adminadd")
	public String adminAdd() {
		return "adminadd";
	}
	
	//상품추가
	@RequestMapping(value="/adminadd",method=RequestMethod.POST)
	public String adminAdd(ProductVO product, Model model) {
		System.out.println("admin");
		String message = "";
		int id = repository.checkProductseq();
		String pro_id = "fish_" + String.format("%3d", id);
		product.setPro_id(pro_id);
		int result = repository.adminAdd(product);
		
		if(result==0) message = "에러가 발생하였습니다";
		else message = "상품추가 되었습니다";
		
		model.addAttribute("message",message);
		
		return "adminadd";
	}
}
