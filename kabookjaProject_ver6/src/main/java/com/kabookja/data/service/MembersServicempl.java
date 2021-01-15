package com.kabookja.data.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.dao.MembersDAO;
import com.kabookja.data.vo.MembersVO;

@Service("MembersService")
public class MembersServicempl implements MembersService{
	@Autowired
	private MembersDAO membersDAO;

	@Override
	public int members_signUp(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_signUp(membersVO);
	}

	@Override
	public int members_update(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_update(membersVO);
	}

	@Override
	public int members_delete(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_delete(membersVO);
	}

	@Override
	public ArrayList<MembersVO> members_All(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_All(membersVO);
	}

	@Override
	public int members_ebookMembershipJoin(MembersVO membersVO, int month) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        cal.add(Calendar.MONTH, month);
        membersVO.setEbookMembership(df.format(cal.getTime()));
		return membersDAO.members_ebookMembershipJoin(membersVO);
	}

	@Override
	public int members_idCheck(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_idCheck(membersVO);
	}

	@Override
	public int members_MileageUpdate(MembersVO membersVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return membersDAO.members_MileageUpdate(membersVO);
	}
	
}
