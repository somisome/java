package kr.or.ddit.service.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.member.IMemberDao;
import kr.or.ddit.dao.member.IMemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {
	
	private static IMemberService service = new IMemberServiceImpl();
	
	private IMemberDao dao;
	
	private IMemberServiceImpl(){
		dao = IMemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		return (service ==null)? service=new IMemberServiceImpl() : service;
		
//		if(service==null){
//			service = new IMemberServiceImpl();
//		}
//		return service;
	}
	
	
	

	@Override
	public MemberVO getMemberInfo(Map<String, String> params){
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.getMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}
	
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.getMemberList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public String insertMemberInfo(MemberVO memberInfo) {
		String result = null;
		try {
			result= dao.insertMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) {
		try {
			dao.updateMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
