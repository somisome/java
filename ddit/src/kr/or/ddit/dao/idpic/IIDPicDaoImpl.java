package kr.or.ddit.dao.idpic;


import java.sql.SQLException;


import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.IDPictureVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IIDPicDaoImpl implements IIDPicDao {
	private static IIDPicDao dao = new IIDPicDaoImpl();
	private SqlMapClient client;
	
	private IIDPicDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IIDPicDao getInstance(){
		return (dao==null) ? dao = new IIDPicDaoImpl() : dao ;
	}

	@Override
	public void insertIDPicture(IDPictureVO idPictureInfo) throws SQLException {
		client.insert("idPic.insertIDPicture",idPictureInfo);
	}


	
	
	
}
