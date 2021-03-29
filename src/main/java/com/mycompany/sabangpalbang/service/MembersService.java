package com.mycompany.sabangpalbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.MembersDao;
import com.mycompany.sabangpalbang.dto.Member;

@Service
public class MembersService {
	@Autowired
	private MembersDao membersDao;
	
	public void signin(Member member) {
		membersDao.insertByMember(member);
	}
	
}
