package kr.or.ddit.service.fileitem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.fileitem.IFileItemDao;
import kr.or.ddit.dao.fileitem.IFileItemDaoImpl;
import kr.or.ddit.vo.FileItemVO;


public class IFileItemServiceImpl implements IFileItemService {
	private static IFileItemService service = new IFileItemServiceImpl();
	private IFileItemDao dao;
	private IFileItemServiceImpl(){
		dao = IFileItemDaoImpl.getInstance();
	}
	
	public static IFileItemService getInstance(){
		return (service==null)? service = new IFileItemServiceImpl() : service;
	}

	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params) {
		FileItemVO vo = null;
		try {
			vo= dao.getFileItemInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<FileItemVO> getFileItemList(Map<String, String> params) {
		List<FileItemVO> list=null;
		try {
			list= dao.getFileItemList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertFileItemInfo(List<FileItemVO> fileItemList) {
		try {
			dao.insertFileItemInfo(fileItemList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateFileItemInfo(FileItemVO fileItemInfo) {
		try {
			dao.updateFileItemInfo(fileItemInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFileItemInfo(Map<String, String> params) {
		try {
			dao.deleteFileItemInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}
