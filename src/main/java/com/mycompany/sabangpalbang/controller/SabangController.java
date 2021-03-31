package com.mycompany.sabangpalbang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Product;
import com.mycompany.sabangpalbang.dto.Sabang;
import com.mycompany.sabangpalbang.service.InquiryService;
import com.mycompany.sabangpalbang.service.SabangService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SabangController {

	private static final Logger logger = LoggerFactory.getLogger(SabangController.class);

	@Autowired
	private SabangService sabangService;
	@Autowired
	private InquiryService inquiryService;
	
	// 사방페이지
	@GetMapping("/sabang_main")
	public String sabang_main(@RequestParam(defaultValue="0")String std, String pageNo, Model model, HttpSession session) {
		logger.info("sabang 메시지");

		int intPageNo = 1;
		if (pageNo == null) { // 클라이언트에서 pageNo가 넘어오지 않앗을때
			// 세션에서 Pager를 찾고 PageNo를 설정
			Pager pager = (Pager) session.getAttribute("pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		// 없으면 Pager를 세션에 저장
		int totalRows = sabangService.getTotalRows();
		Pager pager = new Pager(6, 2, totalRows, intPageNo);
		session.setAttribute("pager", pager);
		
		// 정렬 기준 
		List<Sabang> list = sabangService.getSabangList_Buy(pager);
		if(std.equals("0")) {
			list = sabangService.getSabangList_Buy(pager);
		}else if(std.equals("1")) {
			list = sabangService.getSabangList_Low(pager);
		}else if(std.equals("2")) {
			list = sabangService.getSabangList_High(pager);
		}else {
			list = sabangService.getSabangList_View(pager);
		}
			
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("stdno", std);

		return "sabang/sabang_main";
	}
	
	// 사방 정렬 (판매율순 / 낮은 가격순/ 높은 가격순 / 조회수순 )
	
	

	@GetMapping("/sabang_search")
	public String sabang_search(int price,Model model) {
		logger.info("sabang_search 메시지");
		
		logger.info(""+price);
		
		List <Sabang> rslist = sabangService.getRecommendList(price);
		model.addAttribute("rslist", rslist);
		
		return "sabang/sabang_search";
	}

	@RequestMapping(value = "/pop_ask")
	public String pop_ask() {
		logger.info("pop_ask 메시지");
		return "sabang/pop_ask";
	}

	@GetMapping("/sabang_detail")
	public String sabang_detail(int sid, Model model, String pageNo, HttpSession session) {
		logger.info("sabang_detail 메시지");
		// 조회수 1증가 
		sabangService.addViewCount(sid);
		
		//사방 아이디에 대한 사방 정보 가져오기
		Sabang sabang = sabangService.getSabang(sid);
		
		//사방 아이디에 대한 품목 리스트를 가져오기
		List<Product> productList = sabangService.getSabangDetail(sid);
		
		/*
		 * int intPageNo=1; if(pageNo==null) { //세션에서 Pager를 찾고, 있으면 pageNo를
		 * 설정하고, Pager pager=(Pager)session.getAttribute("pager"); if(pager
		 * !=null) { intPageNo=pager.getPageNo(); } }else {
		 * intPageNo=Integer.parseInt(pageNo); }
		 * 
		 * int totalRows=inquiryService.getTotalRows(); Pager pager=new
		 * Pager(10,5,totalRows,intPageNo); //사방 문의게시판 가져오기 List<Inquiry>
		 * inquiryList = inquiryService.getInquiryList(pager, sid);
		 */
		
        //session.setAttribute("pager", pager);
		model.addAttribute("sid", sid);
		model.addAttribute("sabang", sabang);
		model.addAttribute("productList",productList);
		//model.addAttribute("inquiryList", inquiryList);
		return "sabang/sabang_detail";
	}

	@RequestMapping(value = "/sabang_detail_insert")
	public String sabang_detail_insert() {
		logger.info("sabang_detail_insert 메시지");

		return "sabang/sabang_detail";
	}
	@GetMapping("/inquirylist")
	public String inquirylist(int sid, Model model, String pageNo, HttpSession session) {
		logger.info("inquirylist 메시지");
		 	int intPageNo=1;
	        if(pageNo==null) {
		        //세션에서 Pager를 찾고, 있으면 pageNo를 설정하고,
		        Pager pager=(Pager)session.getAttribute("pager");
		        if(pager !=null) {
		              intPageNo=pager.getPageNo();
		        }
	        }else {
	           intPageNo=Integer.parseInt(pageNo);
	        }
	        
	        int totalRows=inquiryService.getTotalRows();
	        Pager pager=new Pager(10,5,totalRows,intPageNo);
	    	//사방 문의게시판 가져오기 
			List<Inquiry> inquiryList = inquiryService.getInquiryList(pager, sid);
			
	        session.setAttribute("pager", pager);
	        model.addAttribute("inquiryList", inquiryList);
	        model.addAttribute("sid", sid);
		
		return "sabang/inquiry";
	}
	
	

}
