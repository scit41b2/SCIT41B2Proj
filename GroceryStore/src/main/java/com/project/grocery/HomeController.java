package com.project.grocery;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.grocery.dao.ProductRepository;
import com.project.grocery.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	ProductRepository repository;
	
	//생선코너
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<ProductVO> result = repository.selectProduct("fish");
		System.out.println(result);
		model.addAttribute("list",result);
		return "fish";
	}

}
