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
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	//pay페이지
		@RequestMapping(value = "/shopping_basket")
		public String shopping_basket() {
			logger.info("shoppingbasket 메시지");
			return "pay/shopping_basket";
		}
		@RequestMapping(value = "/pay")
		public String pay() {
			logger.info("/pay 메시지");
			return "pay//pay";
		}
		@RequestMapping(value = "/pay_success")
		public String pay_success() {
			logger.info("pay_success 메시지");
			return "pay/pay_success";
		}

}
