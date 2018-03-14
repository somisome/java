package kr.or.ddit.dao.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import kr.or.ddit.vo.FreeboardVO;

public interface IFreeboardDao {
	public FreeboardVO getFreeboardInfo(Map<String,String> params) throws SQLException;
	public List<FreeboardVO> getFreeboardList() throws SQLException;
	public String insertFreeboardInfo(FreeboardVO freeboardInfo) throws SQLException;
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws SQLException;
	public void deleteFreeboardInfo(Map<String,String> params) throws SQLException;
}
