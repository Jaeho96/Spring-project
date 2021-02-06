package com.kabookja.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kabookja.data.service.PaymentReportService;
import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.PaymentReportVO;

@Controller
public class PaymentReportController {

		@Resource(name="PaymentReportService")
		private PaymentReportService paymentReportService;
		
		@RequestMapping("myPaymentReport.do")
		public String myPaymentReport(PaymentReportVO paymentReportVO,Model model) throws ClassNotFoundException, SQLException {
			model.addAttribute("paymentReports", paymentReportService.PaymentReport_All(paymentReportVO));
			return "/mypage/myPaymentReport";
		}
		@RequestMapping("PaymentReportDetail.do")
		public String PaymentReportDetail(PaymentReportVO paymentReportVO,Model model) throws ClassNotFoundException, SQLException {
			model.addAttribute("paymentReport", paymentReportService.onePaymentReport(paymentReportVO));
			return "/mypage/PaymentReportDetail";
		}
		@RequestMapping("/PaymentReport_delete.do")
		public String paymentReport_delete(PaymentReportVO paymentReportVO)throws ClassNotFoundException,SQLException{
			paymentReportService.paymentReport_delete(paymentReportVO);
			return "redirect:myPaymentReport.do";
		}
		
		@RequestMapping("/PaymentReport_insert.do")
		@ResponseBody
		public String PaymentReport_insert(PaymentReportVO paymentReportVO, Model model)throws ClassNotFoundException,SQLException{
			return paymentReportService.PaymentReport_insert(paymentReportVO);
		}
}
