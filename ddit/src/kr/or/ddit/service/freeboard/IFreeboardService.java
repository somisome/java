package kr.or.ddit.service.freeboard;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;

public interface IFreeboardService {
	public FreeboardVO getFreeboardInfo(Map<String,String> params);
	public List<FreeboardVO> getFreeboardList();
	public String insertFreeboardInfo(FreeboardVO freeboardInfo);
	public void updateFreeboardInfo(FreeboardVO freeboardInfo);
	public void deleteFreeboardInfo(Map<String,String> params);
	
}