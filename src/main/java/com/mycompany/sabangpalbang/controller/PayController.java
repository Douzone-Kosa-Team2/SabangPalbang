package com.mycompany.sabangpalbang.controller;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.sabangpalbang.dto.OrderMain;






@Controller
public class PayController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	//pay페이지
		@RequestMapping(value = "/shopping_basket")
		public String shopping_basket(String[] products) {
			logger.info("shoppingbasket 메시지");
			logger.info(products[0]);
			return "pay/shopping_basket";
		}
		@RequestMapping(value = "/pay")
		public String pay() {
			logger.info("/pay 메시지");
			return "pay/pay";
		}
		@RequestMapping(value = "/pay_success")
		public String pay_success() {
			logger.info("pay_success 메시지");
			return "pay/pay_success";
		}

}
