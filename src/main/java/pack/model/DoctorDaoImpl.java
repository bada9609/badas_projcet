package pack.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import pack.controller.DoctorBean;
import pack.doctor.DoctorDto;

@Repository
public class DoctorDaoImpl extends SqlSessionDaoSupport implements DoctorDaoInter{
	
	public DoctorDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	//로그인
	@Override
	public List<DoctorDto> doctorList() {
		return getSqlSession().selectList("selectDoctorData");
	}
	
	@Override
	public DoctorDto getLoginInfo(String d_id) {
		return getSqlSession().selectOne("selectDLoginData", d_id);
	}
	
	//개인 의사정보 가져오기
	@Override
	public DoctorDto dmydata(String d_id) {
		return getSqlSession().selectOne("selectdMydata", d_id);
	}
	
	//관리자 수정용 의사정보 가져오기
	@Override
	public DoctorDto selectDoctor(String d_number) {
		return getSqlSession().selectOne("selectDoctor", d_number);
	}
	
	// 아이디 중복방지
	@Override
	public DoctorDto checkdid(String d_id) {
		return getSqlSession().selectOne("checkOverDId", d_id);
	}
	
	// 수정하기
	@Override
	public boolean updateDoctor(DoctorBean dbean) {
		try {
			getSqlSession().update("updateDoctor",dbean);
			return true;
		} catch (Exception e) {
			System.out.println("updateDoctor err :" + e);
			return false;
		}
	}
	
	//의사 정보 입력하기
		@Override
		public boolean insDoctor(DoctorBean dbean) {
			int a = getSqlSession().insert("insertDoctor", dbean);
			if(a > 0) {
				return true;
			}else {
				System.out.println("insertDoctor err : ");
				return false;
			}
			
		}
	
	//로그아웃
	@Override
	public void dlogout(HttpSession session) {
		//세션 정보 초기화
				session.invalidate();
	}

}
