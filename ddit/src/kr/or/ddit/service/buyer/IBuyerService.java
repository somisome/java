package kr.or.ddit.service.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	public BuyerVO getBuyerInfo(Map<String, String> params) throws SQLException;
	public List<BuyerVO> getBuyerList() throws SQLException;
	public String insertBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	public void deleteBuyerInfo(Map<String, String> params) throws SQLException;
	public void updateBuyerInfo(BuyerVO buyerInfo) throws SQLException;
	
	public List<String> getBuyerIdInfo() throws SQLException;
	public List<String> getBuyerLguInfo() throws SQLException;
}
