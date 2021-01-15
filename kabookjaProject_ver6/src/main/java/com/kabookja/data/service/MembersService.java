package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.MembersVO;

public interface MembersService {
	public int members_signUp(MembersVO membersVO)throws ClassNotFoundException, SQLException;
	public int members_update(MembersVO membersVO)throws ClassNotFoundException, SQLException;
	public int members_delete(MembersVO membersVO)throws ClassNotFoundException, SQLException;
	public ArrayList<MembersVO> members_All(MembersVO membersVO)throws ClassNotFoundException, SQLException;
	public int members_ebookMembershipJoin(MembersVO membersVO,int month)throws ClassNotFoundException, SQLException;
	public int members_idCheck(MembersVO membersVO)throws ClassNotFoundException, SQLException;
	public int members_MileageUpdate(MembersVO membersVO)throws ClassNotFoundException, SQLException;
}
