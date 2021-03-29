package com.mycompany.sabangpalbang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AuthController {
	@Autowired
	private MemberService memberService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	//로그인페이지 form
		@GetMapping("/loginForm")
		public String loginForm() {
			logger.info("loginForm 메시지");
			
			
			
			
			
			
			
			return "auth/loginForm";
		}
		@GetMapping("/signinForm")
		public String signinForm() {
			logger.info("signinForm 메시지");
			return "auth/signinForm";
		}
		@PostMapping("/signin_successForm")
		public String signin_successForm() {
			logger.info("signin_successForm 메시지");
			return "auth/signin_successForm";
		}
		@GetMapping("/findEmailForm")
		public String findEmailForm() {
			logger.info("findEmailForm 메시지");
			return "auth/findEmailForm";
		}
		@PostMapping("/findEmail_successForm")
		public String findEmail_successForm() {
			logger.info("findEmail_successForm 메시지");
			return "auth/findEmail_successForm";
		}
		@GetMapping("/resetPwForm")
		public String resetPwForm() {
			logger.info("resetPwForm 메시지");
			return "auth/resetPwForm";
		}
		@PostMapping("/resetPw_successForm")
		public String resetPw_successForm() {
			logger.info("resetPw_successForm 메시지");
			return "auth/resetPw_successForm";
		}
		
		//동작 부분
		
		//회원가입
		@PostMapping("/signin")
		public String signin(Member member) {
			logger.info(member.getMember_email());
			logger.info(member.getMember_email2());
			logger.info(member.getMember_pw());
			logger.info(member.getMember_name());
			logger.info(member.getTel_pre());
			logger.info(member.getTel_suf());
			logger.info(member.getMember_nickname());
			
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		    member.setMember_pw(bpe.encode(member.getMember_pw()));
		    
		    member.setMember_email(member.getMember_email()+"@"+member.getMember_email2());
		    member.setMember_phone(member.getTel_pre()+member.getTel_suf());
		    logger.info(member.getMember_email());
		    logger.info(member.getMember_pw());
		    logger.info(member.getMember_phone());
		    
		    
		    memberService.signin(member);
		    
			return "redirect:/loginForm";
		}
		
		
		
		// 권한 오류 페이지
		@GetMapping("/auth/error403")
		public String error403() {
			return "auth/error403";
		}
		

}
