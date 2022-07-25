package pack.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import pack.controller.PatientBean;

@Repository
public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDaoInter {
	private SqlSessionTemplate sqlSession;

	// 필수
	public AdminDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 로그인
	@Override
	public List<AdminDto> adminList() {
		return getSqlSession().selectList("selectAdminData");
	}

	@Override
	public AdminDto getAdminData(String a_id) {
		return getSqlSession().selectOne("selectALoginData", a_id);
	}

	// 로그아웃
	@Override
	public void alogout(HttpSession session) {
		// 세션 정보 초기화
		session.invalidate();
	}

	// 환자정보가져오기
	@Override
	public PatientDto selectPart(String p_number) {
		return getSqlSession().selectOne("selectPart", p_number);
	}
	
	// 환자정보 수정하기
	@Override
	public boolean updatePatient(PatientBean p_bean) {
		try {
			getSqlSession().update("updateData",p_bean);
			return true;
		} catch (Exception e) {
			System.out.println("updatePatient err : " + e);
			return false;
		}
	}

	// 환자정보 삭제하기
	@Override
	public boolean ap_delData(String p_number) {
		int re = getSqlSession().delete("adeletePatientData", p_number);
		if (re > 0)
			return true;
		else
			return false;
	}
	
	//의사정보 삭제하기
	@Override
	public boolean ap_ddelData(String d_number) {
		int re = getSqlSession().delete("adeleteDoctorData", d_number);
		if (re > 0)
			return true;
		else
			return false;
	}
}
