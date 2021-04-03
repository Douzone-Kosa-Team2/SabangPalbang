package com.mycompany.sabangpalbang.controller;

import java.io.File;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
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

	// 팔방페이지 - 좋아요 순 (디폴트)
	@GetMapping("/palbang_main")
	public String palbang_main(@RequestParam(defaultValue = "0") String std, String pageNo, Model model,
			HttpSession session) {
		logger.info("palbang 메시지");

		int intPageNo = 1;
		if (pageNo == null) { // 클라이언트에서 pageNo가 넘어오지 않앗을때
			// 세션에서 Pager를 찾고 PageNo를 설정
			Pager pager = (Pager) session.getAttribute("palbang_pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		// 없으면 Pager를 세션에 저장
		int totalRows = palbangService.getTotalRows();
		Pager pager = new Pager(6, 5, totalRows, intPageNo);
		session.setAttribute("palbang_pager", pager);

		// 정렬 기준
		List<Palbang> list = palbangService.getPalbangList_Like(pager);
		if (std.equals("0")) {
			list = palbangService.getPalbangList_Like(pager);
		} else if (std.equals("1")) {
			list = palbangService.getPalbangList_View(pager);
		} else if (std.equals("2")) {
			list = palbangService.getPalbangList_New(pager);
		} else {
			list = palbangService.getPalbangList_Old(pager);
		}

		model.addAttribute("list", list);
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
	public String palbang_detail(int pid, Authentication auth, Model model) {
		logger.info("palbang_detail 메시지");
		// 팔방 게시물 조회수 1 증가 
		palbangService.addViewCount(pid); 	
		Palbang palbang = palbangService.getPalbang(pid);
		List<Palbang_detail> palbanglist = palbangService.getPalbangDetail(pid);
		String email = memberService.getEmailByNickname(palbang.getPalbang_nickname()); // 팔방 작성자 
		
		if(auth != null && auth.getName().equals(email)) {
			model.addAttribute("email", 1); // 로그인유저 == 팔방 작성자 
		}else {
			model.addAttribute("email", 0); // 로그인유저 != 팔방 작성자 
		}
		model.addAttribute("palbang", palbang);
		model.addAttribute("palbanglist", palbanglist);

		return "palbang/palbang_detail";
	}
	
	@PostMapping(value = "/isLikeBtnClick", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String isLikeBtnClick(int palbang_id, Authentication auth) {
		logger.info("likeUp 메시지");

		int likeResult = 0;
		if(auth != null) { 
			int member_id = memberService.getIdByEmail(auth.getName());
			likeResult = palbangService.isLikeByUser(palbang_id, member_id); // 로그인유저가 좋아요 클릭 했는지 여부 
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", likeResult);
		logger.info("likeResult: " + likeResult);
		
		return jsonObject.toString();
	}

	@PostMapping(value = "/likeUp", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String likeUp(int palbang_id, Authentication auth) {
		logger.info("likeUp 메시지");
		String member_email = auth.getName();
		logger.info("현재 로그인한 유저: " + member_email);

		int member_id = memberService.getIdByEmail(member_email);
		palbangService.insertLike(palbang_id, member_id);
		palbangService.updateLikeCountUp(palbang_id);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}

	@PostMapping(value = "/likeDown", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String likeDown(int palbang_id, Authentication auth) {
		logger.info("likeDown 메시지");
		String member_email = auth.getName();
		logger.info("현재 로그인한 유저: " + member_email);
		
		int member_id = memberService.getIdByEmail(member_email);
		palbangService.deleteLike(palbang_id, member_id);
		palbangService.updateLikeCountDown(palbang_id);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}

	@PostMapping(value = "/addPalbang", produces = "application/json;charset=UTF-8")
	public String addPalbang(Palbang palbang, Authentication auth) {
		
		/*  팔방 대표 이미지 */
		MultipartFile pattach = palbang.getPattach();
		if (!pattach.isEmpty()) {
			logger.info("팔방 대표 이미지 첨부가 있음");
			palbang.setPalbang_imgoname(pattach.getOriginalFilename());
			palbang.setPalbang_imgtype(pattach.getContentType());
			String saveName = new Date().getTime() + "-" + palbang.getPalbang_imgoname();
			palbang.setPalbang_imgsname(saveName);
			
			logger.info("팔방 대표이미지 : " + palbang.getPalbang_imgoname());

			File file = new File(
					"/Users/homecj/dev/workspace/sts/Douzone/uploadfiles/" + palbang.getPalbang_imgsname());
			try {
				pattach.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {                                                                       
			logger.info("팔방 대표 이미지 첨부가 없음");
		}
		palbang.setPalbang_nickname(memberService.getByInquiryNickname(auth.getName()));
		
		/* 팔방 디테일 리뷰 이미지 - 최소 1개 ~ 3개 */
		for(int i=0; i<palbang.getReviews().size(); i++) {
			MultipartFile pdattach = palbang.getReviews().get(i).getPdattach();
			if(!pdattach.isEmpty()) {
				logger.info(i + "번째 리뷰 이미지 첨부 ");
				palbang.getReviews().get(i).setPalbang_id(palbang.getPalbang_id()); // 이미 시퀀스키가 세팅되어있음 
				palbang.getReviews().get(i).setPalbang_dimgoname(pdattach.getOriginalFilename());
				palbang.getReviews().get(i).setPalbang_dimgtype(pdattach.getContentType());
				String saveName = new Date().getTime() + "-" + palbang.getReviews().get(i).getPalbang_dimgoname();
				palbang.getReviews().get(i).setPalbang_dimgsname(saveName);
		
				File file = new File(
						"/Users/homecj/dev/workspace/sts/Douzone/uploadfiles/" + palbang.getReviews().get(i).getPalbang_dimgsname());
				try {
					pattach.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {                                                                       
				logger.info("팔방 리뷰 이미지 첨부가 없음");
			}
		}
		 // DB insert - 팔방디테일
		palbangService.savePalbang(palbang);
		
		// 두 테이블에 insert가 제대로 되었다면 리다이렉트해서 작성한 디테일 페이지 보여주기 
		return "redirect:/palbang_detail?pid="+palbang.getPalbang_id();
	}
}
