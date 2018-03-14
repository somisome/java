package kr.or.ddit.dao.fileitem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FileItemVO;

public class IFileItemDaoImpl implements IFileItemDao {
	
	private static IFileItemDao dao = new IFileItemDaoImpl();
	private SqlMapClient client;
	
	private IFileItemDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFileItemDao getInstance(){
		return (dao==null) ? dao = new IFileItemDaoImpl() : dao ;
	}

	
	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params)
			throws SQLException {
		return (FileItemVO) client.queryForObject("fileItem.fileItemInfo",params);
	}

	@Override
	public List<FileItemVO> getFileItemList(Map<String, String> params)
			throws SQLException {
		return null;
	}

	@Override
	public void insertFileItemInfo(List<FileItemVO> fileItemList)
			throws SQLException {
		//commit : 첫번째 인서트 (성공), 두번째 인서트 (성공)
		//			startTransaction() -> commitTransaction() -> endTransaction()
		
		//rollback: 첫번째 인서트 (성공), 두번째 인서트 <실패>
		//			startTransaction() -> endTransaction()
		try{
			client.startTransaction();
			for(FileItemVO fileItemInfo : fileItemList){
				client.insert("fileItem.insertFileItem",fileItemInfo);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

	@Override
	public void updateFileItemInfo(FileItemVO fileItemInfo) throws SQLException {
		
	}

	@Override
	public void deleteFileItemInfo(Map<String, String> params)
			throws SQLException {
		
	}

}
