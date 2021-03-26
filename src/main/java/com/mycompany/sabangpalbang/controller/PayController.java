package com.mycompany.sabangpalbang.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.sabangpalbang.dto.Order_detail;


/**
 * Handles requests for the application home page.
 */
@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	//pay페이지
		@RequestMapping(value = "/shopping_basket")
		public String shopping_basket(int order_detailno) {
			logger.info("shoppingbasket 메시지");
			return "pay/shopping_basket";
		}
		@RequestMapping(value = "/pay")
		public String pay() {
			logger.info("/pay 메시지");
			return "pay/pay";
		}
		@RequestMapping(value = "/pay_success")
		public String pay_success(Order_detail order_detail) {
			logger.info("pay_success 메시지");
			return "pay/pay_success";
		}

}
