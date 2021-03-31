package com.mycompany.sabangpalbang.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.InquiryDao;
import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.Pager;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao inquiryDao;
	
	public List<Inquiry> getInquiryList(Pager pager, int inquiry_sabangid) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("inquiry_sabangid", inquiry_sabangid);

		List<Inquiry> inquiryList = inquiryDao.selectInquiry(map);
		return inquiryList;
	}

	public int getTotalRows() {
		int row = inquiryDao.count();
		return row;
	}

}
