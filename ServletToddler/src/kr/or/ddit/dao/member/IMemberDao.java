package kr.or.ddit.dao.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> getMemberList() throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public void deleteMemberInfo(Map<String, String> params) throws SQLException;
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException;
}
