package com.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 현재 페이지에서 번역 하도록 매칭
	 */
	@RequestMapping(value = "/i18n.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

//		model.addAttribute("serverTime", formattedDate );

		return "redirect:/board/listPageSearch?num=1";
	}

//	홈 화면 띄우기용
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

//		model.addAttribute("serverTime", formattedDate );

		return "home";
	}


	/*
	 * @RequestMapping(value="/i18n.do", method = RequestMethod.GET) public String
	 * i18n(Locale locale, HttpServletRequest request, Model model) {
	 * logger.info("site.board : {}", messageSource.getMessage("site.board", null,
	 * "default text", locale)); logger.info("site.num : {}",
	 * messageSource.getMessage("site.num", null, "default text", locale));
	 * logger.info("site.title : {}", messageSource.getMessage("site.title", null,
	 * "default text", locale)); logger.info("site.date : {}",
	 * messageSource.getMessage("site.date", null, "default text", locale));
	 * logger.info("site.writer : {}", messageSource.getMessage("site.writer", null,
	 * "default text", locale)); logger.info("site.count : {}",
	 * messageSource.getMessage("site.count", null, "default text", locale));
	 *
	 * return "i18n"; }
	 */
}
