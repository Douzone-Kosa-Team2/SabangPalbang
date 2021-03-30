package com.mycompany.sabangpalbang.controller;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AuthController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private MemberService memberService;
	
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
		
		// 아이디 찾기 
		@PostMapping("/findEmailDo")
		public String findEmailDo(String member_name, String member_phone, Model model) {
			Member member = memberService.findEmail(member_name, member_phone);  
			
			model.addAttribute("member_email", member.getMember_email());
			model.addAttribute("member_nickname", member.getMember_nickname());
			return "auth/findEmail_successForm"; // 찾으면 
		}
		
		// 비밀번호 재설정
		@PostMapping("/findPwdDo")
		public String findPwdDo(String member_email, String member_name, String member_phone, Model model) {
			//비밀번호 찾기 이후 필요한 값 찾기
			Member member = memberService.findPwd(member_email, member_name, member_phone);  
					
			model.addAttribute("member_email", member.getMember_email());
			model.addAttribute("member_nickname", member.getMember_nickname());
			
			//비밀번호 재설정 후 디비에 저장
			
			String resetPw = memberService.resetPwd(member_email);
			logger.info(resetPw);
			
			return "auth/resetPw_successForm"; // 찾으면 
		}
				
				
		// 권한 오류 페이지
		@GetMapping("/auth/error403")
		public String error403() {
			return "auth/error403";
		}
		

}
