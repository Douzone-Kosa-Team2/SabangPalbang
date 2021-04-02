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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.service.InquiryService;
import com.mycompany.sabangpalbang.service.MemberService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private InquiryService inquiryService;
	
	//마이페이지
		@GetMapping("/mypage_memberInfo")
		public String mypage_memberInfo(Authentication auth, Model model) {
			logger.info("mypage_memberInfo 메시지");
			
			Member member = memberService.showMember(auth.getName());
			model.addAttribute("member", member);
			
			return "mypage/mypage_memberInfo";
		}
		@GetMapping("/mypage_orderlist")
		public String mypage_orderlist() {
			logger.info("mypage_orderlist 메시지");
			return "mypage/mypage_orderlist";
		}
		
		@GetMapping("/mypage_inquiry")
		public String mypage_inquiry(Authentication auth, Model model, String pageNo, HttpSession session) {
			logger.info("inquirylist 메시지");
			String userNickName = auth.getName();
			model.addAttribute("userNickName",userNickName);
			logger.info(userNickName);
			String anickname = memberService.getByInquiryNickname(auth.getName());
			logger.info(anickname);
			model.addAttribute("anickname",anickname);
			
			return "mypage/mypage_inquiry";
		}
		
		
		@GetMapping("/userInquiryList")

		public String userInquiryList(String anickname, Model model, String pageNo, HttpSession session) {
			logger.info("userInquiryList 메시지");

			
			/*
			 * String userNickName = auth.getName(); String anickname =
			 * memberService.getByInquiryNickname(auth.getName());
			 */
			logger.info(anickname);
			
			
			
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
	        
	        int totalRows=inquiryService.getTotalMyRows(anickname);
	        Pager pager=new Pager(10,5,totalRows,intPageNo);
	    	//사방 문의게시판 가져오기 
			List<Inquiry> inquiryList = inquiryService.getInquiryList(pager, anickname);
			
	        session.setAttribute("pager", pager);
	        model.addAttribute("inquiryList", inquiryList);

	        model.addAttribute("anickname", anickname);
	       // model.addAttribute("sid", sid);
			

			return "mypage/userInquiry";
			
		}
		
		
		
		
		
		
		@PostMapping("/updateMember")
		public String updateMember(Member member) {
			logger.info("updateMember 메시지");
			logger.info("member 비밀번호"+member.getMember_phone());
			memberService.updateMember(member);
			
			
			return "redirect:/mypage_memberInfo";
		}
		
}
