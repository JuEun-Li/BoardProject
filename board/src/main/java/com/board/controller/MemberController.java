package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");

		service.register(vo);

		return "redirect:/";

	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession();

		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}

		return "redirect:/";
	}

	// 로그아웃 - 디비 연결 필요없음
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");

		session.invalidate(); // 현재 가진 세션 값 제거

		return "redirect:/";
	}

	// 회원수정 수정 get
	@RequestMapping(value = "/modify_pass", method = RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get modify_pass");
	}

	// 회원 수정 post
	@RequestMapping(value = "/modify_pass", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
		logger.info("post modify_pass");

		service.modify_pass(vo);

		session.invalidate(); // 비밀 번호 수정 시 이 코드에 의해 현재 세션이 제거 - 로그아웃 됨.

		return "redirect:/";
	}
}