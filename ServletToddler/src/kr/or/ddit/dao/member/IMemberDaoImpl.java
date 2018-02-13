package kr.or.ddit.dao.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		return (dao == null)? dao = new IMemberDaoImpl() : dao;
	}	
	
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return client.queryForList("member.memberList");
	}

	@Override
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		return (String) client.insert("member.insertMemberInfo", memberInfo);
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException {
		client.update("member.updateMemberInfo", memberInfo);
	}

}
