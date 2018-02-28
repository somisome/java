package kr.or.ddit.dao.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

public interface IProdDao {
	public ProdVO getProdInfo(Map<String, String> params) throws SQLException;
	public List<ProdVO> getProdList() throws SQLException;
	public String insertProdInfo(ProdVO prodInfo) throws SQLException;
	public void deleteProdInfo(Map<String, String> params) throws SQLException;
	public void updateProdInfo(ProdVO prodInfo) throws SQLException;
	public HashMap<String, Object> prodInfoMap(Map<String,String> params) throws SQLException;
	public List<String> prodLguInfo() throws SQLException;
	public List<String> prodBuyerInfo() throws SQLException;
}
