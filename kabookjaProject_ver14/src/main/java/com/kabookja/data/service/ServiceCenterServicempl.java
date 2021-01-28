package com.kabookja.data.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.dao.ServiceCenterDAO;
import com.kabookja.data.vo.ServiceCenterVO;

@Service("ServiceCenterService")
public class ServiceCenterServicempl implements ServiceCenterService{
	@Autowired
	private ServiceCenterDAO serviceCenterDAO;

	@Override
	public ArrayList<ServiceCenterVO> service_All(ServiceCenterVO serviceVO)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return serviceCenterDAO.service_All(serviceVO);
	}

	@Override
	public int service_insert(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df1 = new SimpleDateFormat("yyyyMMddkkmmss");
        DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		serviceVO.setHelpID(df1.format(cal.getTime())+serviceVO.getMemberID());
		serviceVO.setHelpWritedate(df2.format(cal.getTime()));
		return serviceCenterDAO.service_insert(serviceVO);
	}

	@Override
	public int service_reviewInsert(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
        serviceVO.setHelpWritedate(df2.format(cal.getTime()));
		return serviceCenterDAO.service_reviewInsert(serviceVO);
	}

	@Override
	public int service_reviewCheck(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		if(serviceVO.getHelpSortation()==1) {
			return 0;
		}else {
			return serviceCenterDAO.service_reviewCheck(serviceVO);
		}
	}

	@Override
	public int service_update(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("삭시1");
		return serviceCenterDAO.service_update(serviceVO);
	}

	@Override
	public int service_delete(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return serviceCenterDAO.service_delete(serviceVO);
	}

	@Override
	public ServiceCenterVO service_one(ServiceCenterVO serviceVO) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return serviceCenterDAO.service_one(serviceVO);
	}
}
