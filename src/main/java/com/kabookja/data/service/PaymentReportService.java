package com.kabookja.data.service;

import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.PaymentReportVO;

import java.sql.SQLException;
import java.util.ArrayList;

public interface PaymentReportService {
	
	public void paymentReport_delete(PaymentReportVO paymentReportVO)throws ClassNotFoundException,SQLException;
	public ArrayList<PaymentReportVO> PaymentReport_All(PaymentReportVO paymentReportVO)throws ClassNotFoundException,SQLException;
	public PaymentReportVO onePaymentReport(PaymentReportVO paymentReportVO) throws ClassNotFoundException,SQLException;
	public String PaymentReport_insert(PaymentReportVO paymentReportVO)throws ClassNotFoundException,SQLException;
}
