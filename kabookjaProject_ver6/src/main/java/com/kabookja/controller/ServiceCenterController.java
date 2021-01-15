package com.kabookja.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kabookja.data.service.ServiceCenterService;
import com.kabookja.data.vo.ServiceCenterVO;

@Controller
public class ServiceCenterController {
	@Resource(name="ServiceCenterService")
	private ServiceCenterService serviceCenterService;
	
	@RequestMapping("Service_All.do")
	public String Service_All(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("Service",serviceCenterService.service_All(serviceVO));
		return "/test/test";
	}
	@RequestMapping("Service_insert.do")
	public String service_insert(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_insert(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:Service_All.do";
		}
	}
	@RequestMapping("Service_reviewInsert.do")
	public String service_reviewInsert(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_reviewInsert(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:Service_All.do";
		}
	}
}
