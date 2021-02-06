package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.EbookBuyListVO;

public interface EbookBuyListService {

	public ArrayList<EbookBuyListVO> all_buyList(EbookBuyListVO ebookBuyListVO) throws ClassNotFoundException, SQLException;
	public String insert_buyList(String bookID,String memberID)throws ClassNotFoundException, SQLException;
}
