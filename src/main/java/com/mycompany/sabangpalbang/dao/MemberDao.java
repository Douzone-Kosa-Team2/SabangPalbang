package com.mycompany.sabangpalbang.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.sabangpalbang.dto.Member;

@Mapper
public interface MemberDao {
	public int insertByMember(Member member);
	public Member selectByMember(String member_email);
	public Member selectByPayMember(String member_email);
	public String deleteByMember(String member_email);
	public String updateByMember(Member member);
	public Member findMemberByEmail(@Param("member_name") String member_name,
									@Param("member_phone")String member_phone);
	public Member findMemberByPwd(@Param("member_email") String member_email, 
									@Param("member_name") String member_name, 
									@Param("member_phone")String member_phone);
	public int updateRandPwd(@Param("member_email") String member_email , @Param("member_pw") String member_pw);
	public String selectEmailByNickname(String palbang_nickname);
	public int selectIdByEmail(String member_email);
	
}
