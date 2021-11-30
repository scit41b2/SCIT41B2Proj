package com.project.grocery;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.grocery.dao.ProductRepository;
import com.project.grocery.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	ProductRepository repository;
	
	final String uploadPath = "/groceryfile";
	
	//생선코너
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {

		String admin = "admin";
		if(admin.equals((String) session.getAttribute("loginId"))) return "admin";
		List<ProductVO> result = repository.selectProduct("fish");
		model.addAttribute("list",result);
		return "fish";
	}
	
	//이미지 로딩
	@RequestMapping(value="/image/{imageName}")
	@ResponseBody
	public byte[] getImage(@PathVariable(value="imageName") String imageName) throws IOException {
		File serverFile = new File(uploadPath+"/"+imageName+".jpg");
		return Files.readAllBytes(serverFile.toPath());
	}

}
