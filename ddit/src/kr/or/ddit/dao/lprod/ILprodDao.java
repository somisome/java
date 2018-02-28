package kr.or.ddit.dao.lprod;

import java.sql.SQLException;
import java.util.List;

public interface ILprodDao {
	public List<String> lprodGuInfo() throws SQLException;
}
