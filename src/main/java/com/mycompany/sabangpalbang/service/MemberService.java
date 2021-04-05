package com.mycompany.sabangpalbang.service;

import java.security.SecureRandom;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.controller.AuthController;
import com.mycompany.sabangpalbang.dao.MemberDao;
import com.mycompany.sabangpalbang.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	private static SecureRandom random = new SecureRandom();
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);


	
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
	
	public String resetPwd(String member_email) {
		
		String Specific_character = "!@%^*";
		String ENGLISH_LOWER = "abcdefghijklmnopqrstuvwxyz";
        String ENGLISH_UPPER = ENGLISH_LOWER.toUpperCase();
        String NUMBER = "0123456789";

        String DATA_FOR_RANDOM_STRING = Specific_character + ENGLISH_LOWER + ENGLISH_UPPER + NUMBER;
        
        int rand_length = 10;

		String randpwd = generate(DATA_FOR_RANDOM_STRING, rand_length);
		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String member_pw = bpe.encode(randpwd);
		logger.info(member_email);
		logger.info(randpwd);
		logger.info(member_pw);
		
		memberDao.updateRandPwd(member_email,member_pw);
		
		
		return randpwd;
	}
	 public static String generate(String DATA, int length) {
	        if (length < 1) throw new IllegalArgumentException("length must be a positive number.");
	        StringBuilder sb = new StringBuilder(length);
	        for (int i = 0; i < length; i++) {
	            sb.append( DATA.charAt(
	            		random.nextInt(DATA.length())
	            		));
	        }
	        return sb.toString();
	    }

	public String getEmailByNickname(String palbang_nickname) {
		String email = memberDao.selectEmailByNickname(palbang_nickname);
		return email;
	}

	public int getIdByEmail(String member_email) {
		int member_id = memberDao.selectIdByEmail(member_email);
		return member_id;
	}

	public void updateMember(Member member) {
		memberDao.updateByMember(member);
		
	}

	public Member showMember(String member_email) {
		Member member = memberDao.selectMemberByEmail(member_email);
		return member;
	}
	public String getByInquiryNickname(String member_email) {
		String nickname= memberDao.selectByInquiryNickname(member_email);
		return nickname;
	}

	public Member getPostInfo(String member_email) {
		Member postinfo = memberDao.selectByPostInfo(member_email);
		return postinfo;
	}
	
}
