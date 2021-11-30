package com.project.grocery.dao;

import com.project.grocery.vo.MemberVO;

public interface MemberMapper {
	//회원가입
	public int insertMember(MemberVO member) throws Exception;
	
	//로그인
	public MemberVO selectMember(MemberVO member) throws Exception;

	//개인정보 업데이트
	public int updateMember(MemberVO member) throws Exception;
}
