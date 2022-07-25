package pack.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.PatientBean;

@Repository
public class PatientDaoImpl extends SqlSessionDaoSupport implements PatientDaoInter {
	
	private SqlSessionTemplate sqlSession;


	// 필수
	@Autowired
	public PatientDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<PatientDto> getDataAll() {
		return getSqlSession().selectList("selectDataAll");
	}

	@Override
	public PatientDto selectPart(String p_number) {
		return getSqlSession().selectOne("selectPart", p_number);
	}

	@Override
	public boolean p_upData(PatientBean p_bean) {
		try {
			getSqlSession().update("updateData", p_bean);
			return true;
		} catch (Exception e) {
			System.out.println("p_upData data:" + e);
			return false;
		}

	}

	@Override
	public boolean p_delData(String p_id) {
		int re = getSqlSession().delete("deletePatientData", p_id);
		if (re > 0)
			return true;
		else
			return false;

	}

	@Override
	public void patientJoinMethod(PatientDto pdto) {
		sqlSession.insert("patient.join", pdto);

	}

	// 로그인
	@Override
	public List<PatientDto> patientList() {
		return getSqlSession().selectList("selectPatientData");
	}

	@Override
	public PatientDto getLoginInfo(String p_id) {
		return getSqlSession().selectOne("selectLoginData", p_id);
	}

	// 개인정보 가져오기
	@Override
	public PatientDto mydata(String p_id) {
		return getSqlSession().selectOne("selectMydata", p_id);
	}

	// 회원가입
	@Override
	public boolean insert(PatientDto pdto) {
		int re = getSqlSession().insert("insertPatient", pdto);
		if (re > 0)
			return true;
		else
			return false;
	}

	// 아이디 중복방지
	@Override
	public PatientDto idcheck(String p_id){
		return getSqlSession().selectOne("checkOverId", p_id);
	}



	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 정보 초기화
		session.invalidate();

	}

	@Override
	public List<PatientDto> patientnum(String p_id) {
		return getSqlSession().selectList("selectPatientNum", p_id);
	}

}
