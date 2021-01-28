package com.kabookja.controller;

import java.sql.SQLException;

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
	
	@RequestMapping("/cslist.do")
	public String cslist(ServiceCenterVO serviceVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("services",serviceCenterService.service_All(serviceVO));
		return "/cs/cslist";	
	}
	@RequestMapping("/csregister.do")
	public String csregister(ServiceCenterVO serviceVO,Model model) throws ClassNotFoundException, SQLException {
		if(serviceVO.getHelpID()!=null) {
			model.addAttribute("service",serviceCenterService.service_one(serviceVO));		
		}
		return "/cs/csregister";
	}
	@RequestMapping("/csdetail.do")
	public String csdetail(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("service",serviceCenterService.service_one(serviceVO));
		
		return "/cs/csdetail";
	}
	@RequestMapping("service_delete.do")
	public String service_delete(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_delete(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:cslist.do";
		}
	}
	@RequestMapping("/csedit.do")
	public String csedit(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("service",serviceCenterService.service_one(serviceVO));
		if(serviceCenterService.service_reviewCheck(serviceVO)==0) {
			return "/cs/csedit";
		}else {
			model.addAttribute("reviewCheck","수정불가");
			return "/cs/csdetail";
		}
	}
	@RequestMapping("/service_update.do")
	public String service_update(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_update(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:cslist.do";
		}
	}
	@RequestMapping("service_insert.do")
	public String service_insert(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_insert(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:cslist.do";
		}
	}
	@RequestMapping("service_reviewInsert.do")
	public String service_reviewInsert(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		if(serviceCenterService.service_reviewInsert(serviceVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:cslist.do";
		}
	}
	@RequestMapping("service_reviewCheck.do")
	public String service_reviewCheck(ServiceCenterVO serviceVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("reviewCheck",serviceCenterService.service_reviewCheck(serviceVO));
		
		return "redirect:Service_All.do";
	}
}
