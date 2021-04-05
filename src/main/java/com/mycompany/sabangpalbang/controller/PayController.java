package com.mycompany.sabangpalbang.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.sabangpalbang.dto.Cart;
import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;
import com.mycompany.sabangpalbang.service.MemberService;
import com.mycompany.sabangpalbang.service.PayService;
import com.mycompany.sabangpalbang.service.SabangService;

@Controller
public class PayController {
	@Autowired
	private PayService payService;

	@Autowired
	private SabangService sabangService;

	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	// pay페이지
	@GetMapping("/shopping_basket")
	public String shopping_basket(HttpSession session) {
		logger.info("shoppingbasket 메시지");

		return "pay/shopping_basket";
	}

	@PostMapping("/shopping_basket_fromdetail")
	public String shopping_basket_fromdetail(String[] products, HttpSession session) {
		SimpleDateFormat format1 = new SimpleDateFormat("HHmmss");
		logger.info("shopping_basket_fromdetail 메시지");
		logger.info(products[0]);

		if (products == null) {
			return "pay/shopping_basket";
		} else {
			Cart mycart = new Cart();
			List<Product> productlist = new ArrayList<Product>();
			for (int i = 0; i < products.length; i++) {
				productlist.add(payService.getProductById(Integer.parseInt(products[i])));
			}

			int sid = productlist.get(0).getSabang_id();
			Sabang sabang = sabangService.getSabang(sid);
			//

			String sabangImg = sabang.getSabang_imgoname();
			String sabangName = sabang.getSabang_name();

			int totalprice = 0;
			for (int i = 0; i < products.length; i++) {
				totalprice += productlist.get(i).getProduct_price();
			}

			mycart.setSabang_imgoname(sabangImg);
			mycart.setSabang_name(sabangName);
			mycart.setProducts_totalcount(products.length);
			mycart.setProduct_totalprice(totalprice);
			String cartId = format1.format(new Date().getTime());

			logger.info(cartId);
			logger.info(mycart.getSabang_imgoname());
			logger.info(mycart.getSabang_name());
			logger.info("" + mycart.getProducts_totalcount());
			logger.info("" + mycart.getProduct_totalprice());

			Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");

			if (mycartlist == null) {
				mycartlist = new HashMap<String, Cart>();
			}
			mycartlist.put(cartId, mycart);
			session.setAttribute("sessionCart", mycartlist);

			return "pay/shopping_basket";
		}
	}

	@PostMapping("/pay")
	public String pay() { // form이 넘어와야함
		logger.info("/pay 메시지 ");

		return "pay/paypage";
	}

	@PostMapping("/payNow")
	public String payNow(String[] products, Authentication auth,  Model model) {
		
		for(int i=0; i<products.length;i++) {
            logger.info("들어오는 상품 id "+products[i]);
         }

		if (products == null) {
			return "pay/paypage";
		} else {

			
			List<Product> productlist = new ArrayList<Product>();
			for (int i = 0; i < products.length; i++) {
				productlist.add(payService.getProductById(Integer.parseInt(products[i])));
			}

			int sid = productlist.get(0).getSabang_id();
			
			logger.info("상품의 id "+productlist.get(0).getProduct_id());
			logger.info("상품의 가격 "+productlist.get(0).getProduct_price());
			logger.info("상품의 이름 "+productlist.get(0).getProduct_name());
			Sabang sabang = sabangService.getSabang(sid);
			
			String user_email = auth.getName();
			logger.info(user_email);
			Member member = memberService.getPostInfo(user_email);
			
			logger.info(member.getMember_name());
			model.addAttribute("sabang", sabang);
			model.addAttribute("productlist", productlist);
			model.addAttribute("member", member);
			return "pay/paypage";
		}

	}
	/*
	 * @GetMapping("myPost") public String myPost(Ay) {
	 * 
	 * }
	 */
		
	@RequestMapping(value = "/pay_success")
	public String pay_success() {
		logger.info("pay_success 메시지");
		return "pay/pay_success";
	}

	@GetMapping("/deleteCart")
	public String deleteCart(String cid, HttpSession session) {
		logger.info("deleteCart");
		logger.info(cid);
		Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");
		logger.info("1" + mycartlist.size());
		mycartlist.remove(cid);
		// mycartlist.clear();
		session.setAttribute("sessionCart", mycartlist);
		logger.info("2" + mycartlist.size());
		return "pay/shopping_basket";
	}


}
