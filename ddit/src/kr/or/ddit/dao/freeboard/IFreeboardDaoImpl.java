package kr.or.ddit.dao.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;






import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeboardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IFreeboardDaoImpl implements IFreeboardDao {
	
	private static IFreeboardDao dao = new IFreeboardDaoImpl();
	private SqlMapClient client;
	
	private IFreeboardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardDao getInstance(){
		return (dao==null) ? dao = new IFreeboardDaoImpl() : dao ;
	}

	@Override
	public FreeboardVO getFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("freeboard.hitup",params);
		return (FreeboardVO) client.queryForObject("freeboard.freeboardInfo",params);
	}

	@Override
	public List<FreeboardVO> getFreeboardList(Map<String,String> params) throws SQLException{
		return client.queryForList("freeboard.freeboardList",params);
	}

	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		return (String) client.insert("freeboard.insertFreeboard",freeboardInfo);
	}


	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		client.update("freeboard.updateFreeboard",freeboardInfo);
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("freeboard.deleteFreeboardInfo", params);
	}
	
	//댓글의 정보
	//부모글 : bo_grout, bo_seq, bo_depth
	@Override
	public String insertFreeboardReplyInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		String bo_no = null;
		try{
			client.startTransaction();
			String bo_seq;
			if("0".intern()==freeboardInfo.getBo_seq().intern()){
				//현재 댓글의 부모가 루트글
				bo_seq = (String) client.queryForObject("freeboard.incrementSeq",freeboardInfo);
			}else{
				//현재 댓글의 부모가 댓글, 대댓글, 대대댓글...
				client.update("freeboard.updateSeq",freeboardInfo);
				bo_seq = String.valueOf(Integer.parseInt(freeboardInfo.getBo_seq())+1);
			}
			freeboardInfo.setBo_seq(bo_seq);
			freeboardInfo.setBo_depth(String.valueOf(Integer.parseInt(freeboardInfo.getBo_depth())+1));
			
			bo_no = (String) client.insert("freeboard.insertFreeboardReply",freeboardInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return  bo_no;
	}
	
	
	
}
