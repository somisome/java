package kr.or.ddit.service.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.buyer.IBuyerDao;
import kr.or.ddit.dao.buyer.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService {
	
	//service
	private static IBuyerService service = new IBuyerServiceImpl();
	//dao
	private IBuyerDao dao;
	//constructor
	private IBuyerServiceImpl(){
		dao=IBuyerDaoImpl.getInstance();
	}
	//getInstance() method for Singleton
	public static IBuyerService getInstance(){
		return (service==null)? service=new IBuyerServiceImpl() : service;
	}
	
	
	@Override
	public BuyerVO getBuyerInfo(Map<String, String> params) throws SQLException {
		return dao.getBuyerInfo(params);
	}

	@Override
	public List<BuyerVO> getBuyerList() throws SQLException {
		return dao.getBuyerList();
	}

	@Override
	public String insertBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		return dao.insertBuyerInfo(buyerInfo);
	}

	@Override
	public void deleteBuyerInfo(Map<String, String> params) throws SQLException {
		dao.deleteBuyerInfo(params);
	}

	@Override
	public void updateBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		dao.updateBuyerInfo(buyerInfo);
	}
	@Override
	public List<String> getBuyerIdInfo() throws SQLException {
		return dao.getBuyerIdInfo();
	}
	@Override
	public List<String> getBuyerLguInfo() throws SQLException {
		return dao.getBuyerLguInfo();
	}

}
