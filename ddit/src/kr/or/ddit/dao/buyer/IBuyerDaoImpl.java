package kr.or.ddit.dao.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerDaoImpl implements IBuyerDao {
	
	
	//dao
	private static IBuyerDao dao = new IBuyerDaoImpl();
	//client
	private SqlMapClient client;
	//constructor
	private IBuyerDaoImpl(){
		client=SqlMapClientFactory.getSqlMapClient();
	}
	//getInstance() method for Singleton
	public static IBuyerDao getInstance(){
		return (dao==null)? dao = new IBuyerDaoImpl() : dao;
	}
	
	
	@Override
	public BuyerVO getBuyerInfo(Map<String, String> params) throws SQLException {
		return (BuyerVO) client.queryForObject("buyer.buyerInfo",params);
	}

	@Override
	public List<BuyerVO> getBuyerList() throws SQLException {
		return client.queryForList("buyer.buyerList");
	}

	@Override
	public String insertBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		return (String) client.insert("buyer.insertBuyerInfo", buyerInfo);
	}

	@Override
	public void deleteBuyerInfo(Map<String, String> params) throws SQLException {
		client.update("buyer.deleteBuyerInfo", params);
	}

	@Override
	public void updateBuyerInfo(BuyerVO buyerInfo) throws SQLException {
		client.update("buyer.updateBuyerInfo", buyerInfo);
	}
	@Override
	public List<String> getBuyerIdInfo() throws SQLException {
		return client.queryForList("buyer.buyerIdInfo");
	}
	@Override
	public List<String> getBuyerLguInfo() throws SQLException {
		return client.queryForList("buyer.buyerLguInfo");
	}

}
