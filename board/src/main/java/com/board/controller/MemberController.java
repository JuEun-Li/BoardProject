package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/* BCryptPasswordEncoder 추가 */
	@Inject
	private BCryptPasswordEncoder passEncoder;

	@Inject
	MemberService service;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post register");

		/* service.register(vo); */

		int msg = service.idCheck(vo);

		System.out.println("중복은 1 아니면 0 = " + msg );
		if(msg == 1) {
			rttr.addFlashAttribute("result", "registerFalse");
			return "/member/register";
		} else if(msg == 0) {
			/*
			 * String PlaintextPassword = vo.getUserPass(); String encryptionPassword =
			 * pwdEncoder.encode(PlaintextPassword); vo.setUserPass(encryptionPassword);
			 */
			String inputPass = vo.getUserPass();
			String pass = passEncoder.encode(inputPass);
			vo.setUserPass(pass);

			service.register(vo);
			rttr.addFlashAttribute("result", "registerOK");
		}

		return "redirect:/";

	}

	// 로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			logger.info("post login");

			HttpSession session = req.getSession();
			MemberVO login = service.login(vo);

			// matches() 메소드는 입력한 패스워드와 저장된 패스워드 비교
			boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());

			// 아이디와 매칭되는 데이터가 있고, 입력한 패스워드가 저장된 패스워드와 일치 될 경우 if문 실행
			if(login != null && passMatch) {

				session.setAttribute("member", login);

			} else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			}

			 /* if (login == null) {
				  session.setAttribute("member", null);
				  rttr.addFlashAttribute("msg", false);
			  } else {
				  session.setAttribute("member", login);
			  	}*/


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

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO vo) throws Exception{
		int result = service.idCheck(vo);
		return result;
	} // idCheck() 종료

	// 회원 탈퇴 get
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public void getWithdrawal() throws Exception {
		logger.info("get withdrawal");
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		 logger.info("post withdrawal");

		 MemberVO member = (MemberVO)session.getAttribute("member");
		 MemberVO login = service.login(vo);

		 String oldPass = member.getUserPass();
		 String newPass = vo.getUserPass();

		 	// matches() 메소드는 입력한 패스워드와 저장된 패스워드 비교
			boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());

			// 기존 아이디와 입력한 아이디가 동일하고, 입력한 패스워드가 저장된 패스워드와 일치 될 경우 if문 실행
			if(oldPass.equals(newPass) && passMatch) {

				service.withdrawal(vo);
				session.invalidate();

				 return "redirect:/";

			} else {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/withdrawal";
			}


			/*
			 * if(!(oldPass.equals(newPass))) { rttr.addFlashAttribute("msg", false); return
			 * "redirect:/member/withdrawal"; }
			 *
			 * service.withdrawal(vo);
			 *
			 * session.invalidate();
			 */

			/* return "redirect:/"; */
	}

}