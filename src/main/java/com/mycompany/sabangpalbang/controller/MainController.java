package com.mycompany.sabangpalbang.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.mycompany.sabangpalbang.dto.Palbang;
import com.mycompany.sabangpalbang.dto.Sabang;
import com.mycompany.sabangpalbang.service.PalbangService;
import com.mycompany.sabangpalbang.service.SabangService;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	private SabangService sabangService;
	@Autowired
	private PalbangService palbangService;
	
	//메인페이지 
	@GetMapping("/main")
	public String home(Model model) {
		logger.info("main 메시지");
		List<Sabang> slist = sabangService.showSabang();
		List<Palbang> plist = palbangService.showPalbang();
		model.addAttribute("slist", slist);
		model.addAttribute("plist", plist);
		return "main";
	}
	
	//광고페이지
	@GetMapping("/advertisePage")
	public String advertisePage(int adnum, Model model) {
		logger.info("advertisePage 메시지");
		model.addAttribute("adnum", adnum);
		return "advertisePage";
	}
	
	//인포페이지
	@GetMapping("/info")
	public String info() {
		logger.info("info 메시지");
		return "info";
	}
}
