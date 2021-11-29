package com.project.grocery;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.grocery.dao.ProductRepository;
import com.project.grocery.util.FileService;
import com.project.grocery.vo.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	ProductRepository repository;
	
	@Autowired
	ServletContext servletContext;
	
	
	//상품추가 화면 제공
	@RequestMapping("/adminadd")
	public String adminAdd() {
		return "adminadd";
	}
	
	//상품추가
	@RequestMapping(value="/adminadd",method=RequestMethod.POST)
	public String adminAdd(ProductVO product, MultipartFile pro_pic, Model model) {
		String originalPath = this.getClass().getResource("").getPath();
		int lastIndex = originalPath.lastIndexOf("SCIT41BProj");
		String uploadPath = originalPath.substring(1,lastIndex)+"SCIT41BProj/GroceryStore/src/main/webapp/resources/images/product";
		
		String message = "";
		int result = 0;
		int id = repository.checkProductseq();
		String pro_id = "fish_" + String.format("%03d", id);
		product.setPro_id(pro_id);
		System.out.println("error before");
		if(!pro_pic.isEmpty()) {
			FileService.saveFile(pro_pic, pro_id, uploadPath);
			result = repository.adminAdd(product);
		}
		
		
		if(result==0) message = "에러가 발생하였습니다";
		else message = "상품추가 되었습니다";
		
		model.addAttribute("message",message);
		
		return "adminadd";
	}
}
