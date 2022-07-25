package pack.model;

import java.util.ArrayList;
import pack.controller.TpBean;

public interface TpBoardDaoInter {
	ArrayList<TpDto> getList();
	ArrayList<TpDto> getMyList(String p_id);
	ArrayList<TpDto> getSearch(TpBean bean);
	
	boolean insert(TpBean tpbean);
	TpDto getDetail(String tp_num);
	
	int currentNum();
	int totalCnt();
	boolean updateReadcnt(String tp_num);
	
	//- 게시판 삭제와 댓글 위해 추가
	boolean update(TpBean bean);
	boolean delete(String tp_num);
		
	String selectPass(String tp_num);
		
	boolean updateOnum(TpBean bean);
	boolean insertReply(TpBean bean);
	
}
