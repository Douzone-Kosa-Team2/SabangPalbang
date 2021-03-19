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

import com.mycompany.sabangpalbang.dto.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//메인페이지 
	@RequestMapping(value = "/main")
	public String home() {
		logger.info("main 메시지");
		return "main";
	}
	
	//광고페이지
	@RequestMapping(value = "/advertisePage")
	public String advertisePage() {
		logger.info("advertisePage 메시지");
		return "advertisePage";
	}
	
	//인포페이지
	@RequestMapping(value = "/info")
	public String info() {
		logger.info("info 메시지");
		return "info";
	}
}
