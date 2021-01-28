package com.kabookja.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kabookja.data.dao.MembersDAO;
import com.kabookja.data.service.MembersService;
import com.kabookja.data.vo.MembersVO;

@Controller
public class MembersController {
	@Resource(name="MembersService")
	private MembersService membersService;
	
	@RequestMapping("/login.do")
	public String login(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("member",membersService.members_one(membersVO));
		return "/sys/loginSystem";
	}
	@RequestMapping("/logout.do")
	public String logout(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		return "/sys/logoutSystem";
	}
	@RequestMapping("/signup.do")
	public String signup(MembersVO membersVO,String firstAddress,String lastAddress,String extraAddress) throws ClassNotFoundException, SQLException {
		membersVO.setMemberAddress(firstAddress+" "+lastAddress+extraAddress);
		if(membersService.members_signUp(membersVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:main.do";
		}
	}
	@RequestMapping("/members_idCheck.do")
	@ResponseBody
	public String members_idCheck(String memberID)throws ClassNotFoundException, SQLException{
		return membersService.members_idCheck(memberID);
	}
	/*@RequestMapping("/members_update.do")
	public String members_update(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		if(membersService.members_update(membersVO)==0) {
				return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}
	}
	@RequestMapping("/members_delete.do")
	public String members_delete(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		if(membersService.members_delete(membersVO)==0) {
			return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}
	}
	@RequestMapping("/members_All.do")
	public String members_All(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("members",membersService.members_All(membersVO));
		return "/test/test";
	}
	@RequestMapping("/members_ebookMembershipJoin.do")
	public String members_ebookMembershipJoin(MembersVO membersVO, int month)
			throws ClassNotFoundException, SQLException{
		if(membersService.members_ebookMembershipJoin(membersVO, month)==0) {
			return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}	
	}
	
	@RequestMapping("/members_MileageUpdate.do")
	public String members_MileageUpdate(MembersVO membersVO)throws ClassNotFoundException, SQLException{
		if(membersService.members_MileageUpdate(membersVO)==0) {
			return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}
	}*/
	
}
