package com.mycompany.sabangpalbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.InquiryDao;
import com.mycompany.sabangpalbang.dto.Inquiry;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao inquiryDao;
	
	public List<Inquiry> getInquiryList(int inquiry_sabangid) {
		List<Inquiry> inquiryList = inquiryDao.selectInquiry(inquiry_sabangid);
		return inquiryList;
	}

}
