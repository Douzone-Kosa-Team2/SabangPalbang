package com.mycompany.sabangpalbang.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.sabangpalbang.dto.Cart;
import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.dto.OrderMain;
import com.mycompany.sabangpalbang.dto.Order_detail;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.ProductCart;
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

		if (products != null) {
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
			mycart.setSabang_id(sid);
			mycart.setSabang_imgoname(sabangImg);
			mycart.setSabang_name(sabangName);
			mycart.setProducts_totalcount(products.length);
			mycart.setProduct_totalprice(totalprice);

			List<ProductCart> productCartlist = new ArrayList<ProductCart>();
			for (int i = 0; i < products.length; i++) {
				productCartlist.add(new ProductCart(productlist.get(i).getProduct_id(),
						productlist.get(i).getProduct_name(), productlist.get(i).getProduct_price()));
			}
			mycart.setProductCarts(productCartlist);
			String cartId = format1.format(new Date().getTime());

			logger.info(cartId);
			logger.info(mycart.getSabang_imgoname());
			logger.info(mycart.getSabang_name());
			logger.info("" + mycart.getProducts_totalcount());
			logger.info("" + mycart.getProduct_totalprice());
			for (int i = 0; i < products.length; i++) {
				logger.info("" + mycart.getProductCarts().get(i).getProduct_id());
				logger.info("" + mycart.getProductCarts().get(i).getProduct_name());
				logger.info("" + mycart.getProductCarts().get(i).getProduct_price());
			}
			Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");

			if (mycartlist == null) {
				mycartlist = new HashMap<String, Cart>();
			}
			mycartlist.put(cartId, mycart);
			session.setAttribute("sessionCart", mycartlist);
		}
		return "pay/shopping_basket";
	}

	@PostMapping("/pay")
	public String pay(String cartKey, Authentication auth, Model model, HttpSession session) { // form이 넘어와야함
		logger.info("/pay 메시지 ");
		logger.info(cartKey);

		String user_email = auth.getName();
		logger.info(user_email);
		Member member = memberService.getPostInfo(user_email);

		logger.info(member.getMember_name());

		Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");
		Cart selectedCart = mycartlist.get(cartKey);

		model.addAttribute("selectedCart", selectedCart);
		model.addAttribute("cartKey", cartKey);
		model.addAttribute("member", member);
		return "pay/paypageCart";

	}

	@PostMapping("/payNow")
	public String payNow(String[] products, Authentication auth, Model model) {

		for (int i = 0; i < products.length; i++) {
			logger.info("들어오는 상품 id " + products[i]);
		}

		if (products != null) {
			List<Product> productlist = new ArrayList<Product>();
			for (int i = 0; i < products.length; i++) {
				productlist.add(payService.getProductById(Integer.parseInt(products[i])));
			}

			int sid = productlist.get(0).getSabang_id();

			logger.info("상품의 id " + productlist.get(0).getProduct_id());
			logger.info("상품의 가격 " + productlist.get(0).getProduct_price());
			logger.info("상품의 이름 " + productlist.get(0).getProduct_name());
			Sabang sabang = sabangService.getSabang(sid);

			String user_email = auth.getName();
			logger.info(user_email);
			Member member = memberService.getPostInfo(user_email);

			logger.info(member.getMember_name());
			model.addAttribute("products", products);
			model.addAttribute("sabang", sabang);
			model.addAttribute("productlist", productlist);
			model.addAttribute("member", member);
		}
		return "pay/paypage";
	}
	

	@PostMapping("/paySuccess")
	public String pay_success(Model model, HttpSession session, OrderMain order,
			@RequestParam(name = "sabangid") int sabangid,
			@RequestParam(name = "cartKey") String cartKey, 
			@RequestParam(name = "productlist") String[] productlist,
			Authentication auth) {
		logger.info("pay_success 메시지");

		logger.info("" + auth.getName());
		logger.info(order.getOrder_phone());
		logger.info(order.getOrder_zipcode());
		logger.info(order.getOrder_roadaddress());
		logger.info(order.getOrder_detailaddress());
		logger.info("" + sabangid);
		logger.info("" + order.getOrder_price());
		logger.info(order.getOrder_payment());
		logger.info(order.getOrder_bankcode());
		



		int memberId = memberService.getIdByEmail(auth.getName());
		order.setOrder_memberid(memberId);

		List<Order_detail> orderList = new ArrayList<>();

		for (int i = 0; i < productlist.length; i++) {
			orderList.add(new Order_detail(Integer.parseInt(productlist[i])));
		}
		
		List<Product> productname = new ArrayList<>();
		Product productzz = new Product();
		String proid;
		int proid2;
		for(int i=0;i<productlist.length;i++) {
			proid = productlist[i];
			proid2 = Integer.parseInt(proid);
			productzz = payService.getProductById(proid2);		
			productname.add(productzz);			
		}
		order.setOrderLists(orderList);
		order.setOrder_sabangid(sabangid);
		order.setOrder_state("배송준비중");
	
		// 저장 부분
		String result = payService.addOrder(order);

		//넘겨주는 부분
		Sabang sabangname = sabangService.getSabang(sabangid);

		// 세션 삭제 
		Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");
		mycartlist.remove(cartKey);
		session.setAttribute("sessionCart", mycartlist);
		
		model.addAttribute("productname", productname);
		model.addAttribute("sabangname", sabangname);
		model.addAttribute("result", result);
		model.addAttribute("order", order);

		// 넘겨주는 부분

		return "pay/pay_success";
	}
	
	@PostMapping("/payDirectSuccess")
	public String payDirectSuccess(OrderMain order, @RequestParam(name = "products") String[] products, Authentication auth, @RequestParam(name = "sabangid") int sabangid, Model model) {
		logger.info("pay_DDsuccess 메시지");
		

		int memberId = memberService.getIdByEmail(auth.getName());
		order.setOrder_memberid(memberId);
		
		
		List<Order_detail> orderList = new ArrayList<>();

		for (int i = 0; i < products.length; i++) {
			orderList.add(new Order_detail(Integer.parseInt(products[i])));
			
		}
		
		List<Product> productname = new ArrayList<>();
		Product productzz = new Product();
		String proid;
		int proid2;
		for(int i=0;i<products.length;i++) {
			proid = products[i];
			proid2 = Integer.parseInt(proid);
			productzz = payService.getProductById(proid2);		
			productname.add(productzz);			
			
		}
		
	
		order.setOrderLists(orderList);
		order.setOrder_sabangid(sabangid);
		order.setOrder_state("배송준비중");
	
		// 저장 부분
		String result = payService.addOrder(order);

		//넘겨주는 부분
		Sabang sabangname = sabangService.getSabang(sabangid);
		model.addAttribute("productname", productname);
		model.addAttribute("sabangname", sabangname);
		model.addAttribute("result", result);
		model.addAttribute("order", order);
		return "pay/pay_Dsuccess";
	}
	

	
	@GetMapping("/deleteCart")
	public String deleteCart(String cid, HttpSession session) {
		logger.info("deleteCart");
		logger.info(cid);
		Map<String, Cart> mycartlist = (Map<String, Cart>) session.getAttribute("sessionCart");
		logger.info("1" + mycartlist.size());
		mycartlist.remove(cid);

		session.setAttribute("sessionCart", mycartlist);
		logger.info("2" + mycartlist.size());
		return "pay/shopping_basket";
	}

}
