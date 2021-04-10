package com.mycompany.sabangpalbang.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.sabangpalbang.dao.MemberDao;
import com.mycompany.sabangpalbang.dao.OrderDetailDao;
import com.mycompany.sabangpalbang.dao.OrderMainDao;
import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.dto.OrderMain;
import com.mycompany.sabangpalbang.dto.Order_detail;
import com.mycompany.sabangpalbang.dto.Pager;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderMainDao orderMainDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	
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

		memberDao.updateRandPwd(member_email, member_pw);

		return randpwd;
	}

	public static String generate(String DATA, int length) {
		if (length < 1)
			throw new IllegalArgumentException("자연수를 넣어주세요");
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			sb.append(DATA.charAt(random.nextInt(DATA.length())));
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
		String nickname = memberDao.selectByInquiryNickname(member_email);
		return nickname;
	}

	public Member getPostInfo(String member_email) {
		Member postinfo = memberDao.selectByPostInfo(member_email);
		return postinfo;
	}

	// 중복 이메일 체크
	public Boolean isCheckedEmail(String member_email) {

		int dupEmail = memberDao.selectEmailCheck(member_email);
		// 겹치는게 없을때
		if (dupEmail == 0) {
			return true;
		} else {
			return false;
		}
	}

	// 중복 별명 체크
	public Boolean isCheckedNickname(String member_nickname) {
		int dupNickname = memberDao.selectNicknameCheck(member_nickname);
		// 겹치는게 없을때
		if (dupNickname == 0) {
			return true;
		} else {
			return false;
		}

	}

	//중복 번호 체크
	public Boolean isCheckedPhone(String member_phone) {
		int dupPhone = memberDao.selectPhoneCheck(member_phone);
		// 겹치는게 없을때
		if (dupPhone == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	// 마이페이지 - 주문 내역 얻어오기 
	public List<OrderMain> getOrderListById(Pager pager, int order_memberid) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("order_memberid", order_memberid);
		
		List<OrderMain>  myOrderList = (List<OrderMain>)orderMainDao.selectOrderByUid(map);
		
		for(int i=0; i< myOrderList.size(); i++) {
			List<Order_detail> orderDetailList = orderDetailDao.selectOrderDetailById(myOrderList.get(i).getOrder_id());
			myOrderList.get(i).setOrderLists(orderDetailList);
		}
		return myOrderList;
	}

	public int getTotalOrderRows(int order_memberid) {
		int rows = orderMainDao.count(order_memberid);
		return rows;
	}

	public void deleteMember(String member_email) {
		int row = memberDao.deleteMemberByEmail(member_email);
		logger.info("row: " + row);
	}

	//로그인확인 체크
	public String checkLogin(String member_email, String member_pw) {
		
		Member dbMember = memberDao.selectMemberByEmail(member_email);
		
		//email이 존재 하지않을때
		if(dbMember == null) {
			return "notFindEmail";
		}		
		else {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			boolean result = bpe.matches(member_pw,dbMember.getMember_pw());
			//email이 존재하지만 비밀번호가 틀릴때
			if(result) {
				return "success";
			}
			//email이 존재하고 비밀번호가 맞을때 (성공)
			else {
				return "notFindPw";
			}
		} 	
	}
	//이메일찾기 체크
	public String checkEmail(String member_name, String member_phone) {
		int nameCount = memberDao.selectMemberByName(member_name);
		
		if (nameCount == 0) {
			return "notFindName";
		} else {
			int dupPhone = memberDao.selectPhoneCheck(member_phone);
			// 겹치는게 없을때
			if (dupPhone == 0) {
				return "notFindPhone";
			} else {
				return "success";
			}
		}
	}
	//비밀번호 찾기 체크
	public String checkPassword(String member_email, String member_name,
			String member_phone) {
		Member dbMember = memberDao.selectByMember(member_email);
		if(dbMember == null) {
			return "notFindEmail";
		} else {
			if(!dbMember.getMember_phone().equals(member_phone)) {
				return "notFindPhone";
			} else if(!dbMember.getMember_name().equals(member_name)){
				return "notFindName";
			} else {
				return "success";
			}
		}		
	}
}