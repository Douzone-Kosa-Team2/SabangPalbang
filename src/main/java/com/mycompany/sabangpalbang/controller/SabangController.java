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
public class SabangController {
	
	private static final Logger logger = LoggerFactory.getLogger(SabangController.class);
	
	//사방페이지
	@RequestMapping(value = "/sabang_main")
	public String sabang_main() {
		logger.info("sabang 메시지");
		return "sabang/sabang_main";
	}
	@RequestMapping(value = "/sabang_detail")
	public String sabang_detail() {
		logger.info("sabang_detail 메시지");
		return "sabang/sabang_detail";
	}
	@RequestMapping(value = "/sabang_search")
	public String sabang_search() {
		logger.info("sabang_search 메시지");
		return "sabang/sabang_search";
	}


}
