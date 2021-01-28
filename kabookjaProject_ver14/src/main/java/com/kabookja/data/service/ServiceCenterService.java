package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.ServiceCenterVO;

public interface ServiceCenterService {
	public ArrayList<ServiceCenterVO> service_All(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public int service_insert(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public int service_reviewInsert(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public int service_reviewCheck(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public int service_update(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public int service_delete(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
	public ServiceCenterVO service_one(ServiceCenterVO serviceVO)throws ClassNotFoundException, SQLException;
}
