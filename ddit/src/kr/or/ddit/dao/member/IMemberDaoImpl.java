package kr.or.ddit.dao.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
/**
 * @Class Name :IMemberDaoImpl.java
 * @Description : sqlMapClient를 통해 DB의 회원정보 CRUD
 * @Modification Information
 * @author 윤소미
 * @since  2018.02.21.
 * @version 1.0
 * @see 
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일    	    수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  윤소미          최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	/**
	 * 싱글톤을 위한 getInstance()메서드 
	 * @return dao, new IMemberDaoImpl()
	 */
	public static IMemberDao getInstance() {
		return (dao == null)? dao = new IMemberDaoImpl() : dao;
	}	
	
	/**
	 * sqlMapClient의 member.memberInfo 쿼리 질의를 통해 회원 정보를 취득
	 * @param params 아이디와 패스워드로 구성된 map
	 * @return  (MemberVO) client.queryForObject("member.memberInfo", params) 해당 아이디와 패스워드에 매칭되는 회원의 정보
	 */
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}
	
	/**
	 * sqlMapClient의 member.memberList 쿼리 질의 통해 모든회원(회원정보)의 리스트를 취득
	 * @return client.queryForList("member.memberList") 모든 회원의 MemberVO로 이루어진 List
	 */
	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		return client.queryForList("member.memberList");
	}
	/**
	 * sqlMapClient의 member.insertMemberInfo 쿼리 질의를 통해 회원을 추가
	 * @param memberInfo 새로이 추가할 회원의 정보
	 * @return  (String) client.insert("member.insertMemberInfo", memberInfo)
	 */
	@Override
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		return (String) client.insert("member.insertMemberInfo", memberInfo);
	}
	/**
	 * sqlMapClient의 member.deleteMemberInfo 쿼리 질의를 통해 회원을 비활성화
	 * @param params "mem_id"와 회원의 아이디로 이루어진 map
	 */
	@Override
	public void deleteMemberInfo(Map<String, String> params)
			throws SQLException {
		client.update("member.deleteMemberInfo", params);
	}
	/**
	 * sqlMapClient의 member.updateMemberInfo 쿼리 질의를 통해 회원정보수정
	 * @param memberInfo 수정하고자하는 회원의 정보
	 */
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException {
		client.update("member.updateMemberInfo", memberInfo);
	}
}
