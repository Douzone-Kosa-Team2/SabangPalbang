package com.mycompany.sabangpalbang.dao;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.sabangpalbang.dto.Member;

@Mapper
public interface MembersDao {
	public int insertByMember(Member member);
	public Member selectByMember(String member_email);
	public Member selectByPayMember(String member_email);
	public String deleteByMember(String member_email);
	public String updateByMember(Member member);
	
}
