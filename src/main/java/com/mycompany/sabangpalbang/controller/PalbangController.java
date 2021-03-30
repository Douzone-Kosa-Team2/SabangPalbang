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
import com.mycompany.sabangpalbang.service.PalbangService;



@Controller
public class PalbangController {
	@Autowired
	private PalbangService palbangService;
	
	private static final Logger logger = LoggerFactory.getLogger(PalbangController.class);
	
	//팔방페이지 - 좋아요 순 (디폴트)
	@GetMapping("/palbang_main")
	public String palbang_main(@RequestParam(defaultValue = "0")String std, String pageNo, Model model, HttpSession session) {
		logger.info("palbang 메시지");

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
		int totalRows = palbangService.getTotalRows();
		Pager pager = new Pager(6, 2, totalRows, intPageNo);
		session.setAttribute("pager", pager);
		
		// 정렬 기준 
		List<Palbang> list = palbangService.getPalbangList_Like(pager);
		if(std.equals("0")) {
			list = palbangService.getPalbangList_Like(pager);
		}else if(std.equals("1")) {
			list = palbangService.getPalbangList_View(pager);
		}else if(std.equals("2")) {
			list = palbangService.getPalbangList_New(pager);
		}else {
			list = palbangService.getPalbangList_Old(pager);
		}

		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("stdno", std);
		
		return "palbang/palbang_main";
	}
	
	@RequestMapping(value = "/palbang_create")
	public String palbang_create() {
		logger.info("palbang_create 메시지");
		return "palbang/palbang_create";
	}
	@RequestMapping(value = "/palbang_update")
	public String palbang_update() {
		logger.info("palbang_update 메시지");
		return "palbang/palbang_update";
	}
	@RequestMapping(value = "/palbang_detail")
	public String palbang_detail() {
		logger.info("palbang_detail 메시지 - 222222");
		return "palbang/palbang_detail";
	}
	
}
