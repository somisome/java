package kr.or.ddit.dao.zipcode;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IZipcodeDaoImpl implements IZipcodeDao {
	
	private static IZipcodeDao dao = new IZipcodeDaoImpl();
	
	private SqlMapClient client;
	
	private IZipcodeDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipcodeDao getInstance(){
		return (dao == null) ? dao = new IZipcodeDaoImpl() : dao;
	}
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException{
		return client.queryForList("zipcode.zipcodeList", params);
	}


}
