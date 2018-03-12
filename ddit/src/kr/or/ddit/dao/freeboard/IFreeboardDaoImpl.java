package kr.or.ddit.dao.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeboardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IFreeboardDaoImpl implements IFreeboardDao {
	
	private static IFreeboardDao dao = new IFreeboardDaoImpl();
	private SqlMapClient client;
	
	private IFreeboardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardDao getInstance(){
		return (dao==null) ? dao = new IFreeboardDaoImpl() : dao ;
	}

	@Override
	public FreeboardVO getFreeboardInfo(Map<String, String> params)
			throws SQLException {
		return (FreeboardVO) client.queryForObject("freeboard.freeboardInfo",params);
	}

	@Override
	public List<FreeboardVO> getFreeboardList() throws SQLException{
		return client.queryForList("freeboard.freeboardList");
	}

	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		return (String) client.insert("freeboard.insertFreeboard",freeboardInfo);
	}

	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		client.update("freeboard.updateFreeboard",freeboardInfo);
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("freeboard.deleteFreeboardInfo", params);
	}
	
	
	
}
