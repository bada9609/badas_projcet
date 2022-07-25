package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import pack.controller.TdBean;
import pack.controller.TpBean;

@Service
public class TdBoardDaoImpl extends SqlSessionDaoSupport implements TdBoardDaoInter {


	@Autowired
	public TdBoardDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<TpDto> getList() {
		return (ArrayList) getSqlSession().selectList("selectTdList");

	}
	
	//의사 개인 리스트
	@Override
	public ArrayList<TpDto> getMyList(String d_id) {
		return (ArrayList) getSqlSession().selectList("selectTdListMy", d_id);
	}

	@Override
	public boolean insert(TpBean bean) { // 게시물 추가
		int re = getSqlSession().insert("insertTd", bean);
		if (re > 0)
			return true;
		else
			return false;
	}

	@Override // 상세보기
	public TdDto getDetail(String td_num) {
		return getSqlSession().selectOne("selectTdOne", td_num);
	}

	// 페이지
	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int currentNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateReadcnt(String td_num) {
		// TODO Auto-generated method stub
		return false;
	}

	// - 추가

	@Override
	public ArrayList<TpDto> getSearch(TpBean bean) {
		// TODO Auto-generated method stub
		return (ArrayList) getSqlSession().selectList("searchTdList", bean);
	}

	@Override // 게시물 삭제
	public boolean delete(String td_num) {
		int re = getSqlSession().delete("deleteTdData", td_num);
		if (re > 0)
			return true;
		else
			return false;
	}



	@Override
	public String selectPass(String td_num) {
		// 수정용
		return getSqlSession().selectOne("selectPass", td_num);
	}

	@Override
	public boolean update(TdBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateOnum(TpBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

}
