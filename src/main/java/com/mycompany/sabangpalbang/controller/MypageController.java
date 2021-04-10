package com.mycompany.sabangpalbang.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.sabangpalbang.dto.Inquiry;
import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.dto.OrderMain;
import com.mycompany.sabangpalbang.dto.Pager;
import com.mycompany.sabangpalbang.service.InquiryService;
import com.mycompany.sabangpalbang.service.MemberService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private InquiryService inquiryService;

	@GetMapping("/mypage_memberInfo_check")
	public String mypage_memberInfo_check(Authentication auth, Model model) {
		logger.info("mypage_memberInfo_check 메시지");

		Member member = memberService.showMember(auth.getName());
		model.addAttribute("member", member);
		return "mypage/mypage_memberInfo_check";
	}

	@PostMapping("/updateMemberForm")
	public String updateMember(Authentication auth, Model model, Member checkmember) {
		logger.info("updateMember 메시지");

		Member member = memberService.showMember(auth.getName());
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();

		if ((checkmember.getMember_id() == member.getMember_id())
				&& (checkmember.getMember_email().equals(member.getMember_email()))
				&& (bpe.matches(checkmember.getMember_pw(), member.getMember_pw()))) {
			
			model.addAttribute("member", member);
			return "mypage/mypage_memberInfo";
		} else {
			return "redirect:/mypage_memberInfo_check";
		}
	}

	@GetMapping("/mypage_orderlist")
	public String mypage_orderlist(String pageNo, Model model, Authentication auth, HttpSession session) {
		logger.info("mypage_orderlist 메시지");

		int intPageNo = 1;
		if (pageNo == null) { // 클라이언트에서 pageNo가 넘어오지 않앗을때
			// 세션에서 Pager를 찾고 PageNo를 설정
			Pager pager = (Pager) session.getAttribute("mypage_order_pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		// 없으면 Pager를 세션에 저장
		int order_memberid = memberService.getIdByEmail(auth.getName());
		int totalRows = memberService.getTotalOrderRows(order_memberid);
		Pager pager = new Pager(6, 5, totalRows, intPageNo);
		session.setAttribute("mypage_order_pager", pager);

		// DB SELECT - 설명 
		List<OrderMain> myOrderList = memberService.getOrderListById(pager, order_memberid);
		model.addAttribute("myOrderList", myOrderList);
		return "mypage/mypage_orderlist";
	}

	@GetMapping("/mypage_inquiry")
	public String mypage_inquiry(Authentication auth, Model model, String pageNo, HttpSession session) {
		logger.info("inquirylist 메시지");
		String member_nickname = memberService.getByInquiryNickname(auth.getName());

		model.addAttribute("member_nickname", member_nickname);
		return "mypage/mypage_inquiry";
	}

	// AJAX 요청 - HTML 코드 조각을 리턴
	@GetMapping("/userInquiryList")
	public String userInquiryList(String member_nickname, String pageNo, Model model, HttpSession session) {
		logger.info("userInquiryList 메시지");

		int intPageNo = 1;
		if (pageNo == null) {
			// 세션에서 Pager를 찾고, 있으면 pageNo를 설정하고,
			Pager pager = (Pager) session.getAttribute("mypage_inquiry_pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		int totalRows = inquiryService.getTotalMyRows(member_nickname);
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		session.setAttribute("mypage_inquiry_pager", pager);
		
		// 사방 문의게시판 가져오기
		List<Inquiry> inquiryList = inquiryService.getInquiryList(pager, member_nickname);

		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("member_nickname", member_nickname);
		return "mypage/userInquiry";
	}

	@PostMapping("/checkMember")
	public String checkMember(Member member) {
		logger.info("updateMember 메시지");
		memberService.updateMember(member);

		return "redirect:/mypage_memberInfo";
	}
	
	//회원 정보 수정
	@PostMapping("/updateMember")
	public String updateMember(Member member, Authentication auth) {
		logger.info("updateMember 메시지");
		Member originMember = memberService.showMember(auth.getName());

		if (member.getMember_pw().equals("")) {
			member.setMember_pw(originMember.getMember_pw());
			logger.info("member 비밀번호" + member.getMember_pw());
			logger.info("member 전화번호" + member.getMember_phone());
		} else {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			member.setMember_pw(bpe.encode(member.getMember_pw()));
		}
		if (member.getMember_phone().equals("")) {
			member.setMember_phone(originMember.getMember_phone());
			logger.info("member 비밀번호" + member.getMember_pw());
			logger.info("member 전화번호" + member.getMember_phone());
		}
		memberService.updateMember(member);

		return "redirect:/main";
	}
	
	//회원 탈퇴
	@PostMapping(value = "/deleteMember", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteMember(Authentication auth, HttpSession session) {
		
		logger.info("deleteMember 메시지");
		
		memberService.deleteMember(auth.getName());
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}

}
