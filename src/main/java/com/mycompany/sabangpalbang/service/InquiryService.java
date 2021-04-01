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
	
	//"내가 쓴 문의글 로그인한 계정의 별명으로 문의글 중에 같은 별명인 문의글을 받으려는 문"
	public List<Inquiry> getInquiryList(Pager pager, String eqnickname) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("eqnickname", eqnickname);

		List<Inquiry> inquiryListNickname = inquiryDao.selectNicknameInquiry(map);
		return inquiryListNickname;
	}
	

	public int getTotalRows() {
		int row = inquiryDao.count();
		return row;
	}
	public Inquiry getInquiryWriter(String nickname) {
		Inquiry Ilist = inquiryDao.selectInquiryByNickname(nickname);
		return Ilist;
	}
	public int getTotalMyRows(String nickname) {
		int row = inquiryDao.mycount(nickname);
		return row;
	}
	
}
