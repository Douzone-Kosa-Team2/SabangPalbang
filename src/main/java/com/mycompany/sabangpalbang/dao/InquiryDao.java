package com.mycompany.sabangpalbang.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.Pager;

@Mapper
public interface InquiryDao {
	
	public int insert(Inquiry inquiry);
	public List<Inquiry> selectAll();
	public Inquiry selectInquiryByNickname(String member_nickname);
	public int updateInquiryByid(int inquiry_id);
	public int updateInquiryAnswerById(int inquiry_id);
	public int deleteInquiryByInquiryId(int inquiry_id);
	public List<Inquiry> selectInquiry(HashMap<String, Object> map);
	public int count();
	
}
