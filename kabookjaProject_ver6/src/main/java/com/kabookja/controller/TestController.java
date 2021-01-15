package com.kabookja.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kabookja.data.service.ServiceCenterService;
import com.kabookja.data.vo.ServiceCenterVO;

@Controller
public class TestController {
	@Resource(name="ServiceCenterService")
	private ServiceCenterService serviceCenterService;
	
	@RequestMapping("/memberTest.do")
	public String membertest() throws ClassNotFoundException, SQLException {
		return "/test/memberTest";
		
	}
	@RequestMapping("/bookTest.do")
	public String booktest() throws ClassNotFoundException, SQLException {
		return "/test/bookTest";
		
	}
	@RequestMapping("/serviceTest.do")
	public String servicetest() throws ClassNotFoundException, SQLException {
		return "/test/serviceTest";
		
	}
	@RequestMapping("/cslist.do")
	public String cslist(ServiceCenterVO serviceVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("Service",serviceCenterService.service_All(serviceVO));
		return "/cs/cslist";
		
	}
}
