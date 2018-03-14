package kr.or.ddit.service.idpic;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.IDPictureVO;

public interface IIDPicService {
	public IDPictureVO insertIDPicture(String mem_id, FileItem item);

}
