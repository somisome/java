package kr.or.ddit.service.idpic;

import java.sql.SQLException;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.dao.idpic.IIDPicDao;
import kr.or.ddit.dao.idpic.IIDPicDaoImpl;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.IDPictureVO;

public class IIDPicServiceImpl implements IIDPicService {
	
	private static IIDPicService service = new IIDPicServiceImpl();
	private IIDPicDao dao;
	private IIDPicServiceImpl(){
		dao = IIDPicDaoImpl.getInstance();
	}
	
	public static IIDPicService getInstance(){
		return (service==null)? service = new IIDPicServiceImpl() : service;
	}

	@Override
	public IDPictureVO insertIDPicture(String mem_id, FileItem item) {
		IDPictureVO idPictureInfo = AttachFileMapper.idPicMapping(mem_id,item);
		try {
			dao.insertIDPicture(idPictureInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idPictureInfo;
	}

	
	


}
