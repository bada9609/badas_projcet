package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pack.controller.TpBean;

@Repository
public class TpBoardDaoImpl extends SqlSessionDaoSupport implements TpBoardDaoInter {

	@Autowired
	public TpBoardDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public ArrayList<TpDto> getList() {
		return (ArrayList) getSqlSession().selectList("selectTpList");

	}

	// 개인 리스트
	@Override
	public ArrayList<TpDto> getMyList(String p_id) {
		return (ArrayList) getSqlSession().selectList("selectTpListMy", p_id);
	}

	// 검색
	@Override
	public ArrayList<TpDto> getSearch(TpBean bean) {
		// TODO Auto-generated method stub
		return (ArrayList) getSqlSession().selectList("searchList", bean);
	} // null에서 수정

	@Override
	public TpDto getDetail(String tp_num) { // 상세 보기
		return getSqlSession().selectOne("selectOne", tp_num);
	}

	@Override
	public boolean insert(TpBean bean) { // 추가
		int re = getSqlSession().insert("insertData", bean);
		if (re > 0)
			return true;
		else
			return false;
	}

	// 페이지
	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int currentNum() {
		// 가장 큰 번호
		if (getSqlSession().selectOne("currentNum") == null)
			return 0;
		return getSqlSession().selectOne("currentNum");
	}

	@Override
	public boolean updateReadcnt(String tp_num) {
		// TODO Auto-generated method stub
		return false;
	}

	// - 추가

	@Override // 게시물 삭제
	public boolean delete(String tp_num) {
		int re = getSqlSession().delete("deleteData", tp_num);
		if (re > 0)
			return true;
		else
			return false;
	}

	// 댓글등록
	@Override
	public boolean insertReply(TpBean bean) {
		int re = getSqlSession().insert("insertReData", bean);
		if (re > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateOnum(TpBean bean) {
		// 댓글용
		int re = getSqlSession().insert("updateOnum", bean);
		if (re > 0)
			return true;
		else
			return false;
	}

	@Override
	public String selectPass(String tp_num) {
		// 수정용
		return getSqlSession().selectOne("selectPass", tp_num);
	}

	@Override
	public boolean update(TpBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

}
