package com.kabookja.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NextpageController {
	
	
	@RequestMapping("/signin.do")
	public String signin() throws ClassNotFoundException, SQLException {
		return "/main/signin";
	}
	@RequestMapping("/goSignup.do")
	public String goSignup() throws ClassNotFoundException, SQLException {
		return "/main/signup";
	}
	@RequestMapping("/myinfo.do")
	public String myinfo() throws ClassNotFoundException, SQLException {
		return "/mypage/myinfo";
	}
	@RequestMapping("membershipRegistration.do")
	public String membershipRegistration() throws ClassNotFoundException, SQLException {
		return "/mypage/membershipRegistration";
	}
	
}
