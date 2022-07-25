package pack.model;

import java.util.ArrayList;

import pack.controller.TdBean;
import pack.controller.TpBean;

public interface TdBoardDaoInter {
	
	ArrayList<TpDto> getList();
	//검색
	ArrayList<TpDto> getSearch(TpBean bean);
	//의사 개인리스트
	ArrayList<TpDto> getMyList(String d_id);
	
	boolean insert(TpBean tpbean);
	TdDto getDetail(String td_num);
	
	int currentNum();
	int totalCnt();
	boolean updateReadcnt(String td_num);
	
	//- 게시판 삭제와 댓글 위해 추가
	boolean update(TdBean bean);
	boolean delete(String td_num);
	
	String selectPass(String td_num);
	
	boolean updateOnum(TpBean bean);
}
