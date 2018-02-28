package kr.or.ddit.dao.lprod;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ILprodDaoImpl implements ILprodDao {
	
	private static ILprodDao dao = new ILprodDaoImpl();
	private SqlMapClient client;
	private ILprodDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static ILprodDao getInstance() {
		return (dao == null)? dao = new ILprodDaoImpl() : dao;
	}	
	

	@Override
	public List<String> lprodGuInfo() throws SQLException {
		return client.queryForList("lprod.lprodGuInfo");
	}

}
