package com.mycompany.sabangpalbang.controller;

import java.io.Writer;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.sabangpalbang.dto.Member;
import com.mycompany.sabangpalbang.service.MemberService;

@Controller
public class AuthController {

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;

	// 로그인페이지 form
	@GetMapping("/loginForm")
	public String loginForm(HttpServletRequest request, HttpServletResponse response) {
		logger.info("loginForm 메시지");
		String ajaxHeader = request.getHeader("X-Requested-With");
		logger.info("ajaxHeader: " + ajaxHeader);
		if (ajaxHeader == null) {
			return "auth/loginForm";
		} else { // AJAX 요청 - JSON Body를 응답해야 한다.
			response.setContentType("application/json;charset=UTF-8");
			JSONObject jObj = new JSONObject();
			jObj.put("result", "goLogin");
			try {
				Writer writer = response.getWriter();
				writer.write(jObj.toString());
				writer.flush();
				writer.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	}

	@GetMapping("/signinForm")
	public String signinForm() {
		logger.info("signinForm 메시지");
		return "auth/signinForm";
	}

	@PostMapping("/signin_successForm")
	public String signin_successForm() {
		logger.info("signin_successForm 메시지");
		return "auth/signin_successForm";
	}

	@GetMapping("/findEmailForm")
	public String findEmailForm() {
		logger.info("findEmailForm 메시지");
		return "auth/findEmailForm";
	}

	@GetMapping("/resetPwForm")
	public String resetPwForm() {
		logger.info("resetPwForm 메시지");
		return "auth/resetPwForm";
	}

	// 동작 부분

	// 회원가입
	@PostMapping("/signin")
	public String signin(Member member) {
		logger.info(member.getMember_email());
		logger.info(member.getMember_email2());
		logger.info(member.getMember_pw());
		logger.info(member.getMember_name());
		logger.info(member.getTel_pre());
		logger.info(member.getTel_suf());
		logger.info(member.getMember_nickname());

		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		member.setMember_pw(bpe.encode(member.getMember_pw()));

		member.setMember_email(member.getMember_email() + "@" + member.getMember_email2());
		member.setMember_phone(member.getTel_pre() + member.getTel_suf());
		logger.info(member.getMember_email());
		logger.info(member.getMember_pw());
		logger.info(member.getMember_phone());

		memberService.signin(member);

		return "redirect:/loginForm";
	}

	// 이메일 중복 체크
	@PostMapping(value = "/checkEmail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkEmail(String email) {
		logger.info(email);
		Boolean result = memberService.isCheckedEmail(email);
		JSONObject jsonObject = new JSONObject();
		if (result == true) {
			jsonObject.put("resultEmail", "success");
			return jsonObject.toString();
		} else {
			jsonObject.put("resultEmail", "fail");
			return jsonObject.toString();
		}
	}

	// 닉네임 중복 체크
	@PostMapping(value = "/checkNickname", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkNickname(String nickname) {
		logger.info(nickname);
		Boolean result = memberService.isCheckedNickname(nickname);
		JSONObject jsonObject = new JSONObject();
		if (result == true) {
			jsonObject.put("resultNickname", "success");
			return jsonObject.toString();
		} else {
			jsonObject.put("resultNickname", "fail");
			return jsonObject.toString();
		}
	}

	// 아이디 찾기
	@PostMapping("/findEmailDo")
	public String findEmailDo(String member_name, String member_phone, Model model) {
		
		try {
			Member member = memberService.findEmail(member_name, member_phone);
			model.addAttribute("member_email", member.getMember_email());
			model.addAttribute("member_nickname", member.getMember_nickname());
			return "auth/findEmail_successForm"; // 찾으면
		} catch(Exception e){
			logger.warn("Not find member");
		}
		
		return "redirect:/findEmailForm";
	}

	// 비밀번호 재설정
	@PostMapping("/findPwdDo")
	public String findPwdDo(String member_email, String member_name, String member_phone, Model model) {
		
		try {
					// 비밀번호 찾기 이후 필요한 값 찾기
			Member member = memberService.findPwd(member_email, member_name, member_phone);

			model.addAttribute("member_email", member.getMember_email());
			model.addAttribute("member_nickname", member.getMember_nickname());

			// 비밀번호 재설정 후 디비에 저장
			String resetPw = memberService.resetPwd(member_email);
			logger.info(resetPw);
			
			// 이메일 보내주기 
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

				messageHelper.setFrom("projectforjhl@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(member_email); // 받는사람 이메일
				messageHelper.setSubject("사방 팔방 새로운 비밀번호"); // 메일제목은 생략이 가능하다
				messageHelper.setText("새로운 비밀번호는 "+ resetPw +" 입니다."); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		
			return "auth/resetPw_successForm"; // 찾으면
			
		} catch(Exception e){
			logger.warn("Not find member");
		}
		return "redirect:/resetPwForm"; // 못찾으면
	}

	// 권한 오류 페이지
	@GetMapping("/auth/error403")
	public String error403() {
		return "auth/error403";
	}

}
