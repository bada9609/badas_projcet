package pack.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.shopmember.ShopmemberBean;


@Repository
public class AdminDao extends SqlSessionDaoSupport implements AdminInter {
	
	@Autowired
	public AdminDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	// 회원가입
	public boolean insAdmin(AdminBean sabean) {
		int insAdmin = getSqlSession().insert("insertAdmin", sabean);
		if(insAdmin > 0) {
			return true;
		}else {
			return false;
		}
	}

	//아이디 중복 체크
    @Override
    public int idCheck(String admin_id) {
        int cnt = getSqlSession().selectOne("adminidCheck", admin_id);
        return cnt;
    }
	
	// 로그인 (관리자 전체 불러오기)
	@Override
	public List<AdminDto> AdminList() {
		return getSqlSession().selectList("loginadmin");
	}
	// 로그인2 (입력한 아이디와 동일한 값 찾아서 불러오기)
	@Override
	public AdminDto getLoginInfo(String admin_id) {
		return getSqlSession().selectOne("loginadmindata", admin_id);
	}
	
	//로그아웃
	@Override
	public void salogout(HttpSession session) {
		session.invalidate();
	}
	


}
