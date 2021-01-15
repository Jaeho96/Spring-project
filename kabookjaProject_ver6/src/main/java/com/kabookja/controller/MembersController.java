package com.kabookja.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kabookja.data.service.MembersService;
import com.kabookja.data.vo.MembersVO;

@Controller
public class MembersController {
	@Resource(name="MembersService")
	private MembersService membersService;
	
	@RequestMapping("/members_signUp.do")
	public String mInsert(MembersVO membersVO,Model model) throws ClassNotFoundException, SQLException {
		if(membersService.members_signUp(membersVO)==0){
			return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}
	}
	@RequestMapping("/members_update.do")
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
	@RequestMapping("/members_idCheck.do")
	public String members_idCheck(MembersVO membersVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("idCheck",membersService.members_idCheck(membersVO));
		return "/test/test";
	}
	@RequestMapping("/members_MileageUpdate.do")
	public String members_MileageUpdate(MembersVO membersVO)throws ClassNotFoundException, SQLException{
		if(membersService.members_MileageUpdate(membersVO)==0) {
			return "/test/falldata";
		}else {
			return "redirect:members_All.do";
		}
	}
}
