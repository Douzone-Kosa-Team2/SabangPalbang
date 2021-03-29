package com.mycompany.sabangpalbang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	//로그인페이지 form
		@RequestMapping(value = "/loginForm")
		public String loginForm() {
			logger.info("loginForm 메시지");
			return "auth/loginForm";
		}
		@RequestMapping(value = "/signinForm")
		public String signinForm() {
			logger.info("signinForm 메시지");
			return "auth/signinForm";
		}
		@RequestMapping(value = "/signin_successForm")
		public String signin_successForm() {
			logger.info("signin_successForm 메시지");
			return "auth/signin_successForm";
		}
		@RequestMapping(value = "/findEmailForm")
		public String findEmailForm() {
			logger.info("findEmailForm 메시지");
			return "auth/findEmailForm";
		}
		@RequestMapping(value = "/findEmail_successForm")
		public String findEmail_successForm() {
			logger.info("findEmail_successForm 메시지");
			return "auth/findEmail_successForm";
		}
		@RequestMapping(value = "/resetPwForm")
		public String resetPwForm() {
			logger.info("resetPwForm 메시지");
			return "auth/resetPwForm";
		}
		@RequestMapping(value = "/resetPw_successForm")
		public String resetPw_successForm() {
			logger.info("resetPw_successForm 메시지");
			return "auth/resetPw_successForm";
		}
		
		
		// 동작
		
		
		
		
		
		// 권한 오류 페이지
		@GetMapping("/error403")
		public String error403() {
			return "auth/error403";
		}

}
