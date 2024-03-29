package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원 가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 회원정보 수정
	@Override
	public void modify_pass(MemberVO vo) throws Exception {
		dao.modify_pass(vo);
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO vo) throws Exception {
		int result = dao.idCheck(vo);
		return result;
	}

	// 회원 탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		dao.withdrawal(vo);
	}
}
