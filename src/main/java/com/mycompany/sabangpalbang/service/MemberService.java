package com.mycompany.sabangpalbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.MemberDao;
import com.mycompany.sabangpalbang.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public void signin(Member member) {
		memberDao.insertByMember(member);
	}
	
	/* 아이디 찾기 */
	public Member findEmail(String member_name, String member_phone) { 
		Member member = memberDao.findMemberByEmail(member_name, member_phone);
		return member;
	}
	
	/* 비밀번호 찾기 */
	public Member findPwd(String member_email, String member_name, String member_phone) {
		Member member = memberDao.findMemberByPwd(member_email, member_name, member_phone);
		return member;
	}
	
}
