package com.board.service;

import com.board.domain.MemberVO;

public interface MemberService {

	// 회원 가입
	public void register(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;

	// 회원정보 수정
	public void modify_pass(MemberVO vo) throws Exception;

	// 아이디 중복 검사
	public int idCheck(MemberVO vo) throws Exception;

	// 회원 탈퇴
	public void withdrawal(MemberVO vo) throws Exception;
}
