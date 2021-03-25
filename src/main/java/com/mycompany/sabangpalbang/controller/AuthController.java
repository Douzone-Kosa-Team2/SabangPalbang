package com.mycompany.sabangpalbang.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	//로그인페이지
		@RequestMapping(value = "/login")
		public String login() {
			logger.info("login 메시지");
			return "auth/login";
		}
		@RequestMapping(value = "/signin")
		public String signin() {
			logger.info("signin 메시지");
			return "auth/signin";
		}
		@RequestMapping(value = "/signin_success")
		public String signin_success() {
			logger.info("signin_success 메시지");
			return "auth/signin_success";
		}
		@RequestMapping(value = "/findEmail")
		public String findEmail() {
			logger.info("findEmail 메시지");
			return "auth/findEmail";
		}
		@RequestMapping(value = "/findEmail_success")
		public String findEmail_success() {
			logger.info("findEmail_success 메시지");
			return "auth/findEmail_success";
		}
		@RequestMapping(value = "/resetPw")
		public String resetPw() {
			logger.info("resetPw 메시지");
			return "auth/resetPw";
		}
		@RequestMapping(value = "/resetPw_success")
		public String resetPw_success() {
			logger.info("resetPw_success 메시지");
			return "auth/resetPw_success";
		}
		
		/*
		 * @PostMapping("/") public String
		 */ 
}
