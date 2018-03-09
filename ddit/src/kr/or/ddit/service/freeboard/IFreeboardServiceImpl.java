package kr.or.ddit.service.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.freeboard.IFreeboardDao;
import kr.or.ddit.dao.freeboard.IFreeboardDaoImpl;
import kr.or.ddit.vo.FreeboardVO;

public class IFreeboardServiceImpl implements IFreeboardService {
	private static IFreeboardService service = new IFreeboardServiceImpl();
	private IFreeboardDao dao;
	private IFreeboardServiceImpl(){
		dao = IFreeboardDaoImpl.getInstance();
	}
	
	public static IFreeboardService getInstance(){
		return (service==null)? service = new IFreeboardServiceImpl() : service;
	}
	
	
	@Override
	public FreeboardVO getFreeboardInfo(Map<String, String> params) {
		FreeboardVO freeboardInfo = null;
		try {
			freeboardInfo = dao.getFreeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public List<FreeboardVO> getFreeboardList() {
		List<FreeboardVO> freeboardList = null;
		try {
			freeboardList= dao.getFreeboardList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo) {
		String res = null;
		try {
			res = dao.insertFreeboardInfo(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) {
		try {
			dao.updateFreeboardInfo(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params) {
		try {
			dao.deleteFreeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
