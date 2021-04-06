package com.mycompany.sabangpalbang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

		/*
		 * logger.info("id" + checkmember.getMember_id() + " : " +
		 * member.getMember_id()); logger.info("email" + checkmember.getMember_email() +
		 * " : " + member.getMember_email()); logger.info("pw" +
		 * checkmember.getMember_pw() + " : " + member.getMember_pw());
		 * logger.info(""+bpe.matches(checkmember.getMember_pw(),
		 * member.getMember_pw()));
		 */
		if ((checkmember.getMember_id() == member.getMember_id())
				&& (checkmember.getMember_email().equals(member.getMember_email()))
				&& (bpe.matches(checkmember.getMember_pw(), member.getMember_pw()))) {

			model.addAttribute("member", member);
			return "mypage/mypage_memberInfo";
		}else {
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

		// db select
		List<OrderMain> myOrderList = memberService.getOrderListById(pager, order_memberid);

		model.addAttribute("myOrderSize", myOrderList.size());
		model.addAttribute("myOrderList", myOrderList);
		return "mypage/mypage_orderlist";
	}

	@GetMapping("/mypage_inquiry")
	public String mypage_inquiry(Authentication auth, Model model, String pageNo, HttpSession session) {
		logger.info("inquirylist 메시지");
		String userNickName = auth.getName();
		model.addAttribute("userNickName", userNickName);
		logger.info(userNickName);
		String anickname = memberService.getByInquiryNickname(auth.getName());
		logger.info(anickname);
		model.addAttribute("anickname", anickname);

		return "mypage/mypage_inquiry";
	}

	
	@GetMapping("/userInquiryList")
	public String userInquiryList(String anickname, Model model, String pageNo, HttpSession session) {
		logger.info("userInquiryList 메시지");
		logger.info(anickname);

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

		int totalRows = inquiryService.getTotalMyRows(anickname);
		Pager pager = new Pager(10, 5, totalRows, intPageNo);
		// 사방 문의게시판 가져오기
		List<Inquiry> inquiryList = inquiryService.getInquiryList(pager, anickname);

		session.setAttribute("mypage_inquiry_pager", pager);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("anickname", anickname);
		return "mypage/userInquiry";
	}

	@PostMapping("/checkMember")
	public String checkMember(Member member) {
		logger.info("updateMember 메시지");
		logger.info("member 비밀번호" + member.getMember_phone());
		memberService.updateMember(member);

		return "redirect:/mypage_memberInfo";
	}

	@PostMapping("/updateMember")
	public String updateMember(Member member) {
		logger.info("updateMember 메시지");
		logger.info("member 비밀번호" + member.getMember_phone());
		memberService.updateMember(member);

		return "redirect:/mypage_memberInfo";
	}

}
