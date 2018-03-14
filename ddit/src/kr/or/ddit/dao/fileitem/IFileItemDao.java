package kr.or.ddit.dao.fileitem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemDao {
	
	public FileItemVO getFileItemInfo(Map<String, String> params) throws SQLException;
	public List<FileItemVO> getFileItemList(Map<String, String> params) throws SQLException;
	public void insertFileItemInfo(List<FileItemVO> fileItemList) throws SQLException;
	public void updateFileItemInfo(FileItemVO fileItemInfo) throws SQLException;
	public void deleteFileItemInfo(Map<String, String> params) throws SQLException;
	
}
