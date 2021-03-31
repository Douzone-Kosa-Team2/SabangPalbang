package com.mycompany.sabangpalbang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.service.MemberService;




@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MemberService memberService;
	
	//마이페이지
		@GetMapping("/mypage_memberInfo")
		public String mypage_memberInfo(Authentication auth, Model model) {
			logger.info("mypage_memberInfo 메시지");
			
			Member member = memberService.showMember(auth.getName());
			model.addAttribute("member", member);
			
			return "mypage/mypage_memberInfo";
		}
		@GetMapping("/mypage_orderlist")
		public String mypage_orderlist() {
			logger.info("mypage_orderlist 메시지");
			return "mypage/mypage_orderlist";
		}
		@GetMapping("/mypage_inquiry")
		public String mypage_inquiry() {
			logger.info("mypage_inquiry 메시지");
			return "mypage/mypage_inquiry";
		}
		
		@PostMapping("/updateMember")
		public String updateMember(Member member) {
			logger.info("updateMember 메시지");
			logger.info("member 비밀번호"+member.getMember_phone());
			memberService.updateMember(member);
			
			
			return "mypage/mypage_memberInfo";
		}
		
}
