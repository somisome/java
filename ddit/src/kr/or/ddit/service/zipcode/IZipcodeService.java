package kr.or.ddit.service.zipcode;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;

public interface IZipcodeService {
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException;
}
