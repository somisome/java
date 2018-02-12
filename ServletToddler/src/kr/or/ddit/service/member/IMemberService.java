package kr.or.ddit.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	public String NAME = "김은대";
//	public String PASS = "asdfasdf";
	public MemberVO getMemberInfo(Map<String, String> params);
	public List<MemberVO> getMemberList();
	public String insertMemberInfo(MemberVO memberInfo);
	public void deleteMemberInfo(Map<String, String> params);
	public void updateMemberInfo(MemberVO memberInfo);
}
