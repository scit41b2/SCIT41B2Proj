package com.project.grocery;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.grocery.dao.ListRepository;
import com.project.grocery.dao.ProductRepository;
import com.project.grocery.util.FileService;
import com.project.grocery.vo.MemberVO;
import com.project.grocery.vo.OrderTableVO;
import com.project.grocery.vo.OrderlistVO;
import com.project.grocery.vo.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	ProductRepository repository;
	
	@Autowired
	ListRepository listrepository;
	
	@Autowired
	ServletContext servletContext;
	
	final String uploadPath = "/groceryfile";
	
	//상품추가 화면 제공
	@RequestMapping("/adminadd")
	public String adminAdd(HttpSession session) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		return "adminadd";
	}
	
	//상품추가
	@RequestMapping(value="/adminadd",method=RequestMethod.POST)
	public String adminAdd(HttpSession session, ProductVO product, MultipartFile pro_pic, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		String message = "";
		int result = 0;
		int id = repository.checkProductseq();
		String pro_id = "fish_" + String.format("%03d", id);
		product.setPro_id(pro_id);
		if(!pro_pic.isEmpty()) {
			FileService.saveFile(pro_pic, pro_id, uploadPath);
		}
		result = repository.adminAdd(product);
		
		if(result==0) message = "에러가 발생하였습니다";
		else message = "상품추가 되었습니다";
		
		model.addAttribute("message",message);
		
		return "adminadd";
	}
	
	//구매내역 확인
	@RequestMapping("/adminorder")
	public String login(HttpSession session, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		List<OrderTableVO> orList = listrepository.adminOrder(); //ORD_TB 검색
		List<Integer> numList = new ArrayList<>(); //정수 어레이리스트 선언
		
		for(int i=0; i<orList.size(); i++){ // ORD_TB에서 가져온 기본키로 ORD_CON_TB의 기본키 비교 검색을 위해 정수 어레이 리스트로 변환
			numList.add(orList.get(i).getOrd_id());
		}
		
		List<OrderlistVO> result  = listrepository.orderList(numList); //정수 어레이리스트로 ORD_CON_TB 검색

		model.addAttribute("orList", orList); // ORD_TB
		model.addAttribute("ordInfo", result); // ORD_CON_TB + PRO_TB 조인 결과값
		
		return "adminorder";
	}
	
	//상품관리
	@RequestMapping("/adminproman")
	public String adminProMan(HttpSession session, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		List<ProductVO> proList = repository.adminProMan(); //PRO_TB 검색
		model.addAttribute("proList", proList); // PRO_TB

		return "adminproman";
	}
	
	//상품 수정 화면 제공
	@RequestMapping("/adminprochange")
	public String adminProChange(HttpSession session, String id, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		ProductVO result = repository.adminProCheck(id);
		model.addAttribute("product",result);
		
		if(FileService.checkFile(id, uploadPath)) {
			model.addAttribute("picture",id);
		} else {
			model.addAttribute("picture",null);
		}
		
		return "adminprochange";
	}
	
	//상품 수정
	@RequestMapping(value="/adminprochange",method=RequestMethod.POST)
	public String accupdate(HttpSession session, ProductVO product, MultipartFile pro_pic, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		String message = "";
		int result = 0;
		if(!pro_pic.isEmpty()) {
			FileService.changeFile(pro_pic, product.getPro_id(), uploadPath);
		}
		result = repository.adminProChange(product);
		
		
		if(result==0) message = "에러가 발생하였습니다";
		else message = "상품수정 되었습니다";
		
		model.addAttribute("message",message);
		
		return "redirect:/adminproman";
	}
	
	//상품 판매중지
	@RequestMapping("/adminprostop")
	public String adminProStop(HttpSession session, String id, Model model) {
		String admin = "admin";
		if(!admin.equals((String) session.getAttribute("loginId"))) return "redirect:/";
		
		int result = repository.adminProStop(id);
		String message = "";
		if(result==0) message = "에러가 발생했습니다";
		model.addAttribute("message",message);
		return "redirect:/adminproman";
	}
}
