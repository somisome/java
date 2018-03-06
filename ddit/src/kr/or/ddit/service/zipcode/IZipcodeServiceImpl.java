package kr.or.ddit.service.zipcode;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.zipcode.IZipcodeDao;
import kr.or.ddit.dao.zipcode.IZipcodeDaoImpl;
import kr.or.ddit.vo.ZipcodeVO;

public class IZipcodeServiceImpl implements IZipcodeService {
	
	private static IZipcodeService service = new IZipcodeServiceImpl();
	
	private IZipcodeDao dao;
	
	private IZipcodeServiceImpl(){
		dao = IZipcodeDaoImpl.getInstance();
	}
	
	public static IZipcodeService getInstance(){
		return (service == null) ? service = new IZipcodeServiceImpl() : service;
	}
	
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException{
		List<ZipcodeVO> zipcodeList = null;
		try {
			zipcodeList = dao.getZipcodeList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipcodeList;
	}

}
