package com.project.grocery;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.grocery.dao.MemberRepository;
import com.project.grocery.vo.MemberVO;

@Controller
public class AccountController {

	@Autowired
	MemberRepository repository;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login(HttpSession session) {
		if(session.getAttribute("loginId")!=null) {
			return "redirect:/acc";
		} else {
			return "login";
		}
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//로그인정보 세션기록
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(MemberVO member,Model model,HttpSession session) {
		
		MemberVO result = repository.login(member);
		String message = "";
		if(result==null) {
			message = "아이디가 없거나 패스워드가 맞지 않습니다";
			model.addAttribute("message",message);
			return "login";
		} else {
			session.setAttribute("loginId",result.getAcc_id());
			session.setAttribute("loginName", result.getAcc_name());
			session.setAttribute("loginAdd", result.getAcc_address());
			return "redirect:/";
		}
	}
	
	//마이페이지 화면제공
	@RequestMapping("/acc")
	public String acc() {
		return "acc";
	}
	
	//회원가입 화면제공
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	//회원가입 처리
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(MemberVO member, Model model) {
		int result = repository.signup(member);
		String message;
		if(result==0) {
			message = "가입도중 에러가 발생했습니다.";
			model.addAttribute("message",message);
			return "signup";
		} else {
			return "redirect:/";
		}
		
	}
	
	//개인정보 업데이트 화면제공
	@RequestMapping("/accupdate")
	public String accupdate() {
		return "accupdate";
	}
	
	//개인정보 업데이트 처리
	@RequestMapping(value="/accupdate",method=RequestMethod.POST)
	public String accupdate(MemberVO member, Model model) {
		System.out.println(member);
		int result = repository.accupdate(member);
		String message;
		if(result==0) {
			message = "처리도중 에러가 발생했습니다.";
			model.addAttribute("message",message);
			return "accupdate";
		} else {
			return "redirect:/";
		}	
	}
}
