package kr.or.ddit.service.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.member.IMemberDao;
import kr.or.ddit.dao.member.IMemberDaoImpl;
import kr.or.ddit.dao.prod.IProdDao;
import kr.or.ddit.dao.prod.IProdDaoImpl;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService {
	
	private static IProdService service = new IProdServiceImpl();
	private IProdDao dao;
	private IProdServiceImpl(){
		dao = IProdDaoImpl.getInstance();
	}
	public static IProdService getInstance() {
		return (service ==null)? service=new IProdServiceImpl() : service;
	}
	
	@Override
	public ProdVO getProdInfo(Map<String, String> params) throws SQLException {
		return dao.getProdInfo(params);
	}

	@Override
	public List<ProdVO> getProdList() throws SQLException {
		return dao.getProdList();
	}

	@Override
	public String insertProdInfo(ProdVO prodInfo) throws SQLException {
		return dao.insertProdInfo(prodInfo);
	}

	@Override
	public void deleteProdInfo(Map<String, String> params) throws SQLException {
		dao.deleteProdInfo(params);
	}

	@Override
	public void updateProdInfo(ProdVO prodInfo) throws SQLException {
		dao.updateProdInfo(prodInfo);
	}
	@Override
	public HashMap<String, Object> prodInfoMap(Map<String, String> params)
			throws SQLException {
		return dao.prodInfoMap(params);
	}
	@Override
	public List<String> prodLguInfo() throws SQLException {
		return dao.prodLguInfo();
	}
	@Override
	public List<String> prodBuyerInfo() throws SQLException {
		return dao.prodBuyerInfo();
	}


}
