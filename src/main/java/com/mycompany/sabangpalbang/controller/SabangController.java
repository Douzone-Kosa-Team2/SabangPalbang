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

import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Sabang;
import com.mycompany.sabangpalbang.service.SabangService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SabangController {

	private static final Logger logger = LoggerFactory.getLogger(SabangController.class);

	@Autowired
	private SabangService sabangService;

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
		 * sabang_detail()는 그냥 뷰를 연결하는 것이고, sabang_detail_insert()는 파라미터를 전달받아서 insert
		 * 디비작업을 하고 뷰로 연결해준다.
		 * 
		 */
		return "sabang/sabang_detail";
	}

}
