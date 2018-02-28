package kr.or.ddit.service.lprod;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.lprod.ILprodDao;
import kr.or.ddit.dao.lprod.ILprodDaoImpl;

public class ILprodServiceImpl implements ILprodService {
	
	private static ILprodService service = new ILprodServiceImpl();
	private ILprodDao dao;
	private ILprodServiceImpl(){
		dao = ILprodDaoImpl.getInstance();
	}
	public static ILprodService getInstance() {
		return (service ==null)? service=new ILprodServiceImpl() : service;
	}
	

	@Override
	public List<String> lprodGuInfo() throws SQLException {
		return dao.lprodGuInfo();
	}

}
