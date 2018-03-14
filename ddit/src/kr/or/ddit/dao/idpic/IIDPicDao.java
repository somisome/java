package kr.or.ddit.dao.idpic;

import java.sql.SQLException;


import kr.or.ddit.vo.IDPictureVO;

public interface IIDPicDao {
	public void insertIDPicture(IDPictureVO idPictureInfo) throws SQLException;
}
