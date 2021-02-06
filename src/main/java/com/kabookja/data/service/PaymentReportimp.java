package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.PaymentReportVO;
import com.kabookja.data.dao.PaymentReportDAO;;


@Service("PaymentReportService")
public class PaymentReportimp implements PaymentReportService{

	@Autowired
	private PaymentReportDAO PaymentReportDAO;
	
	@Override
	public void paymentReport_delete(PaymentReportVO paymentReportVO) throws ClassNotFoundException, SQLException {
		PaymentReportDAO.deletePaymentReport(paymentReportVO);
	}

	@Override
	public ArrayList<PaymentReportVO> PaymentReport_All(PaymentReportVO paymentReportVO)
			throws ClassNotFoundException, SQLException {
		return PaymentReportDAO.allPaymentReport(paymentReportVO);
	}

	@Override
	public String PaymentReport_insert(PaymentReportVO paymentReportVO) throws ClassNotFoundException, SQLException {
		return PaymentReportDAO.insertPaymentReport(paymentReportVO);
	}

	@Override
	public PaymentReportVO onePaymentReport(PaymentReportVO paymentReportVO)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return PaymentReportDAO.onePaymentReport(paymentReportVO);
	}
	
}
