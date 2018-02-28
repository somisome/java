package kr.or.ddit.service.lprod;

import java.sql.SQLException;
import java.util.List;

public interface ILprodService {
	public List<String> lprodGuInfo() throws SQLException;
}
