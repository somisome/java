package kr.or.ddit.service.prod;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdVO;

public interface IProdService {
	public ProdVO getProdInfo(Map<String, String> params) throws SQLException;
	public List<ProdVO> getProdList() throws SQLException;
	public String insertProdInfo(ProdVO prodInfo) throws SQLException;
	public void deleteProdInfo(Map<String, String> params) throws SQLException;
	public void updateProdInfo(ProdVO prodInfo) throws SQLException;
}
