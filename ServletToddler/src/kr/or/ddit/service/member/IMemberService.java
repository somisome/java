package kr.or.ddit.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
/**
 * @Class Name :IMemberService.java
 * @Description : Dao의 메서드를 통해 회원정보 CRUD
 * @Modification Information
 * @author 윤소미
 * @since  2018.02.19.
 * @version 1.0
 * @see 
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일    	    수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.19.  윤소미          최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IMemberService {
	public String NAME = "김은대";
//	public String PASS = "asdfasdf";
	/**
	 * IMemberDao의 getMemberInfo()메서드를 통해 회원 정보를 취득
	 * @param params 아이디와 패스워드로 구성된 map
	 * @return  memberInfo 해당 아이디와 패스워드에 매칭되는 회원의 정보
	 */
	public MemberVO getMemberInfo(Map<String, String> params);
	/**
	 * IMemberDao의 getMemberList()메서드를 통해 모든회원(회원정보)의 리스트를 취득
	 * @return  memberList 모든 회원의 MemberVO로 이루어진 List
	 */
	public List<MemberVO> getMemberList();
	
	/**
	 * IMemberDao의 insertMemberInfo()메서드를 통해 회원을 추가
	 * @param memberInfo 새로이 추가할 회원의 정보
	 * @return  returnValue 추가성공여부
	 */
	public String insertMemberInfo(MemberVO memberInfo);
	/**
	 * IMemberDao의 deleteMemberInfo()메서드를 통해 회원을 비활성화
	 * @param params "mem_id"와 회원의 아이디로 이루어진 map
	 */
	public void deleteMemberInfo(Map<String, String> params);
	/**
	 * IMemberDao의 updateMemberInfo()메서드를 통해 회원정보수정
	 * @param memberInfo 수정하고자하는 회원의 정보
	 */
	public void updateMemberInfo(MemberVO memberInfo);
}
