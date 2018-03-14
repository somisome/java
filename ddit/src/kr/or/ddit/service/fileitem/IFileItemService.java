package kr.or.ddit.service.fileitem;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemService {
	public FileItemVO getFileItemInfo(Map<String, String> params) ;
	public List<FileItemVO> getFileItemList(Map<String, String> params) ;
	public void insertFileItemInfo(List<FileItemVO> fileItemList) ;
	public void updateFileItemInfo(FileItemVO fileItemInfo);
	public void deleteFileItemInfo(Map<String, String> params) ;
}
