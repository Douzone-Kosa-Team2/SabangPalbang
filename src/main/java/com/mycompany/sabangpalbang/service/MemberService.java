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
	
}
