package kr.or.ddit.dao.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

/**
 * @Class Name :IMemberDao.java
 * @Description : sqlMapClient를 통해 회원정보 CRUD할 수 있게하는 메서드가 정의된 인터페이스
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
public interface IMemberDao {
	/**
	 * sqlMapClient의 member.memberInfo 쿼리 질의를 통해 회원 정보를 취득
	 * @param params 아이디와 패스워드로 구성된 map
	 * @return  (MemberVO) client.queryForObject("member.memberInfo", params) 해당 아이디와 패스워드에 매칭되는 회원의 정보
	 */
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	/**
	 * sqlMapClient의 member.memberList 쿼리 질의 통해 모든회원(회원정보)의 리스트를 취득
	 * @return client.queryForList("member.memberList") 모든 회원의 MemberVO로 이루어진 List
	 */
	public List<MemberVO> getMemberList() throws SQLException;
	/**
	 * sqlMapClient의 member.insertMemberInfo 쿼리 질의를 통해 회원을 추가
	 * @param memberInfo 새로이 추가할 회원의 정보
	 * @return  (String) client.insert("member.insertMemberInfo", memberInfo)
	 */
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	/**
	 * sqlMapClient의 member.deleteMemberInfo 쿼리 질의를 통해 회원을 비활성화
	 * @param params "mem_id"와 회원의 아이디로 이루어진 map
	 */
	public void deleteMemberInfo(Map<String, String> params) throws SQLException;
	/**
	 * sqlMapClient의 member.updateMemberInfo 쿼리 질의를 통해 회원정보수정
	 * @param memberInfo 수정하고자하는 회원의 정보
	 */
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException;
}
