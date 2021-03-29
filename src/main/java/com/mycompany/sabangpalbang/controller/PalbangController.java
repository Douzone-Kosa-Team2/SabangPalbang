package com.mycompany.sabangpalbang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class PalbangController {
	
	private static final Logger logger = LoggerFactory.getLogger(PalbangController.class);
	
	 
	
	//팔방페이지
	@RequestMapping(value = "/palbang_main")
	public String palbang_main() {
		logger.info("palbang 메시지");
		return "palbang/palbang_main";
	}
	@RequestMapping(value = "/palbang_create")
	public String palbang_create() {
		logger.info("palbang_create 메시지");
		return "palbang/palbang_create";
	}
	@RequestMapping(value = "/palbang_update")
	public String palbang_update() {
		logger.info("palbang_update 메시지");
		return "palbang/palbang_update";
	}
	@RequestMapping(value = "/palbang_detail")
	public String palbang_detail() {
		logger.info("palbang_detail 메시지 - 222222");
		return "palbang/palbang_detail";
	}
	
}
