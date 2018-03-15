package kr.or.ddit.service.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.dao.fileitem.IFileItemDao;
import kr.or.ddit.dao.fileitem.IFileItemDaoImpl;
import kr.or.ddit.dao.freeboard.IFreeboardDao;
import kr.or.ddit.dao.freeboard.IFreeboardDaoImpl;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;

public class IFreeboardServiceImpl implements IFreeboardService {
	private static IFreeboardService service = new IFreeboardServiceImpl();
	private IFreeboardDao dao;
	private IFileItemDao fileItemDao;
	private IFreeboardServiceImpl(){
		dao = IFreeboardDaoImpl.getInstance();
		fileItemDao = IFileItemDaoImpl.getInstance();
	}
	
	public static IFreeboardService getInstance(){
		return (service==null)? service = new IFreeboardServiceImpl() : service;
	}
	
	
	@Override
	public FreeboardVO getFreeboardInfo(Map<String, String> params) {
		FreeboardVO freeboardInfo = null;
		try {
			freeboardInfo = dao.getFreeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public List<FreeboardVO> getFreeboardList(Map<String,String> params) {
		List<FreeboardVO> freeboardList = null;
		try {
			freeboardList= dao.getFreeboardList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo,FileItem[] items) {
		String bo_no = null;
		try {
			bo_no = dao.insertFreeboardInfo(freeboardInfo);
			List<FileItemVO> fileItemList = AttachFileMapper.mapping(bo_no, items);
			fileItemDao.insertFileItemInfo(fileItemList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bo_no;
	}
	@Override
	public String insertFreeboardReplyInfo(FreeboardVO freeboardInfo) {
		String bo_no = null;
		try {
			bo_no = dao.insertFreeboardReplyInfo(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bo_no;
	}

	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) {
		try {
			dao.updateFreeboardInfo(freeboardInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params) {
		try {
			dao.deleteFreeboardInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
