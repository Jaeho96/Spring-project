package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.dao.EbookBuyListDAO;
import com.kabookja.data.vo.EbookBuyListVO;

@Service("EbookBuyListService")
public class EbookBuyListServicempl implements EbookBuyListService{
	
	@Autowired
	private EbookBuyListDAO ebookBuyListDAO;
	
	@Override
	public ArrayList<EbookBuyListVO> all_buyList(EbookBuyListVO ebookBuyListVO)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return ebookBuyListDAO.all_buyList(ebookBuyListVO);
	}

	@Override
	public String insert_buyList(String bookID, String memberID) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return ebookBuyListDAO.insert_buyList(bookID, memberID);
	}

}
