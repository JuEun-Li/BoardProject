package com.board.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Resource(name="uploadPath")
	  private String uploadPath;

	  private static final Logger logger =
	  LoggerFactory.getLogger(BoardController.class);


	  @Autowired private SessionLocaleResolver localeResolver; // jpa 가 기본 메소드를 만들어서 멤버 변수 대입. 사용하기만 하면 된다.

	  @Autowired private MessageSource messageSource;
	  // message-context.xml 에 선언되어있는 bean id 값

	@Inject
	BoardService service;

	@Inject
	ReplyService replyService;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		logger.info("get write");

		Object loginInfo = session.getAttribute("member");

		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo, HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		// 파일 업로드 처리

		String fileName=null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
				UUID uuid = UUID.randomUUID();	//UUID 구하기
				fileName=uuid+"."+ext;
				uploadFile.transferTo(new File("C:\\sts-file\\" + fileName));

				// 실행파일 막기
				if(fileName.endsWith(".exe")||fileName.endsWith(".bin")||
						fileName.endsWith(".com")||fileName.endsWith(".cmd")) {
					throw new ServletException("에러");
				}
			}

		vo.setFileName(fileName);
		service.write(vo);

		System.out.println("write - getfilename=" + vo.getFileName());
		System.out.println("write - getuploadfilename=" +vo.getUploadFile());
		System.out.println("write - getoriginal filename=" +uploadFile.getOriginalFilename());

		return "redirect:/board/listPageSearch?num=1";
	}

	// 게시물 조회 - 댓글 조회도 같이
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno,
			@ModelAttribute("page") Page page, Model model, BoardVO vo) throws Exception {

		vo = service.view(bno);

		model.addAttribute("view", vo);
		model.addAttribute("page", page);


		System.out.println("view - getfilename=" + vo.getFileName()); // 첨부파일
		System.out.println("view - getupload=" + vo.getUploadFile()); // 이미지 업로드 파일

		// 댓글 조회
		List<ReplyVO> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply", reply);
	}

	// 게시물 수정 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno,
			@ModelAttribute("page") Page page, Model model) throws Exception {

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
		model.addAttribute("page", page);
	}

	// 게시물 수정 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo,
			@ModelAttribute("page") Page page, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {

		String fileName=null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\sts-file\\" + fileName));

			// 실행파일 막기
			if(fileName.endsWith(".exe")||fileName.endsWith(".bin")||
					fileName.endsWith(".com")||fileName.endsWith(".cmd")) {
						throw new ServletException("에러");
					}
		}

		vo.setFileName(fileName);
		service.modify(vo);

		rttr.addAttribute("searchType", page.getSearchType());
		rttr.addAttribute("keyword", page.getKeyword());

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno,
			@ModelAttribute("page") Page page, RedirectAttributes rttr) throws Exception {

		service.delete(bno);

		rttr.addAttribute("searchType", page.getSearchType());
		rttr.addAttribute("keyword", page.getKeyword());

		return "redirect:/board/listPageSearch?num=1";
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}

	// 게시물 목록 + 페이징 추가 + 검색
		@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
		public void getListPageSearch(Model model, @RequestParam("num") int num,
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
				) throws Exception {

			Page page = new Page();

			int count = service.count(); // 총 게시물 갯수

			page.setNum(num);
//			page.setCount(service.count());
			page.setCount(service.searchCount(searchType, keyword));

			// 검색 타입과 검색어
//			page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);

			List<BoardVO> list = null;
			// list = service.listPage(page.getDisplayPost(), page.getPostNum());
			list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			model.addAttribute("count", count); // 총 게시물 갯수 관련

//			model.addAttribute("searchType", searchType);
//			model.addAttribute("keyword", keyword);
		}


}