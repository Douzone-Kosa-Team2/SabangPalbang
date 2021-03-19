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
	@RequestMapping(value = "/sabang_search")
	public String sabang_search() {
		logger.info("sabang_search 메시지");
		return "sabang/sabang_search";
	}

	@RequestMapping(value = "/pop_ask")
	public String pop_ask() {
		logger.info("pop_ask 메시지");
		return "sabang/pop_ask";
	}
	
	
	@RequestMapping(value = "/sabang_detail")
	public String sabang_detail() {
		logger.info("sabang_detail 메시지");
		return "sabang/sabang_detail";
	}
	
	@RequestMapping(value = "/sabang_detail_insert")
	public String sabang_detail_insert() {
		logger.info("sabang_detail_insert 메시지");
		// 여기서 문의내용 insert 디비 작업을 해주면됨 
		/*
		 * 위에 /sabang_detail과 /sabang_detail_insert가 리턴하는 뷰네임은 같지만 하는일은 다르다. 
		 *  sabang_detail()는 그냥 뷰를 연결하는 것이고, 
		 *   sabang_detail_insert()는 파라미터를 전달받아서 insert 디비작업을 하고 뷰로 연결해준다. 
		 * 
		 */
		return "sabang/sabang_detail";
	}
	
	
}
