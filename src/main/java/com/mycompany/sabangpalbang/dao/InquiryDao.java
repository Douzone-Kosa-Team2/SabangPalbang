package com.mycompany.sabangpalbang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.OrderMain;

@Mapper
public interface InquiryDao {
	
	public int insert(Inquiry inquiry);
	public List<Inquiry> selectAll();
	public Inquiry selectInquiryByNickname(String member_nickname);
	public int updateInquiryById(int inquiry_id);
	public int updateInquiryAnswerById(int inquiry_id);
	public int deleteInquiryByInquiryId(int inquiry_id);
	
}