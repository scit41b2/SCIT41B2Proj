package com.project.grocery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.grocery.vo.MemberVO;

@Repository
public class MemberRepository {
	
	@Autowired
	SqlSession session;

	public int signup(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.insertMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberVO login(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO result = null;
		try {
			result = mapper.selectMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int accupdate(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.updateMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
