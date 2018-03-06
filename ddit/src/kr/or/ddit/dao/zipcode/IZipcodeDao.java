package kr.or.ddit.dao.zipcode;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;

public interface IZipcodeDao {
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException;
}
