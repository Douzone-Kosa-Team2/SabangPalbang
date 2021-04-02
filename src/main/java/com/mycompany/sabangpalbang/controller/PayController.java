package com.mycompany.sabangpalbang.controller;




import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.sabangpalbang.dto.Cart;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;
import com.mycompany.sabangpalbang.service.PayService;
import com.mycompany.sabangpalbang.service.SabangService;

@Controller
public class PayController {
	@Autowired
	private PayService payService;
	
	@Autowired
	private SabangService sabangService;
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	//pay페이지
		@GetMapping("/shopping_basket")
		public String shopping_basket(HttpSession session) {
			logger.info("shoppingbasket 메시지");
			
			return "pay/shopping_basket";
		}
		@PostMapping("/shopping_basket_fromdetail")
		public String shopping_basket_fromdetail(String[] products, HttpSession session) {
			logger.info("shopping_basket_fromdetail 메시지");
			//logger.info(products[0]);
			
			
			if(products == null)  {
				return "pay/shopping_basket";
			}
			else {
				Cart mycart = new Cart();
				List<Product> productlist = new ArrayList<Product>();
				for(int i=0;i<products.length;i++) {
					productlist.add(payService.getProductById(Integer.parseInt(products[i])));
				}
				
				int sid = productlist.get(0).getSabang_id();
				Sabang sabang = sabangService.getSabang(sid);
				
				
				String sabangImg = sabang.getSabang_imgoname();
				String sabangName = sabang.getSabang_name();
				
				int totalprice=0;
				for(int i=0;i<products.length;i++) {
					totalprice+=productlist.get(i).getProduct_price();
				}
				
				mycart.setCart_id(new Date().getTime() + "-" + sid);
				mycart.setSabang_imgoname(sabangImg);
				mycart.setSabang_name(sabangName);
				mycart.setProducts_totalcount(products.length);
				mycart.setProduct_totalprice(totalprice);
				
				logger.info(mycart.getCart_id());
				logger.info(mycart.getSabang_imgoname());
				logger.info(mycart.getSabang_name());
				logger.info(""+mycart.getProducts_totalcount());
				logger.info(""+mycart.getProduct_totalprice());
				
				List<Cart> mycartlist = (List<Cart>)session.getAttribute("sessionCart");
				
				if (mycartlist == null) {
					mycartlist = new ArrayList<Cart>();	
				}
				mycartlist.add(mycart);
				session.setAttribute("sessionCart", mycartlist);
					
				return "pay/shopping_basket";
			}
		}
		@GetMapping("/pay")
		public String pay() {
			logger.info("/pay 메시지");
			return "pay/pay";
		}
		@RequestMapping(value = "/pay_success")
		public String pay_success() {
			logger.info("pay_success 메시지");
			return "pay/pay_success";
		}
		@PostMapping("/deleteCart")
		public String deleteCart() {
			
			return "redirect:/shopping_basket";
		}

}
