package kr.or.ddit.dao.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dao.member.IMemberDao;
import kr.or.ddit.dao.member.IMemberDaoImpl;
import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

public class IProdDaoImpl implements IProdDao {
	
	private static IProdDao dao = new IProdDaoImpl();
	private SqlMapClient client;
	private IProdDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IProdDao getInstance() {
		return (dao == null)? dao = new IProdDaoImpl() : dao;
	}	
	
	@Override
	public ProdVO getProdInfo(Map<String, String> params) throws SQLException {
		return (ProdVO) client.queryForObject("prod.prodInfo", params);
	}

	@Override
	public List<ProdVO> getProdList() throws SQLException {
		return client.queryForList("prod.prodList");
	}

	@Override
	public String insertProdInfo(ProdVO prodInfo) throws SQLException {
		return (String) client.insert("prod.insertProdInfo", prodInfo);
	}

	@Override
	public void deleteProdInfo(Map<String, String> params) throws SQLException {
		client.update("prod.deleteProdInfo", params);
	}

	@Override
	public void updateProdInfo(ProdVO prodInfo) throws SQLException {
		client.update("prod.updateProdInfo", prodInfo);
	}
	
	@Override
	public HashMap<String, Object> prodInfoMap(Map<String, String> params)
			throws SQLException {
		return (HashMap<String, Object>) client.queryForObject("prod.prodInfoMap", params);
	}
	@Override
	public List<String> prodLguInfo() throws SQLException {
//		return client.queryForList("prod.prodLguInfo");
		return client.queryForList("lprod.lprodGuInfo");
	}
	@Override
	public List<String> prodBuyerInfo() throws SQLException {
//		return client.queryForList("prod.prodBuyerInfo");
		return client.queryForList("buyer.buyerIdInfo");
	}

	
}
