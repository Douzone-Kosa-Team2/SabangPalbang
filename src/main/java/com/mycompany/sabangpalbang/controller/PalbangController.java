package com.mycompany.sabangpalbang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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

import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Palbang_detail;
import com.mycompany.sabangpalbang.service.MemberService;
import com.mycompany.sabangpalbang.service.PalbangService;



@Controller
public class PalbangController {
	@Autowired
	private PalbangService palbangService;
	
	@Autowired
	private MemberService memberService;
	
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
	@GetMapping("/palbang_detail")
	public String palbang_detail(int pid, Model model, Authentication auth) {
		logger.info("palbang_detail 메시지");
		
		Palbang palbang = palbangService.getPalbang(pid);
		List<Palbang_detail> palbanglist = palbangService.getPalbangDetail(pid);
		String email = memberService.getEmailByNickname(palbang.getPalbang_nickname());
		logger.info(""+ pid);
		logger.info(""+ palbang.getPalbang_id());
		logger.info(""+ palbanglist.get(0).getPalbang_detailno());
		
		if(auth != null && auth.getName().equals(email)) {
			model.addAttribute("email", 1);	
		}else {
			model.addAttribute("email", 0);
		}
		model.addAttribute("palbang", palbang);
		model.addAttribute("palbanglist", palbanglist);
		
		palbangService.addViewCount(pid);
		
		
		
		
		return "palbang/palbang_detail";
	}
	   @PostMapping(value="/likeUp", produces="application/json;charset=UTF-8")
	   @ResponseBody
	   public String likeUp(int palbang_id, Authentication auth) {
		
		   String member_email = auth.getName();
		   
		  int member_id = memberService.getIdByEmail(member_email);
		  palbangService.insertLike(palbang_id, member_id);
		  logger.info("0");
		  
		   
	      JSONObject jsonObject = new JSONObject();
	      jsonObject.put("result","success");
	      
	      return jsonObject.toString();
	   }
	   
	   @GetMapping(value="/likeDown", produces="application/json;charset=UTF-8")
	   @ResponseBody
	   public String likeDown() {
	     
	      JSONObject jsonObject = new JSONObject();
	      jsonObject.put("result","success");
	      
	      return jsonObject.toString();
	   }
	
}
