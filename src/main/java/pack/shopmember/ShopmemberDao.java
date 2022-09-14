package pack.shopmember;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopmemberDao extends SqlSessionDaoSupport implements ShopmemberInter {
	
	@Autowired
	public ShopmemberDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	// 회원가입
	public boolean insShopmember(ShopmemberBean smbean) {
		int insShopmember = getSqlSession().insert("insertShopmember", smbean);
		if(insShopmember > 0) {
			return true;
		}else {
			return false;
		}
	}

	//아이디 중복 체크
    @Override
    public int idCheck(String member_id) {
        int cnt = getSqlSession().selectOne("memberidCheck", member_id);
        return cnt;
    }
    
	// 로그인 (전체 불러오기)
	@Override
	public List<ShopmemberDto> shopmemberList() {
		return getSqlSession().selectList("loginmember");
	}
	// 로그인2 (입력한 아이디와 동일한 값 찾아서 불러오기)
	@Override
	public ShopmemberDto getLoginInfo(String member_id) {
		return getSqlSession().selectOne("loginmemberdata", member_id);
	}
	
	// 로그아웃
	@Override
	public void smlogout(HttpSession session) {
		//세션 정보 초기화
				session.invalidate();
	}

}
